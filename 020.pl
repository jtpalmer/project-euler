#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Math::BigInt;
use List::Util qw(sum);

my $n = Math::BigInt->new(100);
my $x = $n->bfac();
say sum split( //, $x );
