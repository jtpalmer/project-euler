#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;

my $sum;

foreach (1 .. 999) {
    next unless $_ % 3 == 0 || $_ % 5 == 0;
    $sum += $_;
}

say $sum;
