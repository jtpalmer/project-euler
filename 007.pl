#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Math::Prime::XS 'is_prime';

my $n     = 1;
my $count = 0;

while ( $count < 10_001 ) {
    $n++;
    $count++ if is_prime($n);
}
say $n;
