#include "ODEsolver.hpp"

#define Ith(v,i)    NV_Ith_S(v,i-1)       /* Ith numbers components 1..NEQ */
#define IJth(A,i,j) DENSE_ELEM(A,i-1,j-1) /* IJth numbers rows,cols 1..NEQ */

struct soln_t solve(int NEQ, CVRhsFn RHS, double *Y, double RTOL, double *ATOL,
			double T0, double T1, double TINC, int NOUT, void *user_data, FILE *fp) {

	realtype reltol, t, tout;
	N_Vector y, abstol;
	void *cvode_mem;
	int flag, iout, i;
	struct soln_t soln;

	y = abstol = NULL;
	cvode_mem = NULL;

	/* Create serial vector of length NEQ for I.C. and abstol */
	y = N_VMake_Serial(NEQ, Y);
	check_flag((void *) y, "N_VNew_Serial", 0);

	abstol = N_VNew_Serial(NEQ);
	check_flag((void *) abstol, "N_VNew_Serial", 0);

	/* Initialize y */
	/* Set the vector absolute tolerance */
	for (i = 0; i < NEQ; i++) {
		Ith(y,i+1) = Y[i];
		Ith(abstol,i+1) = ATOL[i];
	}

	/*	Set scalar relative tolerance */
	reltol = RTOL;

	/* Call CVodeCreate to create the solver memory and specify the
	 * Backward Differentiation Formula and the use of a Newton iteration */
	cvode_mem = CVodeCreate(CV_BDF, CV_NEWTON);
	check_flag((void *) cvode_mem, "CVodeCreate", 0);

	/* input user data */
	CVodeSetUserData(cvode_mem, user_data);

	/* Call CVodeInit to initialize the integrator memory and specify the
	 * user's right hand side function in y'=f(t,y), the inital time T0, and
	 * the initial dependent variable vector y. */
	flag = CVodeInit(cvode_mem, RHS, T0, y);
	check_flag(&flag, "CVodeInit", 1);

	/* Call CVodeSVtolerances to specify the scalar relative tolerance
	 * and vector absolute tolerances */
	flag = CVodeSVtolerances(cvode_mem, reltol, abstol);
	check_flag(&flag, "CVodeSVtolerances", 1);

	/* Call CVDense to specify the CVDENSE dense linear solver */
	flag = CVDense(cvode_mem, NEQ);
	check_flag(&flag, "CVDense", 1);

	/* In loop, call CVode, print results, and test for error.
	 Break out of loop when NOUT preset output times have been reached.  */
	iout = 0;
	tout = T1;
	while (1) {
		flag = CVode(cvode_mem, tout, y, &t, CV_NORMAL);
		PrintOutput(t, NEQ, y, fp);

		if (check_flag(&flag, "CVode", 1))
			break;
		if (flag == CV_SUCCESS) {
			iout++;
			tout += TINC;
		}
		if (iout == NOUT)
			break;
	}

	/* Print some final statistics */
	PrintFinalStats(cvode_mem);

	/* Free y and abstol vectors */
	N_VDestroy_Serial(y);
	N_VDestroy_Serial(abstol);

	/* Free integrator memory */
	CVodeFree(&cvode_mem);

	return soln;
}

static void PrintOutput(realtype t, int NEQ, N_Vector y, FILE *fp) {
	int i;

#if defined(SUNDIALS_EXTENDED_PRECISION)
	fprintf(fp, "%0.4Le ", t);
	for(i=1; i<=NEQ; i++) {
		fprintf(fp, "%14.6Le ", Ith(y,i));
	}
	fprintf(fp, " \n");
#elif defined(SUNDIALS_DOUBLE_PRECISION)
	fprintf(fp, "%0.4le ", t);
	for (i = 1; i <= NEQ; i++) {
		fprintf(fp, "%14.6le ", Ith(y,i));
	}
	fprintf(fp, " \n");
#else
	fprintf(fp, "%0.4e ", t);
	for(i=1; i<=NEQ; i++) {
		fprintf(fp, "%14.6e ", Ith(y,i));
	}
	fprintf(fp, " \n");
#endif

	return;
}

static void PrintFinalStats(void *cvode_mem) {
	long int nst, nfe, nsetups, nje, nfeLS, nni, ncfn, netf, nge;
	int flag;

	flag = CVodeGetNumSteps(cvode_mem, &nst);
	check_flag(&flag, "CVodeGetNumSteps", 1);
	flag = CVodeGetNumRhsEvals(cvode_mem, &nfe);
	check_flag(&flag, "CVodeGetNumRhsEvals", 1);
	flag = CVodeGetNumLinSolvSetups(cvode_mem, &nsetups);
	check_flag(&flag, "CVodeGetNumLinSolvSetups", 1);
	flag = CVodeGetNumErrTestFails(cvode_mem, &netf);
	check_flag(&flag, "CVodeGetNumErrTestFails", 1);
	flag = CVodeGetNumNonlinSolvIters(cvode_mem, &nni);
	check_flag(&flag, "CVodeGetNumNonlinSolvIters", 1);
	flag = CVodeGetNumNonlinSolvConvFails(cvode_mem, &ncfn);
	check_flag(&flag, "CVodeGetNumNonlinSolvConvFails", 1);

	flag = CVDlsGetNumJacEvals(cvode_mem, &nje);
	check_flag(&flag, "CVDlsGetNumJacEvals", 1);
	flag = CVDlsGetNumRhsEvals(cvode_mem, &nfeLS);
	check_flag(&flag, "CVDlsGetNumRhsEvals", 1);

	flag = CVodeGetNumGEvals(cvode_mem, &nge);
	check_flag(&flag, "CVodeGetNumGEvals", 1);

	printf("\nFinal Statistics:\n");
	printf("nst = %-6ld nfe  = %-6ld nsetups = %-6ld nfeLS = %-6ld nje = %ld\n",
			nst, nfe, nsetups, nfeLS, nje);
	printf("nni = %-6ld ncfn = %-6ld netf = %-6ld nge = %ld\n \n", nni, ncfn,
			netf, nge);
}

/*
 * Check function return value...
 *   opt == 0 means SUNDIALS function allocates memory so check if
 *            returned NULL pointer
 *   opt == 1 means SUNDIALS function returns a flag so check if
 *            flag >= 0
 *   opt == 2 means function allocates memory so check if returned
 *            NULL pointer 
 */
static int check_flag(void *flagvalue, string funcname, int opt) {
	int *errflag;

	/* Check if SUNDIALS function returned NULL pointer - no memory allocated */
	if (opt == 0 && flagvalue == NULL) {
		fprintf(stderr,
				"\nSUNDIALS_ERROR: %s() failed - returned NULL pointer\n\n",
				funcname.c_str());
		return (1);
	}

	/* Check if flag < 0 */
	else if (opt == 1) {
		errflag = (int *) flagvalue;
		if (*errflag < 0) {
			fprintf(stderr, "\nSUNDIALS_ERROR: %s() failed with flag = %d\n\n",
					funcname.c_str(), *errflag);
			return (1);
		}
	}

	/* Check if function returned NULL pointer - no memory allocated */
	else if (opt == 2 && flagvalue == NULL) {
		fprintf(stderr,
				"\nMEMORY_ERROR: %s() failed - returned NULL pointer\n\n",
				funcname.c_str());
		return (1);
	}

	return (0);
}
