
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
my @place;
my @time;
my @distance;

read_file();

sub read_file {
    my $file_path = "DistrictRoutes.txt";
    open( my $fh, '<:encoding(UTF-8)', $file_path )
      or die "could not open  the file '$file_path'$!";

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
}
my %data_structure;

data_structure( \@place, \@time, \@distance );

sub data_structure {
    my @array_ref;

    my $place    = shift;
    my $time     = shift;
    my $distance = shift;
    my @place    = @$place;
    my @time     = @$time;
    my @distance = @$distance;
    foreach my $i ( 0 .. $#place ) {

        my $value = [ $time[$i], $distance[$i] ];
        $array_ref[$i] = $value;
        $data_structure{ uc $place[$i] } = $array_ref[$i];
    }
}

STATEMENT: print "Enter Question no--->1>QUESTION1 2>QUESTION2--->\n";
my $question_choice = <>;
chomp($question_choice);
if ( '1' eq $question_choice ) {
    question1();
}
elsif ( '2' eq $question_choice ) {
    question2();
}
else {
    print "invlid input\n";
    goto STATEMENT;
}

sub question1 {
    print "enter the District name--->";
    my $u_input = <>;
    chomp($u_input);
    my $user_input = uc $u_input;
    if ( my $address = $data_structure{$user_input} ) {

        info($user_input);
    }
    else {
        print "Invalid DISTRICT\n";
        goto STATEMENT;
    }
}

sub info {

    my $place = $_[0];

  STATEMENT1: print
"Enter the Details you want to know??--->1>TIME 2>DISTANCE 3>DURATION 4>GO BACK 5>EXIT 6>SHOW ALL\n";
    chomp( my $user_input = <> );
    if ( '1' eq $user_input ) {
        time_distance_duration( $place, 1 );
    }
    elsif ( '2' eq $user_input ) {
        time_distance_duration( $place, 2 );
    }
    elsif ( '3' eq $user_input ) {
        time_distance_duration( $place, 3 );
    }
    elsif ( '4' eq $user_input ) {
        goto STATEMENT;
    }
    elsif ( '5' eq $user_input ) {
        exit;
    }
    elsif ( $user_input eq '6' ) {
        time_distance_duration( $place, 6 );

    }

    else {
        print "Invlid input\n";
        goto STATEMENT;

    }

}

sub time_distance_duration {
    my $parameter;
    my $place  = $_[0];
    my $option = $_[1];
    if ( $option eq 1 ) {
        $parameter = sub_question_1($place);
    }
    if ( $option eq 2 ) {
        $parameter = sub_question_2($place);
    }
    if ( $option eq 3 ) {
        $parameter = sub_question_3($place);
    }

    if ( $option eq 6 ) {
        my $time_parameter     = sub_question_1($place);
        my $distance_parameter = sub_question_2($place);
        my $duration_parameter = sub_question_3($place);

        $parameter =
          { %$time_parameter, %$distance_parameter, %$duration_parameter };

    }

    Display( $place, $parameter );

    goto STATEMENT1;

}

sub sub_question_1 {
    my $place = $_[0];

    my $address = $data_structure{$place};

    print "Time of arrival from Bangalore to $place:$address->[0]\n";
    my $time = $address->[0];
    my %parameter = ( "time" => "$time" );

    #Display( $place, \%parameter );
    return \%parameter;

}

sub sub_question_2 {
    my $place = $_[0];

    my $address        = $data_structure{$place};
    my $final_distance = 0;
    my $total_distance = 0;
    foreach my $i ( 0 .. $#distance ) {

        if ( $distance[$i] != $address->[1] ) {
            $total_distance = $total_distance + $distance[$i];
        }
        else {
            $final_distance = $total_distance + $address->[1];
            print "Distance from Bangalore to $place=$final_distance km\n";
        }
    }
    my %parameter = ( "distance" => "$final_distance" );

    #Display( $place, \%parameter );
    return \%parameter;
}

sub sub_question_3 {
    my $place   = $_[0];
    my $address = $data_structure{$place};

    my $hour_min = $address->[0];
    my @hour_min = split /:/, $hour_min;
    my $hour     = $hour_min[0];
    my $min      = $hour_min[1];
    print
      "Duration of journey from bangalore to $place:$hour hour and $min min\n";
    my %parameter = (
        "hour" => "$hour",
        "min"  => "$min"
    );

    # Display( $place, \%parameter );
    return \%parameter;

}

sub Display {
    my $place          = $_[0];
    my $para_ref       = $_[1];
    my %data_structure = %$para_ref;
    my $time;
    my $distance;
    my $min;
    my $hour;
    if ( $data_structure{'time'} ) {
        $time = $data_structure{'time'};
    }
    else {
        $time = "NA";
    }

    if ( $data_structure{'distance'} ) {
        $distance = $data_structure{'distance'};
    }
    else {

        $distance = "NA";
    }

    if (    defined( $data_structure{'hour'} )
        and defined( $data_structure{'min'} ) )
    {
        $hour = $data_structure{'hour'};
        $min  = $data_structure{'min'};
    }
    else {

        $hour = "NA";
        $min  = "NA";
    }

    table_display( $time, $distance, $hour, $min, $place );

}

sub table_display {
    my $time      = $_[0];
    my $distance  = $_[1];
    my $hour      = $_[2];
    my $min       = $_[3];
    my $place_sub = $_[4];
    use Text::Table;
    my $tb = Text::Table->new(
        "START:END\t",          "Distance\t",
        "Duraion of Journey\t", "Time Of Arrival"
    );
    $tb->load(
        [
            "Bangalore:$place_sub\t",    "$distance km\t",
            "$hour hour and $min min\t", "$time"
        ],

    );
    print $tb;
    csv_file_write( $time, $distance, $hour, $min, $place_sub );
}

sub csv_file_write {
    my $time      = $_[0];
    my $distance  = $_[1];
    my $hour      = $_[2];
    my $min       = $_[3];
    my $place_sub = $_[4];

    use Text::CSV;
    use Text::Table;

    my $csv = Text::CSV_XS->new( { sep_char => ',', eol => "\n" } );
    my $file_path = "/home/dyro/practice/project/Apr28/";
    open( my $fh, '>>:encoding(UTF-8)', "DistanceOut.csv" )
      or die "could not open  the file '$file_path'$!";

    $csv->print( $fh,
        [ "START:END", "Distance", "Duraion of Journey", "TIME Of Arrival" ] );
    $csv->print( $fh,
        [ "BANGALORE:$place_sub", "$distance", "$hour:$min", "$time" ] );

    close $fh;

}

sub question2 {
    print "enter  the first District---->\n";
    my $distance_1 = <>;
    chomp($distance_1);
    my $dis_1 = uc $distance_1;
    print "enter the second District--->\n";
    my $distance_2 = <>;
    chomp($distance_2);
    my $dis_2 = uc $distance_2;

    my $ref_add = $data_structure{$dis_1};

    my $ref_add1 = $data_structure{$dis_2};
    if ( $ref_add and $ref_add1 ) {

        info_1( $dis_1, $dis_2 );
    }
    else {
        print "Invalid DISTRICT\n";
        goto STATEMENT;

    }
}

sub info_1 {
    my $district  = $_[0];
    my $district1 = $_[1];
  STATEMENT2: print
"What you want to know-->1>DISTANCE 2>DURATION 3>GO BACK 4>EXIT 5>SHOW ALL\n";
    chomp( my $user_input = <> );

    if ( $user_input eq '1' ) {
        show_all( $district, $district1, 1 );
    }
    elsif ( $user_input eq '2' ) {
        show_all( $district, $district1, 2 );
    }
    elsif ( $user_input eq '3' ) {
        goto STATEMENT;
    }
    elsif ( $user_input eq '4' ) {
        exit;
    }
    elsif ( $user_input eq '5' ) {
        show_all( $district, $district1, 5 );
    }
    else {
        print "Invalid input\n";
        goto STATEMENT;
    }

}

sub show_all {
    my $district  = $_[0];
    my $district1 = $_[1];
    my $option    = $_[2];
    my $para_ref;
    if ( $option eq 1 ) {
        $para_ref = sub_question2( $district, $district1 );
    }
    if ( $option eq 2 ) {
        $para_ref = sub_question1( $district, $district1 );
    }

    if ( $option eq 5 ) {
        my $distance = sub_question2( $district, $district1 );
        my $duration = sub_question1( $district, $district1 );

        $para_ref = { %$distance, %$duration };

    }

    Display_1( $district, $district1, $para_ref );

    goto STATEMENT2;

}

sub Display_1 {
    my $district1      = $_[0];
    my $district2      = $_[1];
    my $para_ref       = $_[2];
    my %data_structure = %$para_ref;
    my $hour;
    my $min;
    my $distance;

    if (    defined( $data_structure{'hour'} )
        and defined( $data_structure{'min'} ) )
    {
        $hour = $data_structure{'hour'};
        $min  = $data_structure{'min'};

    }
    else {
        $hour = "NA";
        $min  = "NA";
    }

    if ( defined( $data_structure{'distance'} ) ) {
        $distance = $data_structure{'distance'};
    }
    else {
        $distance = "NA";
    }

    table_display_1( $district1, $district2, $hour, $min, $distance );
}

sub table_display_1 {
    my $district1 = $_[0];
    my $district2 = $_[1];
    my $hour      = $_[2];
    my $min       = $_[3];
    my $distance  = $_[4];

# my $header_ref="START:END\t","TIME DURATION\t","DISTANCE";
# my $data_ref=["$district1:$district2\t","$hour hour $min min\t","$distance km"];
    use Text::Table;
    my $tb = Text::Table->new( "START:END\t", "TIME DURATION\t", "DISTANCE" );

    $tb->load(
        [ "$district1:$district2\t", "$hour hour $min min\t", "$distance km" ]
    );
    print $tb;
    csv_write( $district1, $district2, $hour, $min, $distance );

}

sub csv_write {
    my $district1 = $_[0];
    my $district2 = $_[1];
    my $hour      = $_[2];
    my $min       = $_[3];
    my $distance  = $_[4];
    print "$distance\n";
    use Text::CSV;
    use Text::Table;

    my $csv = Text::CSV_XS->new( { sep_char => ',', eol => "\n" } );
    my $file_path = "/home/dyro/practice/project/Apr28/";
    open( my $fh, '>>:encoding(UTF-8)', "DisOut.csv" )
      or die "could not open  the file '$file_path'$!";

    $csv->print( $fh, [ "START:END\t", "TIME DURATION\t", "DISTANCE" ] );
    $csv->print( $fh,
        [ "$district1:$district2\t", "$hour hour $min min\t", "$distance km" ]
    );

    close $fh;

}

sub sub_question1 {
    my $district  = $_[0];
    my $district1 = $_[1];

    my $ref_add = $data_structure{$district};

    my $ref_add1 = $data_structure{$district1};

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
            $min = $min1 - $min2;
            print
"Duration of journey between $district and $district1 is:$hour hour and $min min\n";

        }
        else {
            $min = $min2 - $min1;
            print
"Duration of journey between $district1 and $district is:$hour hour and $min min\n";

        }

    }
    else {

        $hour = $hour2 - $hour1;
        if ( $min1 >= $min2 ) {
            $min = $min1 - $min2;
            print
"Duration of journey between $district and $district1 is:$hour hour and $min min\n";

        }
        else {
            $min = $min2 - $min1;
            print
"Duration of journey between $district1 and $district is:$hour hour and $min min\n";

        }

    }

    my %param = (
        "hour" => "$hour",
        "min"  => "$min"
    );
    return \%param;

}

sub sub_question2 {
    my $district  = $_[0];
    my $district1 = $_[1];

    my $ref_add = $data_structure{$district};

    my $ref_add1 = $data_structure{$district1};

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

    my %param = ( "distance" => "$total_distance" );

    return \%param;

}

