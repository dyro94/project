      print "enter the order of matrix..\n";
      my @mat=(());
     my  $var=<>;
      chomp $var;
      print "enter the coeffiient \n";
      foreach my $i (0..$var-1){
            foreach my $j (0..$var-1){
               chomp($mat[$i][$j]=<>)
        }
     }
     foreach my $i (0..$var-1){
            foreach my $j (0..$var-1){
               print "$mat[$i][$j]";
               print ' ';
        }
       print "\n";
     }
   for($i=0; $i<$var ;$i++)
    {
        $sum=$sum+$mat[$i][$i];
        $a=$a+$mat[$i][$var-$i-1];
     }
    print "Digonal 1:$sum\n";
    print "Digonal 2:$a\n";
 
             
         

