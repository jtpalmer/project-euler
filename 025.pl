#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Math::BigInt;
use Memoize;

memoize('fib');

sub fib {
    my ($n) = @_;
    return Math::BigInt->new(1) if $n < 3;
    return fib( $n - 1 ) + fib( $n - 2 );
}

my $n = 1;
while ( length( fib($n) ) < 1000 ) {
    $n++;
}
say $n;
