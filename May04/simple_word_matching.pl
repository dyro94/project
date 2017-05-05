use strict;
use warnings;


if ("hello world"=~/world/){
  print "it's matches\n";
}else{
   print "it does't matches\n";
 
    }




 if ("hello world"!~/world/){
    print "it does't matches!!\n";
    }else{ 
     print "it matches!!\n";

       }





  my $var="rohan";
  if ("hello my name ids rohan !!"=~m !$var!)
{
 print "it's matches\n";
}
else
{
 print "itt's does't matches\n";
}




$_="hi my name is soham";
if(/rohan/){
 print "it's matches\n";
}else{
 print "it's does't match\n";
 }






if("[2+2]=4"=~/\[2\+2\]/){

 print "matched\n";
 
}else{
print "not matched\n";
}





if("The interval is [0,1)."=~/\[0,1\)\./){
 print "matched\n";
}else{
 print "not matched\n";
}

if( "#!/usr/bin/perl"=~/\/perl/){
 print "matched\n";
 
}else
{
print "not matched\n";
 }

 
if( 'C:\WIN32' =~/C:\\WIN32/){
 print "matched\n";
 
}
 else
{
 print "not matched\n";
}




my $var= "house";
if ("housecat"=~/${var}cat/){
   print"match!!\n";
}else{
 print "not match!!\n";
}


my $var ="rohan";
if ("ghoshrohan"=~/ghosh$var/){
    print "matchh\n";
}
 else
{
  print "not match\n";
}

 
 if("rohan ghosh\n"=~/ghosh$/){
    print "matched\n";
 }
else 
{
   print "not match\n";
}



  if ("rohanrohan"=~/^rohan.+rohan$/){ 
 print "match\n";
 }
 else 
{
 print "not match \n";
}









 


      

