#!/usr/bin/env perl
use strict;
use warnings;
use 5.0101;
use List::Util 'max';

my $n = 600851475143;

my @f;

my $f = 2;
while ($f < sqrt($n)) {
    while ($n % $f == 0) {
        push @f, $f;
        $n /= $f;
    }
    $f++;
}
push @f, $n if $n != 0;

say max @f;
