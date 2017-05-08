
=pod
4. Date validation ( DD-MM-YYYY, DD/MM/YYYY, DDMMYYYY )
    - Print "Valid Date" or "Invalid Date" and print the date in the format "DD Month YYYY"
    - Example: Input: 05-05-2017 Output: Valid Date - 05 May 2017
=cut

use strict;
use warnings;

print "Enter the input------>\n";
chomp( my $user_input_1 = <> );
my $output_date = $user_input_1;
if ( $user_input_1 =~ /(\d{2}-\d{2}-\d{4}|\d{2}\/\d{2}\/\d{4}|\d{8})/ ) {

    #print "the user date is $1  \n";

    $user_input_1 =~ s/\D//g;
    my $user_input = $user_input_1;
    my $u_in       = $user_input;
    my $user_in    = $user_input;
    my @array      = split( //, $u_in );
    my ( $mon_1_digit, $mon_2_digit ) = splice( @array, 2, 2 );

    my $month = $mon_1_digit * 10 + $mon_2_digit;
    print "month:$month\n";
    if ( $month =~ /^([469]|11)$/ ) {
        print "Months with 31 $month\n";
        if ( $user_input =~ /^([0-2][0-9]|3[0-1])/ ) {
            print "user date is $output_date\n";
        }
        else {
            print "wrong date\n";
        }
    }
    elsif ( $month =~ /^([13578]|10|12)$/ ) {

        print "Months with 30 $month\n";
        if ( $user_input =~ /^([0-2][0-9]|30)/ ) {
            print "user input is $output_date\n";
        }
        else {
            print "wrong date\n";
        }
    }
    elsif ( $month == 2 ) {

        my $return_value = leap_year_veri($user_in);

        if ( $return_value == 1 ) {
            if ( $user_input =~ /^([0-2][0-9])/ ) {
                print "user input is $output_date\n";
            }
            else {
                print "wrong date\n";
            }

        }
        else {
            if ( $user_input =~ /^([0-2][0-8])/ ) {
                print "user input is $output_date\n";
            }
            else {
                print "wrong date\n";
            }

        }
    }
    else {
        print "wrong month\n";
    }

}
else {
    print "date format invalid\n";
}

sub leap_year_veri {
    my $user_in = $_[0];
    $user_in =~ /(\d{4}$)/;
    my $year = $1;
    if ( $year % 4 == 0 ) {
        if ( $year % 100 == 0 ) {
            if ( $year % 400 == 0 ) {
                return 1;
            }
            else {
                return 0;

            }
        }
        else {
            return 1;
        }
    }
    else {

        return 0;

    }

}

