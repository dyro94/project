use strict;
use warnings;
package Operation;
 sub new {
            my $class=shift;
            my $user_input1=shift;
            my $user_input2=shift;
            my $self={
             first_input=>$user_input1,
             second_input=>$user_input2
                };
             bless($self,$class);
             return $self;
        }
     

  sub add {
              my $self=shift;
              my $first_in= $self->{first_input}; 
              my $second_in=$self->{second_input};
              my $result=$first_in+$second_in;
              print "addtion of digits---->$result\n";
          } 
   sub min {
              my $self1=shift;
              my $first_in_1= $self1->{first_input};
              my $second_in_1=$self1->{second_input};

                      if($first_in_1 > $second_in_1){
                   my $result=$first_in_1-$second_in_1;
                print "subtraction  of digits---->$result\n";
               }else{
       
                my $result=$second_in_1-$first_in_1;
                print "subtraction  of digits---->$result\n";

       }

          }


  sub mul {
              my $self2=shift;
              my $first_in= $self2->{first_input};
              my $second_in=$self2->{second_input};
              my $result=$first_in*$second_in;
              print "multiplication of digits---->$result\n";
          }


     sub div {
              my  $self3=shift;
              my $first_in= $self3->{first_input};
              my $second_in=$self3->{second_input};
              if($second_in==0){
                  print "Invalid input";
                }else{
              my $result=($first_in/$second_in);
              print "Divition of digits---->$result\n";
                }
          }


1;

  
