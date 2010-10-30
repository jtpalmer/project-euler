#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Memoize;

memoize('seq_length');

sub collatz {
    my ($n) = @_;
    if ( $n % 2 == 0 ) {
        return $n / 2;
    }
    else {
        return 3 * $n + 1;
    }
}

sub seq_length {
    my ($n) = @_;
    return 1 if $n == 1;
    return 1 + seq_length( collatz($n) );
}

my $max = 0;
my $n;
foreach my $x ( 1 .. 999_999 ) {
    my $length = seq_length($x);
    if ( $length > $max ) {
        $max = $length;
        $n   = $x;
    }
}
say $n;
