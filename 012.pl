#!/usr/bin/env perl
use strict;
use warnings;
use 5.0101;
use List::Util qw(reduce);
use Math::Factor::XS qw(factors);

sub triangle {
    my ($n) = @_;
    return ($n * ($n + 1)) / 2;
}

sub num_factors {
    my ($n) = @_;
    my @factors = factors($n);
    return scalar @factors + 2; # Include '1' and '$n'
}

my $n = 1;
while (num_factors(triangle($n)) < 500) { $n++ }
say triangle($n);
