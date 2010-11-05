#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use List::MoreUtils qw(any);

sub gcd {
    my ( $a, $b ) = @_;
    ( $a, $b ) = ( $b, $a ) if $a > $b;
    while ($a) {
        ( $a, $b ) = ( $b % $a, $a );
    }
    return $b;
}

my ( $numerator, $denominator ) = ( 1, 1 );

foreach my $n ( 10 .. 99 ) {
    my @n = split( //, $n );
    foreach my $d ( $n + 1 .. 99 ) {
        my @d = split( //, $d );

        foreach my $z (
            grep {
                my $x = $_;
                any { $_ == $x } @d
            } @n
            )
        {
            next if $z == 0;
            my ($x) = grep { $_ != $z } @n;
            my ($y) = grep { $_ != $z } @d;
            next unless defined $x && defined $y;
            next if $y == 0;
            if ( $n / $d == $x / $y ) {
                $numerator   *= $n;
                $denominator *= $d;
            }
        }
    }
}

say $denominator / gcd( $numerator, $denominator );
