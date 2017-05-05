=pod
2. Credit Card validation ( XXXX-XXXX-XXXX-XXXX -> Read about credit cards and actual numbers they can contain )
    - Print "Valid Card" or "Invalid Card"
=cut
use strict;
use warnings;
 
print "Enter the Credit Card no:-\n";
my $user_input=<>;
if($user_input=~/\d{4}-\d{4}-\d{4}-\d{4}/){
   print "Valid Credit Card\n";
}else{
   print "Invalid Credit Card\n";
 }
