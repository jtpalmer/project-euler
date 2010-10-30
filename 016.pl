#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Math::BigInt;
use List::Util qw(sum);

my $two      = Math::BigInt->new(2);
my $exponent = Math::BigInt->new(1000);
my $n        = $two**$exponent;

say sum split( '', $n );
