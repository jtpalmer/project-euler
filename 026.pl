#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use List::MoreUtils qw(any firstidx);

sub recurring_cycle_length {
    my ( $numerator, $denominator ) = @_;

    my ( @remainders, $remainder );

    while (1) {
        while ( $denominator > $numerator ) { $numerator *= 10 }
        if ( $remainder = $numerator % $denominator ) {
            last if any { $_ == $remainder } @remainders;
            push @remainders, $remainder;
            $numerator = $remainder;
        }
        else {
            last;
        }
    }

    return 0 unless @remainders && $remainder;

    return scalar(@remainders) - firstidx { $_ == $remainder } @remainders;
}

#say for map { $_ . ' ' . recurring_cycle_length( 1, $_ ) } 2 .. 9;

my @lengths = sort { $a->[1] <=> $b->[1] }
    map { [ $_, recurring_cycle_length( 1, $_ ) ] } 2 .. 999;
say $lengths[-1]->[0];
