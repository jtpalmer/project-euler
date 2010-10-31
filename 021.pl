#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Math::Factor::XS qw(factors);
use List::Util qw(sum);
use Memoize;

memoize('d');

sub d {
    my ($n) = @_;
    my @factors = factors($n);
    unshift @factors, 1;
    return sum @factors;
}

say sum grep { $_ != d($_) && $_ == d(d($_)) } 2 .. 9_999;
