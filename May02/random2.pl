use strict;
use warnings;

my %numbers=(
     number_of_sides=>6,
     number_of_rolls=>3
      );
   my  $number=\%numbers;
   random_die_roll($number);
   sub random_die_roll{
        my ($aras)=@_;
        my %args=%$aras;
      my $total;
     my $number_of_sides=$args{'number_of_sides'}||6;
     my $number_of_rolls=$args{'number_of_rolls'}||1;
      foreach(1..$number_of_rolls){
      $total+= 1+int(rand($number_of_sides));
      }
    print "$total \n";
}
     
     
