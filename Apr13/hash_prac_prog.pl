    use strict;
    use warnings;
use Scalar::Util qw(looks_like_number);
=pod
    my %hash=(
            "rohan"=>"ghosh",
            "soham"=>"ghosh",
            "tapan"=>"das"
         );
    
#my @arr=@hash{"rohan","tapan"};
#print "@arr\n";



#my @arr=('lirs','fools','certain politicians');
my $var=scalar %hash;
print "$var\n";
=cut
=pod
  my  @array=qw (rohan 1 2 3 4);
  print "@array\n";
  $array[5]="rohan";
  print "@array\n";
  
=cut
$, ="---";

my @array=(1,2,3,4,5);
my $n = (1,2,3,4);
print $n,"\n";
  print @array;
  print "\n";
                        $" ="...";
  print "@array\n";
                        $" ="[]";
 print "(1,2,3,4,5)"; 


