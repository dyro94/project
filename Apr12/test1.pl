use strict;
use warnings; 


 my %hash=(
         "rohan"=>"ghosh",
         "rohit"=>"gupta",
         

);

#$hash{'soham'}='ghosh';
#%hash=();
#undef($hash{'soham'});

=pod
while((my $key,my $value)=each(%hash)){
  print $key.",".$value."\n";
}
=cut
#$hash{'rohit'}='das';
=pod
if(%hash){
   
    for my $i(keys%hash){
         



	    if( $i eq 'rohit'){
    $hash{$i}='das';
}
}
}

print "enter the value for rohan---->\n";
chomp(my $var=<>);
if(%hash){
  for my $i(keys%hash){
       if($i eq 'rohan'){
         $hash{$i}="$var";
}
}
}
=cut

if(%hash){
for my $i(keys%hash){
   my $var=$i;
   my $var1= $hash{$i};
  $hash{$var1}=$var;
}

}

delete($hash{'rohan'});
delete($hash{'rohit'});

for my $key(keys%hash){
    print" $key:$hash{$key}\n";

}


#print ".......$hash{'rohan'}......\n";



#y@arr=(1,2,3,4);


