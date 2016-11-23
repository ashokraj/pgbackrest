use 5.010001;
use ExtUtils::MakeMaker;

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile
(
    NAME              => 'pgBackRest::LibC',
    VERSION_FROM      => 'lib/pgBackRest/LibC.pm', # finds $VERSION, requires EU::MM from perl >= 5.5
    AUTHOR            => 'vagrant <vagrant@>',
    LIBS              => [''], # e.g., '-lm'
    DEFINE            => '', # e.g., '-DHAVE_SOMETHING'
    INC               => '-I.', # e.g., '-I. -I/usr/include/other'
    OBJECT            => 'LibC.o factorialx.o', # link all C files
);
