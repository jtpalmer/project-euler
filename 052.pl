#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use List::MoreUtils qw(all);

sub digits {
    my ($n) = @_;
    my @digits = split //, $n;
    return join( '', sort @digits );
}

my $x = 1;

while (1) {
    my @digits = map { digits( $_ * $x ) } ( 2 .. 6 );

    if ( all { $_ eq $digits[0] } @digits[ 1, $#digits ] ) {
        say $x;
        exit;
    }

    $x++;
}
