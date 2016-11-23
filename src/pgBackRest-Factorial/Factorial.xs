#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include <factorial.h>

MODULE = pgBackRest::Factorial		PACKAGE = pgBackRest::Factorial


double
factorial_iterative_c(x)
	int	x

double
factorial_recursive_c(x)
	int	x
