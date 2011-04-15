#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Math::Counting;

my $count = 0;

foreach my $n ( 1 .. 100 ) {
    foreach my $r ( 1 .. 100 ) {
        $count++ if combination( $n, $r ) > 1_000_000;
    }
}

say $count;
