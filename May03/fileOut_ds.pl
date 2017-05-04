=pod
i) Dump the "lshw" linux command output into a file.
ii) Read the file and form a DS
iii) Take input from user and print the details of particular input
  eg: 
  Input: memory
  Output:
          description -> System memory
          physical id ->  0
          size ->7852MiB
=cut
use strict;
use warnings;



my $filename='output.txt';
open (my $fh ,'>',$filename) or die "could not open the file $filename$!";
close $fh;
`lshw > output.txt`;

open my $fh1, '<', "output.txt" or die "can't read file filename[$!]\n";
my $document = do { local $/; <$fh1> };

close $fh1;
my @split_element = split( '\*-', $document );
my $char = "\n";
my %key_value;
foreach my $i ( 0 .. $#split_element ) {

    my $index = index( $split_element[$i], $char );

    my $key = substr( $split_element[$i], 0, $index );
    $key_value{"$key"} = "$split_element[$i]";

}
close $fh1;

info_1();

sub info_1 {
    print "what you want to do??---> 1>GO FOR QUESTION 2>EXIT\n";
    my $input = <>;
    if ( $input == 1 ) {
        info();
    }
    elsif ( $input == 2 ) {
        exit;
    }

   info();
}
 sub info {
        print "enter your query\n";
        my $user_input = <>;

        chomp($user_input);
        if ( $key_value{"$user_input"} ) {
            print $key_value{"$user_input"}, "\n";

        }
        else {
            print "Invalid Input\n";
        }
        info_1();

    }

