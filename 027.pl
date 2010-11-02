#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Math::Prime::XS qw(is_prime);
use List::MoreUtils qw(any);

my %prime;
my %not_prime;

sub _is_prime {
    my ($n) = @_;

    return unless $n > 1;

    return   if exists $not_prime{$n};
    return 1 if exists $prime{$n};

    if ( is_prime($n) ) {
        $prime{$n} = 1;
        return 1;
    }
    else {
        $not_prime{$n} = 1;
        return;
    }
}

my $max = 0;
my $product;
for my $a ( -999 .. 999 ) {
    for my $b ( -999 .. 999 ) {
        my $n = 0;
        while ( _is_prime( $n * $n + $a * $n + $b ) ) { $n++ }
        if ( $n > $max ) {
            $max     = $n;
            $product = $a * $b;
        }
    }
}

say $product;
