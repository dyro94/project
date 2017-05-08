
=pod
3. Write a regex to:
    - Remove white-space from start and end position
    - Convert 2 or more spaces to 1
    - Exclude newline with a start spacing
    - Print the output after the above operations
=cut

use strict;
use warnings;
print "Enter the input----->\n";
my $user_input = <>;
chomp($user_input);
$user_input =~ s/^\s+|\s+$//g;
$user_input =~ s/\s+/ /g;
print "$user_input\n";
