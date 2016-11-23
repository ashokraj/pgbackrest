package pgBackRest::LibC;

use 5.010001;
use strict;
use warnings;
require Exporter;

our @ISA = qw(Exporter);

our %EXPORT_TAGS =
(
    'all' =>
        [qw(
            factorial_iterative_c
            factorial_recursive_c
        )]
);

our @EXPORT_OK = (@{$EXPORT_TAGS{'all'}});

our $VERSION = '1.00';

require XSLoader;
XSLoader::load('pgBackRest::LibC', $VERSION);

1;
