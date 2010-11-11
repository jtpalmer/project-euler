#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Math::Prime::XS qw(primes);

my @primes = primes(1_000_000);
my %primes = map { $_ => 1 } @primes;

my $prime;
my $max_length = 0;
SEQUENCE: foreach my $a ( 0 .. $#primes ) {
    my $length = 1;
    my $n      = $primes[$a];
    foreach my $b ( $a + 1 .. $#primes ) {
        $n += $primes[$b];
        $length++;
        next SEQUENCE if $n > 1_000_000;
        if ( $primes{$n} && $length > $max_length ) {
            $prime      = $n;
            $max_length = $length;
        }
    }
}
say $prime;
