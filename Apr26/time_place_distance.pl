
=pod
File contents ( Each value is separated by ';' ):
Line1: District
Line2: Time of arrival in 24 format from first place( Bangalore ) to District-D
Line3: Distance in KM from first place( Bangalore ) to the next district in order

Create a data structure to store the above information as needed to solve the following questions
1: Accept a district as input from user ( Assume starting point to be "Bangalore" ),
   i) Print the time of arrival
   ii) Print the duration of the journey
   iii) Print the distance

2: Accept District-D1, District-D2 from user
  i) Print the distance between D1 and D2
  ii) Print the duration for the journey between D1 and D2

NOTE:
1. Start using subroutines for separating generic code
2. Do not hardcode any keys or values
3. This program should work for any number of districts ( Not just restricted to the current input )
=cut

use strict;
use warnings;
my $file_path = "DistrictRoutes.txt";
open( my $fh, '<:encoding(UTF-8)', $file_path )
  or die "could not open  the file '$file_path'$!";

my @place;
my @time;
my @distance;
my %data_structure;

my $count = 0;
while ( my $row = <$fh> ) {
    chomp($row);
    my $line = $count++;
    if ( $line == 0 ) {
        @place = split /;/, $row;

    }
    if ( $line == 1 ) {
        @time = split /;/, $row;

    }

    if ( $line == 2 ) {
        @distance = split /;/, $row;

    }

}
close $fh;
my @array_ref;
foreach my $i ( 0 .. $#place ) {

    my $value = [ $time[$i], $distance[$i] ];
    $array_ref[$i] = $value;
    $data_structure{"$place[$i]"} = $array_ref[$i];
}

print "enter the District name--->";
my $user_input = <>;
chomp($user_input);
info($user_input);

sub info {

    my $place = $_[0];

    my $address = $data_structure{$place};

    print "Time of arrival from Bangalore to $place:$address->[0]\n";

    #print "Distance from Bangalore to $place:$address->[1]\n";
    my $total_distance = 0;
    foreach my $i ( 0 .. $#distance ) {

        if ( $distance[$i] != $address->[1] ) {
            $total_distance = $total_distance + $distance[$i];
        }
        else {
            my $final_distance = $total_distance + $address->[1];
            print "Distance from Bangalore to $place=$final_distance km\n";
        }
    }

    my $hour_min = $address->[0];
    my @hour_min = split /:/, $hour_min;
    my $hour     = $hour_min[0];
    my $min      = $hour_min[1];
    print
      "Duration of journey from bangalore to $place:$hour hour and $min min\n";
}

print "enter  the first District---->\n";
my $dis_1 = <>;
chomp($dis_1);
print "enter the second District--->\n";
my $dis_2 = <>;
chomp($dis_2);

chomp($dis_1);
chomp($dis_2);
info_1( $dis_1, $dis_2 );

sub info_1 {
    my $district  = $_[0];
    my $district1 = $_[1];

    my $ref_add = $data_structure{$district};

    my $ref_add1   = $data_structure{$district1};
    my $hour_min_1 = $ref_add->[0];

    my @hour_min_1 = split /:/, $hour_min_1;

    my $hour_min_2 = $ref_add1->[0];

    my @hour_min_2 = split /:/, $hour_min_2;

    my $hour1 = $hour_min_1[0];
    my $hour2 = $hour_min_2[0];
    my $min1  = $hour_min_1[1];

    my $min2 = $hour_min_2[1];
    my $min;
    my $hour;
    my $distance;
    if ( $hour1 >= $hour2 ) {
        $hour = $hour1 - $hour2;
        if ( $min1 >= $min2 ) {
            my $min = $min1 - $min2;
            print
"Duration of journey between $district and $district1 is:$hour hour and $min min\n";

        }
        else {
            my $min = $min2 - $min1;
            print
"Duration of journey between $district1 and $district is:$hour hour and $min min\n";

        }

    }
    else {

        $hour = $hour2 - $hour1;
        if ( $min1 >= $min2 ) {
            my $min = $min1 - $min2;
            print
"Duration of journey between $district and $district1 is:$hour hour and $min min\n";

        }
        else {
            my $min = $min2 - $min1;
            print
"Duration of journey between $district1 and $district is:$hour hour and $min min\n";

        }

    }

    my $input_index1;
    my $input_index2;
    foreach my $i ( 0 .. $#distance ) {

        if ( $distance[$i] == $ref_add->[1] ) {
            $input_index1 = $i;

        }

        if ( $distance[$i] == $ref_add1->[1] ) {
            $input_index2 = $i;

        }

    }

    my $total_distance = 0;

    if ( $input_index1 > $input_index2 ) {
        foreach my $i ( $input_index2 + 1 .. $input_index1 ) {
            $total_distance = $total_distance + $distance[$i];

        }
        print "distance between $district and $district1=$total_distance km\n";

    }
    else {
        foreach my $i ( $input_index1 + 1 .. $input_index2 ) {
            $total_distance = $total_distance + $distance[$i];

        }
        print "distance between $district and $district1=$total_distance km\n";

    }

}

