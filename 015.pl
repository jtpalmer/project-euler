#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Memoize;

memoize('routes');

sub routes {
    my ( $x, $y ) = @_;
    return 2 if $x == 1 && $y == 1;
    return $x + 1 if $y == 1;
    return $y + 1 if $x == 1;
    return routes( $x - 1, $y ) + routes( $x, $y - 1 );
}

say routes( 20, 20 );
