#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;

sub is_palindrome {
    return $_[0] eq reverse $_[0];
}

for my $sum ( reverse ( 0 .. 999 * 2 ) ) {
    for my $n (reverse ($sum - 999 .. 999)) {
        my $m = $sum - $n;
        my $x = $m * $n;
        if ( is_palindrome($x) ) {
            say $x;
            exit;
        }
    }
}
