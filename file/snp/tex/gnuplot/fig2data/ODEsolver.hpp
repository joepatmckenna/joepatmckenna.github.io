#ifndef ODESOLVER_HPP_
#define ODESOLVER_HPP_

using namespace std;

#include <stdio.h>
#include <math.h>
#include <string>
#include <cvode/cvode.h>             /* prototypes for CVODE fcts., consts. */
#include <nvector/nvector_serial.h>  /* serial N_Vector types, fcts., macros */
#include <cvode/cvode_dense.h>       /* prototype for CVDense */
#include <sundials/sundials_dense.h> /* definitions DlsMat DENSE_ELEM */
#include <sundials/sundials_types.h> /* definition of type realtype */

struct soln_t {
	N_Vector finalY;
	double smin;
	double smax;
	double vmin;
	double vmax;
};

struct soln_t solve(int NEQ, CVRhsFn RHS, double *Y, double RTOL, double *ATOL,
			double T0, double T1, double TINC, int NOUT, void *user_data, FILE *fp);

static void PrintOutput(realtype t, int NEQ, N_Vector y, FILE *fp);

static void PrintFinalStats(void *cvode_mem);

/* Private function to check function return values */
static int check_flag(void *flagvalue, string funcname, int opt);

#endif /* ODESOLVER_HPP_ */
