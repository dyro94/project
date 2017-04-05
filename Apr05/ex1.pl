      
     
      my @text=qw(this is garden city bangalore);
      print "before change:@text\n";
      $text[3]='village';
      print"replace city to village:@text\n";
      $text[$text]='that';
      print "change this to that:@text\n";
      #in one statement copy last four element of the array
      ($one,$two,$three,$four)=@text[-4..-1];
      print "last four element of the array:$one $two $three $four\n";
      ($ascalar,@array)=@text[1..3];
      print "print first three element in scalar form:$ascalar\n";
      print "print first three element in array form:@array\n";
      @text=(@array,@text);
      print "this is marged array:@text\n";

