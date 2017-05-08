
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
if ( $user_input =~ /^(\d{4}-\d{4}-\d{4}-\d{4})$/ ) {
    $user_input =~ s/-//g;
    my @split_each_char = split( //, $user_input );

    #print " @split_each_char\n";
    
    
    my $grand_total1 = 0;
    my $grand_total2 = 0;
    my $grand_total  = 0;
    my $double;
    my $total  = 0;
    my $total1 = 0;
    my $tot=0;

    foreach my $i ( 0.. $#split_each_char ) {
        
        my $int_value = $split_each_char[$i]+1-1;
          

        if ( $i % 2 == 0 ) {
            $double = $int_value*2;
            

               if ( $double=~/\d{2}/ ) {
               
                my @digit = split( //, $double );
                     
               $total = $digit[0] + $digit[1];
                 
                
                  $tot=$tot+$total
            }
            else {

                $total1 = $total1 + $double;

            }
            $grand_total1 = $tot + $total1;

        }
        else {
            $grand_total2 += $int_value;

        }

    }
    $grand_total = $grand_total1 + $grand_total2;
    print "grand total:$grand_total\n";
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

