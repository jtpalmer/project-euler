#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use List::MoreUtils qw(lastidx);
use POSIX qw(floor);

my @digits;
$digits[0] = 1;
$digits[1] = 10;
foreach my $d ( 2 .. 7 ) {
    $digits[$d] = $digits[ $d - 1 ] + $d * ( 10**$d - 10**( $d - 1 ) );
}

sub nth_number {
    my ( $n, $size ) = @_;

    return 10**( $size - 1 ) + $n;
}

sub digit_at {
    my ($p) = @_;

    my $g = lastidx { $p >= $_ } @digits;
    my $size = $g + 1;

    my $pp = $p - $digits[$g];

    my $x = floor( $pp / $size );
    my $r = $pp % $size;

    my $n = nth_number( $x, $size );

    return substr( $n, $r, 1 );
}

my $product = 1;
foreach my $n ( 0 .. 6 ) {
    $product *= digit_at( 10**$n );
}
say $product;
