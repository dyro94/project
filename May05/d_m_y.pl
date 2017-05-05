
=pod
4. Date validation ( DD-MM-YYYY, DD/MM/YYYY, DDMMYYYY )
    - Print "Valid Date" or "Invalid Date" and print the date in the format "DD Month YYYY"
    - Example: Input: 05-05-2017 Output: Valid Date - 05 May 2017
=cut

use strict;
use warnings;

print "Enter the input------>\n";
chomp( my $user_input = <> );
if ( $user_input =~ /(\d{2}-\d{2}-\d{4})|(\d{2}\/\d{2}\/\d{4})|(\d{8})/ ) {
    print "the user date is $1  \n";
}
else {
    print "date is Invalid\n";
}

