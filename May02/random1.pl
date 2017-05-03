use strict;
use warnings;
  
sub random_die_roll{
      my($number_of_sides,$number_of_rolls)=@_;
          $number_of_sides||=6;
          $number_of_rolls||=1;
          my $total=0;
     foreach(0..$number_of_rolls){
        $total+=1+(rand($number_of_sides));
          }
         return $total;
}
print random_die_roll(6,3),"\n"; 

