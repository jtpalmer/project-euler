#!/usr/bin/env perl
use strict;
use warnings;
no warnings 'recursion';
use 5.010;
use Memoize;
use List::MoreUtils qw(any);

memoize('_combinations');

my @coins = qw(1 2 5 10 20 50 100 200);

sub _combinations {
    my ( $amount, $coins ) = @_;

    return 0 if $amount < 1;

    my @coins = split( /:/, $coins );

    my $combs = 0;

    $combs++ if any { $_ == $amount } @coins;

    foreach my $coin ( grep { $_ < $amount } @coins ) {
        $combs += combinations( $amount - $coin,
            [ grep { $_ >= $coin } @coins ] );
    }

    return $combs;
}

sub combinations {
    my ( $amount, $coins ) = @_;

    return _combinations( $amount, join( ':', @$coins ) );
}

say combinations( 200, \@coins );
