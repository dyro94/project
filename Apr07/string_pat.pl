=pod  

 Find the word 'exceleron' from the input string
Eg: 
String 'ehxociielhlsehrkionu' does contain 'exceleron', but the string 'ehxociielhlshrkionu' does not(it's missing a third 'e' in 'exceleron')

Condition: Let p0,p1,..p18 be the respective indices of 'e,h,x,o,c,i,i,e,l,h,l,s,h,r,k,i,o,n,u' in string S. 
If p0 < p1 < p2 < .. <p9 is true, then String contains 'exceleron'.

print 'YES' if the input string contains the word 'exceleron'; otherwise, print 'NO'.

Sample input:
eoxiecreloiirpomn 

Output: 
NO

Explanation:
The string 'eoxiecreloiirpomn' has the word 'exceleron' but it does not satisfy the condition. So the output will be 'NO'
=cut
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
 


