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

if  (eval {require ExtUtils::Constant; 1}) {
  # If you edit these definitions to change the constants used by this module,
  # you will need to use the generated const-c.inc and const-xs.inc
  # files to replace their "fallback" counterparts before distributing your
  # changes.
  my @names = (qw(DUDEMAN), qw(UVSIZE),
            #   {name => 'DUDESTRING', type => 'PV'},
              {name => "BackwardScanDirection", macro=>"1"},
              {name => "ForwardScanDirection", macro=>"1"},
              {name => "NoMovementScanDirection", macro=>"1"});

ExtUtils::Constant::WriteConstants
(
    NAME => 'pgBackRest::LibC',
    NAMES        => \@names,
                                     DEFAULT_TYPE => 'IV',
                                     C_FILE       => 'const-c.inc',
                                     XS_FILE      => 'const-xs.inc',
                                  );

}
else
{
    die "NO FALLBACK - ExtUtils::Constant is required!";
#   use File::Copy;
#   use File::Spec;
#   foreach my $file ('const-c.inc', 'const-xs.inc') {
#     my $fallback = File::Spec->catfile('fallback', $file);
#     copy ($fallback, $file) or die "Can't copy $fallback to $file: $!";
#   }
}
