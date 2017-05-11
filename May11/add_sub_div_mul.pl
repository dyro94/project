use Operation;
use warnings;
use strict;
 
print"Enter first digits------->\n";
my $user_input1=<>;
chomp($user_input1);
print "Enter second digit--->\n"; 
my $user_input2=<>;
chomp($user_input2);
my $obj;
if(($user_input1=~/\d/g) and ($user_input2=~/\d/g)){
  $obj= new Operation($user_input1,$user_input2);
     cal();
  }else{
   print "Invalid input\n";
  }     

sub cal{
$obj->add();
$obj->min();
$obj->mul();
$obj->div();
}
