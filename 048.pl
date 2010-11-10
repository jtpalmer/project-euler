#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Math::BigInt;

my $digits = 0;
foreach my $n ( 1 .. 1000 ) {
    $n = Math::BigInt->new($n);
    $digits += $n->bmodpow( $n, 10_000_000_000 );
}
printf( "%010d\n", $digits % 10_000_000_000 );
