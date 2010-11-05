#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;

sub is_palindrome {
    my ($n) = @_;

    my $length = length($n);
    foreach my $d ( 0 .. $length / 2 ) {
        if ( substr( $n, $d, 1 ) ne substr( $n, $length - $d - 1, 1 ) ) {
            return 0;
        }
    }

    return 1;
}

my $sum;

foreach my $n ( 1 .. 999_999 ) {
    if ( is_palindrome($n) && is_palindrome( sprintf( '%b', $n ) ) ) {
        $sum += $n;
    }
}

say $sum;
