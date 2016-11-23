####################################################################################################################################
# pgBackRest-LibC.t - Unit tests for the LibC module
####################################################################################################################################
use strict;
use warnings;
use Carp;

use Fcntl qw(O_RDONLY);

# Set number of tests
use Test::More tests => 4;

# Make sure the module loads without errors
BEGIN {use_ok('pgBackRest::LibC')};

# UVSIZE determines the pointer and long long int size.  This needs to be 8 to indicate 64-bit types are available.
ok (UVSIZE == 8, 'UVSIZE == 8');

# Read a block with a valid checksum to test checksum functionality
use pgBackRest::LibC qw(pg_checksum_page);

{
    my $strPageFile = 't/data/page.bin';
    my $iPageSize = 8192;
    my $iPageChecksum = 0x1B99;

    # Load the block into a buffer
    sysopen(my $hFile, $strPageFile, O_RDONLY)
        or confess "unable to open ${strPageFile}";

    sysread($hFile, my $tBuffer, $iPageSize) == $iPageSize
        or confess "unable to reead 8192 bytes from ${strPageFile}";

    close ($hFile);

    # Test the checksum
    my $iPageChecksumTest = pg_checksum_page($tBuffer, 0, $iPageSize);

    ok (
        $iPageChecksumTest == $iPageChecksum,
        'page checksum test (' . sprintf('%X', $iPageChecksumTest) .
        ') == page checksum (' . sprintf('%X', $iPageChecksum) . ')');

    # Now munge the block and make sure the checksum changes
    my $iPageChecksumTest = pg_checksum_page(pack('I', 1024) . substr($tBuffer, 4), 0, $iPageSize);
    my $iPageChecksumMunge = 0xFCFF;

    ok (
        $iPageChecksumTest == $iPageChecksumMunge,
        'page checksum test (' . sprintf('%X', $iPageChecksumTest) .
        ') == page checksum munge (' . sprintf('%X', $iPageChecksumMunge) . ')');
}
