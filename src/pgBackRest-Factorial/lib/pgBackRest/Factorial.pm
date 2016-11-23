package pgBackRest::Factorial;

use 5.022001;
use strict;

use vars  qw($VERSION);
$VERSION = '0.01';

use base qw(DynaLoader);

bootstrap pgBackRest::Factorial $VERSION;

sub factorial_recursive_perl {
    return 1 if $_[0] < 2;
    return $_[0] * factorial_recursive_perl($_[0] - 1);
}

sub factorial_iterative_perl {
    my $return = 1;
    $return *= $_ for 2..$_[0];
    return $return;
}

1;
__END__

=head1 NAME

Book::Factorial - Perl and C, Recursive and Iterative Factorial
Calculation Functions

=head1 SYNOPSIS

  use Book::Factorial;
  $input = 5;
  $result = Book::Factorial::factorial_iterative_c(   $input);
  $result = Book::Factorial::factorial_recursive_c(   $input);
  $result = Book::Factorial::factorial_iterative_perl($input);
  $result = Book::Factorial::factorial_recursive_perl($input);

=head1 DESCRIPTION

This module provides functions to calculate a factorial using
recursive and iterative algorithms, whose internal implementation are
coded in Perl and C.

=head2 EXPORTS

None.

=head1 AUTHORS

Eric Cholet <email address> and Stas Bekman <email address>

=head1 SEE ALSO

perl(1).

=cut
