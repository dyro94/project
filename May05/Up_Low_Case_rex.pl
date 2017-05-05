=pod
 Regex Exercises:
1. Write a regex to find out if the first character of a string is uppercase or not
    - Print "True" or "False" along with the character which is in uppercase
=cut 
 use strict;
 use warnings;


print "ENTER THE STRING!!------>\n";

my $user_input=<>;
if ($user_input=~/(^[A-Z])/){
    print "first character  $1 is uppercase\n";
}else {
   print "first character is lowercase \n";
}
   
