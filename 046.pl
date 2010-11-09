#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Math::Prime::XS qw(sieve_primes);

my @dsquares = map { 2 * $_ * $_ } 1 .. 100_000;
my %primes = map { $_ => 1 } sieve_primes(100_000);

my $n = 1;
while (1) {
    $n += 2;
    next if defined $primes{$n};
    my $a     = 0;
    my $found = 0;
    while ( !$found && ( my $x = $dsquares[ $a++ ] ) < $n ) {
        if ( defined $primes{ $n - $x } ) {
            $found = 1;
        }
    }
    if ( !$found ) {
        say $n;
        exit;
    }
}
