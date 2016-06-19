COMPILER = gfortran
FLAGS = -O3 # this is an optimizer that makes loops more efficient
DEP = module.f95 function.f95
PROG = quadrature.f95
BIN = quadrature

$(BIN) : quadrature.f95
	$(COMPILER) $(FLAGS) $(DEP) $(PROG) -o $(BIN)
