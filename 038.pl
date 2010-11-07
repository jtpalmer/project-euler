#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;

sub is_pandigital {
    my ($n) = @_;

    foreach my $d ( 1 .. 9 ) {
        return 0 unless $n =~ /$d/;
    }

    return 1;
}

my $largest = 0;
my $n       = 1;
while ( length($n) < 5 ) {
    my $x = '';
    my $i = 1;
    while ( length($x) < 9 ) {
        $x .= $i * $n;
        $i++;
    }
    if ( $i > 1 && length($x) == 9 && is_pandigital($x) && $x > $largest ) {
        $largest = $x;
    }
    $n++;
}
say $largest;
