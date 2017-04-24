 use strict;
 use warnings;
 my $file_path="/home/dyro/DistrictRoutes.txt";
 open(my $fh, '<:encoding(UTF-8)',$file_path) or die "could not open  the file '$file_path'$!";
my @arr;
my @arr1;
my @arr2;
my %hash;
#try to save each line of in diffrent 
my $count=0;
 while (my $row=<$fh>){
     chomp($row);
   my $var=$count++; 
     if($var==0){
       @arr=split/;/,$row;
      # print "@arr\n";
  }
   if($var==1){
    @arr1=split/;/,$row;
  # print "@arr1\n";

    
}

if($var==2){
 @arr2=split/;/,$row;
#print "@arr2\n";
}
}
#creating array
my @array;
foreach my $i(0..$#arr){
#for(my $i=0;$i<=$#arr;$i++){
    my $value=[$arr1[$i],$arr2[$i]];
      $array[$i]=$value;
}
=pod
foreach my $j(0..$#array){
print"$array[$j]\n";
   
}
=cut
#creating hash
foreach my $j(0..$#arr){
 $hash{"$arr[$j]"}=$array[$j];
}
=pod
while((my $key, my $value)=each(%hash)){
  print $key.",".$value."\n";
}
=cut
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
   }
     
     
   
 }
             
}




