#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Math::Prime::XS qw(is_prime);

sub f {
    my ($a, $b, $n) = @_;

    return $n * $n  + $a * $n + $b;
}

sub _is_prime {
    return unless $_[0] > 1;
    return is_prime($_[0]);
}

my $max = 0;
my $product;
for my $a (-999 .. 999) {
    for my $b (-999 .. 999) {
        my $n = 0;
        while (_is_prime(f($a, $b, $n))) { $n++ }
        if ($n > $max) {
            $max = $n;
            $product = $a * $b;
        }
    }
}

say $product;
