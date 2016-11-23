#define PERL_NO_GET_CONTEXT

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

#include <factorial.h>

MODULE = pgBackRest::LibC    PACKAGE = pgBackRest::LibC

double
factorial_iterative_c(x)
    int x

double
factorial_recursive_c(x)
    int x
