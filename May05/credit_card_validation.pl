
=pod

2. Credit Card validation ( XXXX-XXXX-XXXX-XXXX -> Read about credit cards and actual numbers they can contain )
    - Print "Valid Card" or "Invalid Card"
=cut

use strict;
use warnings;

use Scalar::Util qw(reftype);
print "Enter the Credit Card no:-\n";
my $user_input = <>;
chomp($user_input);
if ( $user_input =~ /\d{4}-\d{4}-\d{4}-\d{4}/ ) {
    $user_input =~ s/-//g;
    my @split_each_char = split( //, $user_input );

    #print " @split_each_char\n";

    my $string_con;
    my $grand_total1 = 0;
    my $grand_total2 = 0;
    my $grand_total  = 0;
    my $double;
    my $total  = 0;
    my $total1 = 0;

    foreach my $i ( 0 .. $#split_each_char ) {

        my $int_value = $split_each_char[$i] + 1 - 1;

        if ( $i % 2 == 0 ) {
            $double = $int_value + $int_value;

            if ( $double =~ /\d{2}/ ) {
                $string_con = "$double";
                my @digit = split( //, $string_con );

                my $int;
                my $temp;
                foreach my $i ( 0 .. $#digit ) {
                    $temp = $digit[$i];
                    $int  = $temp + 1 - 1;

                    $total = $total + $int;

                }

            }
            else {

                $total1 = $total1 + $double;

            }
            $grand_total1 = $total + $total1;

        }
        else {
            $grand_total2 += $int_value;

        }

    }
    $grand_total = $grand_total1 + $grand_total2;
    print "$grand_total\n";
    if ( $grand_total % 10 == 0 ) {
        print "Valid Credit Card\n";
    }
    else {
        print "Invalid Credit Card\n";
    }
}
else {
    print "Invalid Credit Card\n";
}

