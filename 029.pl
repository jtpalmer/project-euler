#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Math::BigInt;

my %distinct;

foreach my $a ( 2 .. 100 ) {
    my $n = Math::BigInt->new($a);
    foreach my $b ( 2 .. 100 ) {
        $n *= $a;
        $distinct{$n} = 1;
    }
}

say scalar keys %distinct;
