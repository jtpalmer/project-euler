#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Math::Prime::XS qw(primes);

my %primes = map { $_ => 1 } primes(999_999);

my @circular;

PRIME: foreach my $prime ( keys %primes ) {
    my $length = length($prime);
    foreach my $r ( 1 .. $length ) {
        my $rotated
            = substr( $prime, $r, $length - $r ) . substr( $prime, 0, $r );
        if ( !exists $primes{$rotated} ) {
            next PRIME;
        }
    }
    push @circular, $prime;
}

say scalar @circular;
