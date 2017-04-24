=pod
File contents ( Each value is separated by ';' ):
Line1: District
Line2: Time of arrival in 24 format from first place( Bangalore ) to District-D
Line3: Distance in KM from first place( Bangalore ) to the next district in order

Create a data structure to store the above information as needed to solve the following questions
1: Accept a district as input from user ( Assume starting point to be "Bangalore" ),
   i) Print the time of arrival
   ii) Print the duration of the journey
   iii) Print the distance

2: Accept District-D1, District-D2 from user
  i) Print the distance between D1 and D2
  ii) Print the duration for the journey between D1 and D2

NOTE:
1. Start using subroutines for separating generic code
2. Do not hardcode any keys or values
3. This program should work for any number of districts ( Not just restricted to the current input )
=cut
 use strict;
 use warnings;
 my $file_path="/home/dyro/DistrictRoutes.txt";
 open(my $fh, '<:encoding(UTF-8)',$file_path) or die "could not open  the file '$file_path'$!";
my @place;
my @time;
my @distance;
my %hash;
#try to save each line of in diffrent 
my $count=0;
 while (my $row=<$fh>){
     chomp($row);
   my $var=$count++; 
     if($var==0){
       @place=split/;/,$row;
      # print "@arr\n";
  }
   if($var==1){
    @time=split/;/,$row;
  # print "@arr1\n";

    
}

if($var==2){
 @distance=split/;/,$row;

}
}
#creating array
my @array;
foreach my $i(0..$#place){

    my $value=[$time[$i],$distance[$i]];
      $array[$i]=$value;
      $hash{"$place[$i]"}=$array[$i];
}
=pod
print "enter the District name--->";
my $user_input=<>;
chomp($user_input);
info($user_input);

sub info{
      
            my $temp=$_[0];
       foreach my $j(keys%hash){
          if($j eq $temp){
             my $address=$hash{$temp};
#print "$address\n";
            print "Time of arrival from Bangalore to $temp:$address->[0]\n";
              print "Distance from Bangalore to $temp:$address->[1]\n";
               my $hour_min=$address->[0];
               my @hour_min=split/:/,$hour_min;
               my $hour=$hour_min[0];
               my $min=$hour_min[1];
               print "Duration of journey from bangalore to $temp:$hour hour and $min min\n";
               
 
               
               
             
   }
     
     
   
 }
             
}

=cut
print "enter  the first District---->\n";
my $dis_1=<>;
print "enter the second District--->\n";
my $dis_2=<>;

chomp($dis_1);
chomp($dis_2);
info_1($dis_1,$dis_2);
sub info_1{
               my $temp=$_[0];
               my $temp1=$_[1];
            foreach my $i(keys%hash){
                   if ($i eq $temp){
                       foreach my $j(keys%hash){
                                 if ($j eq $temp1){
                     my $ref_add=$hash{$temp};
                     my $ref_add1=$hash{$temp1};
                     my $hour_min_1=$ref_add->[0];
                    
                 my @hour_min_1=split/:/,$hour_min_1;
                    
                     my $hour_min_2=$ref_add1->[0];
                     
                    my @hour_min_2=split/:/,$hour_min_2;
                     my $hour1=$hour_min_1[0];
                     my $hour2=$hour_min_2[0];
                     my $min1=$hour_min_1[1];
     
                     my $min2=$hour_min_2[1];
                     my$min;
                     my $hour;
                     my $distance;  
                     if ( $hour1 gt $hour2){
                               $hour=$hour1-$hour2;
                              if($min1  gt $min2){
                                  my $min=$min1-$min2;
                                  print "Duration of journey between $temp and $temp1 is:$hour hour and $min min\n";

                                }else{
                                       my $min=$min2-$min1;
                                    print "Duration of journey between $temp and $temp1 is:$hour hour and $min min\n";

                                      }
                                
                        }else{
                                
                             $hour=$hour2-$hour1;
                              if($min1  gt $min2){
                                  my $min=$min1-$min2;
                                   print "Duration of journey between $temp1 and $temp1 is:$hour hour and $min min\n";

                                }else{
                                       my $min=$min2-$min1;
                                        print "Duration of journey between $temp1 and $temp1 is:$hour hour and $min min\n";

                                      }
                                 

                     }
              
               my $distance1=$ref_add->[1];
                 my $distance2=$ref_add1->[1];
               
               

               if($distance1 gt $distance2){
                    $distance=$distance1-$distance2;
           print "Distance between $temp and $temp1:$distance km \n";
               } else{
             
                $distance=$distance2-$distance1;
           print "Distance between $temp1 and $temp:$distance km \n";
           
                               
              }     
                     
                     
        }
}
}
}
}                                 