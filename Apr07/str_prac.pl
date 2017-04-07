print "enter the text-->\n";
     
chomp(my $var=<>);
       
       if($var){
             my $ch='e'; 
              my $res= index($var,$ch);
               
         if ( $res>-1){
            our $off=substr($var,$res+1);
            
            } else{
                print "false\n";
                exit; 
           }
     }
     if($off){
          my $ch1='x';
          my $res1=index($off,$ch1);
        if($res1>-1){
            our $off1=substr($off,$res1+1);
             
           } else{
             print "false\n";
             exit;
              }
              }
            if($off1){
          my $ch2='c';
          my $res2=index($off1,$ch2);
        if($res2>-1){
            our $off2=substr($off1,$res2+1);
            
           } else{
             print "false\n";
             exit;
          }
           }   
     if($off2){
          my $ch3='e';
          my $res3=index($off2,$ch3);
        if($res3>-1){
            our $off3=substr($off2,$res3+1);
             
           } else{
             print "false\n";
             exit;
          }
           }
      if($off3){
          my $ch4='l';
          my $res4=index($off3,$ch4);
        if($res4>-1){
            our $off4=substr($off3,$res4+1);
             
           } else{
             print "false\n";
              exit;
          }
           }
  if($off4){
          my $ch5='e';
          my $res5=index($off4,$ch5);
        if($res5>-1){
            our $off5=substr($off4,$res5+1);
            
           } else{
             print "false\n";
             exit;
          }
           }
      if($off5){
          my $ch6='r';
          my $res6=index($off5,$ch6);
        if($res6>-1){
            our $off6=substr($off5,$res6+1);
             
           } else{
             print "false\n";
             exit;
          }
         }
      if($off6){
          my $ch7='o';
          my $res7=index($off6,$ch7);
        if($res7>-1){
            our $off7=substr($off6,$res7+1);
             
           } else{
             print "false\n";
             exit;
          }
}
      if($off7){
          my $ch8='n';
          my $res8=index($off7,$ch8);
        if($res8>-1){
            our $off8=substr($off7,$res8+1);
           print "true\n";  
           } else{
             print "false\n";
             exit;
          }
}

 
          
   

               
