    sub makeMatrix {
  my ($input) = @_;
  my @mat;
  while (<$input>) {
    if ($input eq ""){
        print "it's blank\n";
        return;
    }
    else{
        push @mat, [ split ];
    }
    return \@mat;
    }
}

my @a = ();
while($a = <>) {
    chomp $a;
    push @a,($a);
    }


@matrices;
push @mat, (makeMatrix(@a));

foreach $input (@matrices){
    print "input was $input\n";

}
      
      
