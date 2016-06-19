#ifndef SNP_HPP_
#define SNP_HPP_

using namespace std;

#include <stdio.h>

int f(realtype t, N_Vector y, N_Vector ydot, void *user_data);

struct soln_t solveSnp(double xinit, double yinit, double c, FILE *fp);

#endif /* SNP_HPP_ */
