use strict;
use warnings;   

=pod
my @arr=("a","e","i","o","u");
# my  @rm=splice(@arr,0,3,("A","B","C"));

 my  @rm=splice(@arr,0,3);

   print "removed item:@rm\n";
  print "@arr\n";
=cut
  my @arr=qw (1 2 3 4);
 my $arr=\@arr;
#print"$arr\n";
my $first=$arr->[0];
print $first;
#my @arra=@$arr;
#print "@arra\n";
