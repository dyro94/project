

use strict;
use warnings;

#use diagnostics;     

=pod
my $filename='output.txt';
open (my $fh ,'>',$filename) or die "could not open the file '$filename'$!";
close $fh;
`lshw > output.txt`;
=cut
 open my $fh,'<',"output.txt" or die "can't read file 'filename'[$!]\n";
my  $document=do {local $/;<$fh>};
=pod 
#print $document."\n";
use Data::Dumper;
our  @array = split ('\*', $document);
print "-----", Dumper \@array,"\n";
print"enter the specification-->\n";
chomp(our $var=<>);


if( $var eq "core"){
 print " $array[1]\n";
  }
if( $var eq "memory"){
 print " $array[2]\n";
}
=cut
=pod
use Data::Dumper;
my %hash=split/[*_]/,$document;
print "....",Dumper \%hash;
=cut
my @array=split ('\*',$document);
my $size=$#array;
#print $size."\n"; 
my $str=$array[1];

my $str=~s/' '/ \=/;
print $str."\n";

#my $x=substr($str,$res-2,1);
#print $x;

#print $res."\n";
