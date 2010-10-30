#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Memoize;

memoize('fib');

sub fib {
    my ($n) = @_;
    return $n if $n < 2;
    return fib( $n - 1 ) + fib( $n - 2 );
}

my $sum;
my $n = 0;
while ( ( my $f = fib($n) ) <= 4_000_000 ) {
    $n++;
    next if $f % 2 == 1;
    $sum += $f;
}

say $sum;
