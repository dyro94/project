
=pod
4. Date validation ( DD-MM-YYYY, DD/MM/YYYY, DDMMYYYY )
    - Print "Valid Date" or "Invalid Date" and print the date in the format "DD Month YYYY"
    - Example: Input: 05-05-2017 Output: Valid Date - 05 May 2017
=cut

use strict;
use warnings;

print "Enter the input------>\n";
chomp( my $user_input_1 = <> );
if ( $user_input_1 =~ /(\d{2}-\d{2}-\d{4}|\d{2}\/\d{2}\/\d{4}|\d{8})/ ) {
    #print "the user date is $1  \n";

      $user_input_1=~s/\D//g;
         my $user_input=$user_input_1;
            my   $u_in=$user_input;
           my $user_in=$user_input;
    my @array =split(//,$u_in);
    my ($mon_1_digit,$mon_2_digit)=splice(@array,2,2);
  
    my  $month=$mon_1_digit*10+$mon_2_digit;
    
     
     if($month==4 || 6 || 9 || 11){
         
      if( $user_input=~/^([0-2][0-9]|3[0-1])/){
           print "user date is $user_input_1\n";
           }else{
                  print "wrong date\n";
            }
       }elsif($month==1 || 3 || 5 || 7 || 8 || 10 || 12){
            if($user_input=~/^([0-2][0-9]|30)/){
                      print "user input is $user_input\n";
                    }else{
                          print"wrong date\n";   
                }
      }elsif($month==2){
                
	      my  $return_value=leap_year_veri();
                print "-------$return_value\n";
               if ($return_value==1){
                 if($user_input=~/^([0-2] [0-9])/){
                    print "user input is $user_input\n";
                     }else{
                      print "wrong date\n";
                     }
           
              }  else{
                   if( $user_input=~/^([0-2][0-8])/){
                       print "user input is $user_input\n";
                     }else{
                       print "wrong date\n";
                      }

                  }
              }else{
                      print "wrong month\n";
                   }
         
    sub leap_year_veri{

      $user_in=~/(\d{4}$)/ ;
         my $year=$1;
       if($year%4==0){
              if($year%100==0)
          {
             if($year%400==0){
                  return 1;
                 }else{
                       return 0;

          }
}else{
                   return 1;
            }
   }else{

     return 0;

}



}

}         
          else {
    print "date format invalid\n";
}



       
=pod       
    sub leap_year_veri{  
      
      $user_in=~/(\d{4}$)/ ;
         my $year=$1;
       if($year%4==0){
              if($year%100==0)
          {       
             if($year%400==0){
                  return 1;
                 }else{
                       return 0;
                   
          }
}else{
                   return 1;
            }
   }else{
         
     return 0;
  
}


}
=cut
