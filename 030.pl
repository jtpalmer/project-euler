#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use List::Util qw(sum);

my %fifth = map { $_ => $_**5 } 0 .. 9;

my $sum;

my $n = 10;
while ( length($n) * $fifth{9} > $n ) {
    if ( $n == sum map { $fifth{$_} } split( //, $n ) ) {
        $sum += $n;
    }
    $n++;
}

say $sum;
