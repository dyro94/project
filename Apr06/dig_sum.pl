

use strict;
use warnings;

print "enter For N*N value for matrix\n";
my $var = <STDIN>;
my @row;
my @col;

for (my $i = 0; $i < $var; $i++) {
   my $numb = <STDIN>;
  push(@row,"$numb");
}

my $low =0;
my $high= $#row;
my $d1=0;
my $d2=0;


for my $i(@row) {
  @col = split(' ',$i);
  $d1 += $col[$low];
  $d2 += $col[$high];
  $low++;
  $high--;
 }

print "sumof diagonal1 :  $d1 \n";
print "sum of diagonal2 : $d2 \n";

