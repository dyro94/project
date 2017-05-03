 use strict;
 use warnings;
 my $result=random_die_roll(10);
  print "$result\n";
 sub random_die_roll{
      my ($number_of_side)=@_;
  my  $number_of_sides||=6;
     return 1+int(rand($number_of_sides));
   }
 
