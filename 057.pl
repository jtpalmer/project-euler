#!/usr/bin/env perl
use 5.010;
use strict;
use warnings;
use Math::BigInt;

my $count = 0;

my ($nx, $dx) = map { Math::BigInt->new($_) } (1, 2);

for ( 1 .. 1000 ) {
    my ($n, $d) = ( $nx + $dx, $dx );

    $count++ if length "$n" > length "$d";

    ($nx, $dx) = ( $dx, 2 * $dx + $nx );
}

say $count;

