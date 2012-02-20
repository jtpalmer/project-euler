#!/usr/bin/env perl
use 5.010;
use strict;
use warnings;
use Math::Bigint;
use Memoize;

memoize('is_palindrome');

sub is_palindrome {
    return $_[0] eq reverse $_[0];
}

sub is_lychrel {
    my $n = shift;

    for ( 1 .. 50 ) {
        $n = $n + Math::BigInt->new( scalar reverse "$n" );

        return 0 if is_palindrome("$n");
    }

    return 1;
}

my $count = 0;

for my $n ( 0 .. 9_999 ) {
    $count++ if is_lychrel( Math::BigInt->new($n) );
}

say $count;

