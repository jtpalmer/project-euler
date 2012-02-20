#!/usr/bin/env perl
use 5.010;
use strict;
use warnings;
use Math::BigInt;
use List::Util qw(sum);

sub digit_sum {
    my ($n) = @_;
    my @digits = split //, $n;
    return sum @digits;
}

my $max = 0;

for $a ( 1 .. 99 ) {
    for $b ( 1 .. 99 ) {
        my $n   = Math::BigInt->new($a)->bpow($b);
        my $sum = digit_sum("$n");
        $max = $sum if $sum > $max;
    }
}

say $max;

