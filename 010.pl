#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Math::Prime::TiedArray;

tie my @primes, "Math::Prime::TiedArray", precompute => 2_000_000;

my $sum = 0;
while ((my $prime = shift @primes) < 2_000_000) {
    $sum += $prime;
}
say $sum;
