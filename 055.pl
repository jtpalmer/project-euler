#!/usr/bin/env perl
use 5.010;
use strict;
use warnings;
use Math::Bigint;

sub is_palindrome {
    return "$_[0]" eq reverse "$_[0]";
}

sub is_lychrel {
    my ($n) = @_;

    my $max = 50;

    for ( 1 .. 50 ) {
        return 0 if $n < 10;

        $n = $n + Math::BigInt->new( reverse "$n" );

        return 1 if is_palindrome($n);
    }

    return 0;
}

my $count = 0;

for my $n ( 0 .. 9_999 ) {
    $count++ if is_lychrel( Math::BigInt->new($n) );
}

say $count;

