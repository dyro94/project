    use strict;
    use warnings;
    print "Enter the Text...>\n";
   my  $var=<>;
    chomp($var);
   
    if($var)
    {
     if($var=~/e,*x,*c,*e,*l,*e,*r,*o,*n/)
      {
        print "true\n";
       }
       else{
             print "false\n";
           }
}  
 


