COMPILER = gfortran
FLAGS = -O3 # this is an optimizer that makes loops more efficient
DEP = module.f95 function.f95 subroutine.f95
PROG = rootfind.f95
BIN = rootfind

$(BIN) : rootfind.f95
	$(COMPILER) $(FLAGS) $(DEP) $(PROG) -o $(BIN)
