package pgBackRest::LibC;

use 5.010001;
use strict;
use warnings;
use Carp;

require Exporter;
use AutoLoader;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration use pgBackRest::LibC ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS =
(
    'debug' => [qw(
        UVSIZE
    )],

    'checksum' => [qw(
        pageChecksum
        pageChecksumTest
        pageChecksumBuffer
    )],
);

our @EXPORT_OK = (@{$EXPORT_TAGS{'debug'}}, @{$EXPORT_TAGS{'checksum'}});

# Nothing is exported by default
our @EXPORT = qw();

# !!! This needs to be main version number somehow
our $VERSION = '1.00';

# This AUTOLOAD is used to 'autoload' constants from the constant() XS function.
sub AUTOLOAD
{
    my $constname;
    our $AUTOLOAD;
    ($constname = $AUTOLOAD) =~ s/.*:://;
    croak "&pgBackRest::LibC::constant not defined" if $constname eq 'constant';
    my ($error, $val) = constant($constname);
    if ($error) { croak $error; }
    {
        no strict 'refs';
            *$AUTOLOAD = sub {$val};
    }

    goto &$AUTOLOAD;
}

require XSLoader;
XSLoader::load('pgBackRest::LibC', $VERSION);

1;
__END__
