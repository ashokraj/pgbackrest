####################################################################################################################################
# pgBackRest-LibC.t - Unit tests for the LibC module
####################################################################################################################################
use strict;
use warnings;

# Set number of tests
use Test::More tests => 2;

# Make sure the module loads without errors
BEGIN {use_ok('pgBackRest::LibC')};

# UVSIZE determines the pointer and long long int size.  This needs to be 8 to indicate 64-bit types are available.
ok (UVSIZE == 8, 'UVSIZE == 8');
