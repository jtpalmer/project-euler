#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Math::Prime::XS qw(primes);
use Math::Factor::XS qw(factors);

my %primes = map { $_ => 1 } primes(100_000);

sub _prime_factors {
    my ($n) = @_;

    return grep { $primes{$_} } factors($n);
}

my $count = 0;
my $first;
my $n = 2;
while ( $count != 4 ) {
    if ( _prime_factors($n) == 4 ) {
        $first = $n if $count == 0;
        $count++;
    }
    else {
        $count = 0;
    }
    $n++;
}
say $first;
