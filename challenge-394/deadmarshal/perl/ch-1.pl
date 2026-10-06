#!/usr/bin/env perl
use strict;
use warnings;
use List::Util qw(min);
use Test::More tests => 5;

sub alternate_case{
  my ($s) = @_;
  my @upper;
  push @upper,$-[0] while($s =~ /[A-Z]/g);
  my $cost = sub {
    my ($start) = @_;
    my $total = 0;
    foreach my $i(0..$#upper) {
      my $target = $start + 2 * $i;
      $total += abs($upper[$i] - $target)
    }
    return $total
  };
  min($cost->(0),$cost->(1))
}

is alternate_case('aAbB'),0,'Example 1';
is alternate_case('AAbb'),1,'Example 2';
is alternate_case('AAAbbb'),3,'Example 3';
is alternate_case('aABb'),1,'Example 4';
is alternate_case('bBBAaa'),2,'Example 5';

done_testing();

