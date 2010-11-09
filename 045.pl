#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;

sub triangle {
    my ($n) = @_;
    return $n * ( $n + 1 ) / 2;
}

sub pentagonal {
    my ($n) = @_;
    return $n * ( 3 * $n - 1 ) / 2;
}

sub hexagonal {
    my ($n) = @_;
    return $n * ( 2 * $n - 1 );
}

my ( $ti, $pi, $hi ) = ( 285, 165, 143 );
$ti++;
my ( $t, $p, $h ) = ( triangle($ti), pentagonal($pi), hexagonal($hi) );
while ( $t != $p || $t != $h ) {
    $t = triangle( ++$ti )   until $t >= $p && $t >= $h;
    $p = pentagonal( ++$pi ) until $p >= $t;
    $h = hexagonal( ++$hi )  until $h >= $t;
}
say $t;
