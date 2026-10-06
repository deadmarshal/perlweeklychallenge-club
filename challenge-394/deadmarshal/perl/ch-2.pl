#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 5;

sub iv {return $_[0] =~ /[aeiou]/i ? 1 : 0}

sub alternating_vowels_consonants{
  my ($strs) = @_;
  my ($src,@others) = sort {length $a <=> length $b} @$strs;
  my $max = 0;
  my (@best,%seen);
  my $n = length $src;

  foreach my $i(0..$n-1){
    foreach my $j($i..$n-1){
      last if $j > $i &&
	iv(substr($src,$j,1)) 
	== iv(substr($src,$j-1,1));
      my $len = $j - $i + 1;
      next if $len < $max;

      my $sub = substr($src,$i,$len);
      next if grep {index(lc $_,lc $sub) < 0} @others;

      if($len > $max) {
	$max = $len;
	@best = ();
	%seen = ();
      }
      push @best,$sub unless $seen{$sub}++;
    }
  }
  \@best
}

is_deeply alternating_vowels_consonants(
  ['relocate','delocate','allocate']),['locate'],'Example 1';
is_deeply alternating_vowels_consonants(
  ['apple','banana','cherry']),[],'Example 2';
is_deeply alternating_vowels_consonants(
  ['navigate','cavity','gravity']),['avi'],'Example 3';
is_deeply alternating_vowels_consonants(
  ['pedalgia','pedalboard','pedantic']),['peda'],'Example 4';
is_deeply alternating_vowels_consonants(
  ['schoolmaster','schoolhouse','schooling']),['ho','ol'],'Example 5';

done_testing();

