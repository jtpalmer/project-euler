#!/usr/bin/env perl
use 5.010;
use strict;
use warnings;
use Math::BigRat;

my $count = 0;

my $x = Math::BigRat->new('1/2');

for ( 1 .. 1000 ) {
    my $sum = 1 + $x;

    my ( $n, $d ) = $sum->parts();
    $count++ if length "$n" > length "$d";

    $x = 1 / ( 2 + $x );
}

say $count;

