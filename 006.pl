#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;

my ($sum_of_squares, $square_of_sums);

foreach my $n (1 .. 100) {
    $sum_of_squares += $n * $n;
    $square_of_sums += $n;
}
$square_of_sums = $square_of_sums * $square_of_sums;

say $square_of_sums - $sum_of_squares;
