   if ($^0 eq "unix")
   {
   my  $sep=';';
  }
  else
  {
  my  $sep=':';
   }
  $path=$ENV{PATH};
  @dirs=split $sep,$path;
  print "Number of directories: 
