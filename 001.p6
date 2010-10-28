#!/usr/bin/env perl6
use v6;

my $sum;

for 1 ... 1000 {
    next unless $_ % 3 == 0 || $_ % 5 == 0;
    $sum += $_;
}

say $sum;

# vim: filetype=perl6
