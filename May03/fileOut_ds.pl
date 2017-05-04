use strict;
use warnings;


=pod
my $filename='output.txt';
open (my $fh ,'>',$filename) or die "could not open the file '$filename'$!";
close $fh;
`lshw > output.txt`;
=cut

open my $fh1, '<', "output.txt" or die "can't read file 'filename'[$!]\n";
my $document = do { local $/; <$fh1> };

close $fh1;
my @array = split( '\*-', $document );
my $char = "\n";
my %data_structure;
foreach my $i ( 0 .. $#array ) {

    my $index = index( $array[$i], $char );

    my $key = substr( $array[$i], 0, $index );
    $data_structure{"$key"} = "$array[$i]";

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

    sub info {
        print "enter your query\n";
        my $user_input = <>;

        chomp($user_input);
        if ( $data_structure{"$user_input"} ) {
            print $data_structure{"$user_input"}, "\n";

        }
        else {
            print "Invalid Input\n";
        }
        info_1();

    }
}
