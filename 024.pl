#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Algorithm::Permute;

my $p = Algorithm::Permute->new([0 .. 9]);
my @p;
while (my @r = $p->next()) {
    push @p, join('', @r);
}
@p = sort @p;
say $p[999_999];
