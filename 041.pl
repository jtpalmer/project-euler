#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Math::Prime::XS qw(sieve_primes);
use List::Util qw(first);

sub is_pandigital {
    my ($n) = @_;

    foreach my $d ( 1 .. length($n) ) {
        return 0 unless $n =~ /$d/;
    }

    return 1;
}

say first { is_pandigital($_) } reverse sieve_primes(9_999_999);
