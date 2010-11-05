#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use List::Util qw(sum);

sub factorial {
    my ($n) = @_;
    return 1 if $n <= 1;
    return $n * factorial( $n - 1 );
}

my %factorial = map { $_ => factorial($_) } 0 .. 9;

my $sum;
my $n = 10;
while ( length($n) * $factorial{9} > $n ) {
    my $s = sum map { $factorial{$_} } split( //, $n );
    $sum += $n if $n == $s;
    $n++;
}
say $sum;
