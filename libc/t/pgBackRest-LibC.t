####################################################################################################################################
# pgBackRest-LibC.t - Unit tests for the LibC module
####################################################################################################################################
use strict;
use warnings;
use Carp;

use Fcntl qw(O_RDONLY);

# Set number of tests
use Test::More tests => 8;

# Make sure the module loads without errors
BEGIN {use_ok('pgBackRest::LibC')};

# UVSIZE determines the pointer and long long int size.  This needs to be 8 to indicate 64-bit types are available.
ok (UVSIZE == 8, 'UVSIZE == 8');

# Read a block with a valid checksum to test checksum functionality
require pgBackRest::LibC;
pgBackRest::LibC->import(qw(pageChecksum pageChecksumBuffer));

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
    my $iPageChecksumTest = pageChecksum($tBuffer, 0, $iPageSize);

    ok (
        $iPageChecksumTest == $iPageChecksum,
        'page checksum test (' . sprintf('%X', $iPageChecksumTest) .
        ') == page checksum (' . sprintf('%X', $iPageChecksum) . ')');

    # Test the checksum on a different block no
    $iPageChecksumTest = pageChecksum($tBuffer, 1, $iPageSize);
    my $iPageChecksumBlockNo = $iPageChecksum + 1;

    ok (
        $iPageChecksumTest == $iPageChecksumBlockNo,
        'page checksum test (' . sprintf('%X', $iPageChecksumTest) .
        ') == page checksum blockno (' . sprintf('%X', $iPageChecksumBlockNo) . ')');

    # Now munge the block and make sure the checksum changes
    $iPageChecksumTest = pageChecksum(pack('I', 1024) . substr($tBuffer, 4), 0, $iPageSize);
    my $iPageChecksumMunge = 0xFCFF;

    ok (
        $iPageChecksumTest == $iPageChecksumMunge,
        'page checksum test (' . sprintf('%X', $iPageChecksumTest) .
        ') == page checksum munge (' . sprintf('%X', $iPageChecksumMunge) . ')');

    # Pass a valid page buffer
    my $tBufferMulti =
        $tBuffer .
        substr($tBuffer, 0, 8) . pack('S', $iPageChecksum + 1) . substr($tBuffer, 10) .
        substr($tBuffer, 0, 8) . pack('S', $iPageChecksum - 2) . substr($tBuffer, 10) .
        substr($tBuffer, 0, 8) . pack('S', $iPageChecksum - 1) . substr($tBuffer, 10);

    ok (pageChecksumBuffer($tBufferMulti, $iPageSize * 4, 0, $iPageSize), 'pass valid page buffer');

    # Reject an invalid page buffer
    $tBufferMulti =
        substr($tBuffer, 0, 8) . pack('S', $iPageChecksum + 1) . substr($tBuffer, 10);

    ok (!pageChecksumBuffer($tBufferMulti, $iPageSize, 0, $iPageSize), 'reject invalid page buffer');

    # Reject an misaligned page buffer
    ok (!pageChecksumBuffer($tBuffer . substr($tBuffer, 1), $iPageSize * 2, 0, $iPageSize), 'reject misaligned page buffer');
}
