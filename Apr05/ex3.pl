       print "today  is ",(sun,mon,tue,wed,thurs,fri,sat) [(localtime)[6]],"day\n";
       @week=qw(sun mon tue thurs fri sat);
       @time=localtime;
       $weekday=$time[6];
       print "today is $week[$weekday]day\n";

