use strict;
use warnings;
print "Enter the input----->\n";
my $user_input=<>;
chomp($user_input); 
$user_input=~s/^\s+|\s+$//g;
$user_input=~s/ +/ /g;
print "$user_input\n";
