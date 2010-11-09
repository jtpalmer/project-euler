#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Text::CSV;
use List::Util qw(sum max);

sub triangle_numbers {
    my ($max) = @_;
    my @triangles;
    my $n = 1;
    while ( ( my $t = $n * ( $n + 1 ) / 2 ) <= $max ) {
        push @triangles, $t;
        $n++;
    }
    return @triangles;
}

sub word_value {
    my ($word) = @_;
    return sum map { ord($_) - 64 } split( //, $word );
}

my $csv = Text::CSV->new();
open my $fh, '<', 'words.txt' or die $!;
my @words     = @{ $csv->getline($fh) };
my @values    = map { word_value($_) } @words;
my %triangles = map { $_ => 1 } triangle_numbers( max @values );
say scalar grep { defined $triangles{$_} } @values;
