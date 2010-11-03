#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;

sub diagonal_sum {
    my ($s) = @_;

    return 1 if $s == 1;

    my $sum = 1;
    my $n   = 1;

    if ( $s % 2 == 1 ) {
        foreach my $x ( map { $_ * 2 } 1 .. ( $s - 1 ) / 2 ) {
            foreach my $y ( 0 .. 3 ) {
                $n   += $x;
                $sum += $n;
            }
        }
    }
    else {
        die "This problem doesn't involve even numbers";
    }

    return $sum;
}

say diagonal_sum(1001);
