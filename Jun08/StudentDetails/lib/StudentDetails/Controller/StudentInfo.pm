package StudentDetails::Controller::StudentInfo;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

StudentDetails::Controller::StudentInfo -this module will store the student info,delete student info,edit student info and display student info

=head1 DESCRIPTION

use case1=store the data
$c->model('DB::student')->create
use case2=search and display  the data
$c->model('DB::student')->search

=head1 METHODS

=cut

=head2 index

=cut

=item<index> 

Params:NONE

Return:NONE

Desc:Match Student Details

=cut

sub index : Path : Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body(
        'Matched StudentDetails::Controller::Student_info in Student_info.');
}

=item <add_show>

Params:NONE

Return:NONE

Desc:go to add or show student page

=cut

sub add_show : Local {
    my ( $self, $c ) = @_;
    my $method = $c->request->method;
    if ( $method eq 'GET' ) {
        $c->stash->{template} = 'add_show.tt';
    }
}

=item <add_student>

Params:NONE

Return:NONE

Desc:go to add student page 

=cut

sub add_student : Local {
    my ( $self, $c ) = @_;
    my $method = $c->request->method;
    if ( $method eq 'GET' ) {
        $c->stash->{template} = 'add_student.tt';
    }
}

=item <show_student>

Params:NONE

Return:NONE

Desc:go to search student page

=cut

sub show_student : Local {
    my ( $self, $c ) = @_;
    my $method = $c->request->method;
    if ( $method eq 'GET' ) {

        $c->stash->{template} = 'show_student.tt';
    }
}

=item <store_into_db>

Params: student id,first name,last name,date of birth,gender,address,email,nationality,phone number 

Return:NONE

Desc:1>store student info into database and redirect to add_show page 2> update student info into database redirect and to add_show page

=cut

sub store_into_db : Local {
    my ( $self, $c ) = @_;
    my $method = $c->request->method;
    if ( $method eq 'POST' ) {

        my $f_name;
        my $l_name;
        my $dob;
        my $gen;
        my $add;
        my $email;
        my $nationality;
        my $ph;

        my $student_id = $c->request->body_params->{RN};

        $c->log->info($student_id);

        if ( $c->request->body_params->{firstname} =~ /^[a-zA-z]+$/ ) {
            $f_name = $c->request->body_params->{firstname};

        }
        elsif ( $c->request->body_params->{firstname} =~ /^\s*$/ ) {
            $c->stash->{template}        = 'add_student.tt';
            $c->stash->{first_error_msg} = "Enter First Name of Student  ";
        }
        else {
            $c->stash->{template} = 'add_student.tt';
            $c->stash->{first_error_msg} =
"Invalid firstname ! FORMAT:letter only and first letter should be in caps Ex:Rohan ";
            $c->log->info("Invalid first name");
        }

        if ( $c->request->body_params->{lastname} =~ /^[a-zA-z]+$/ ) {
            $l_name = $c->request->body_params->{lastname};

        }
        elsif ( $c->request->body_params->{lastname} =~ /^\s*$/ ) {
            $c->stash->{template}       = 'add_student.tt';
            $c->stash->{last_error_msg} = "Enter Student Last Name ";
        }
        else {
            $c->stash->{template} = 'add_student.tt';
            $c->stash->{last_error_msg} =
"Invalid last name! FORMAT:letter only and first letter should be in caps Ex:Ghosh ";
            $c->log->info("Invalid last name");
        }
        if ( $c->request->body_params->{DOB} =~ /^(\d{2}-\d{2}-\d{4})$/ ) {
            $dob = $c->request->body_params->{DOB};

        }
        elsif ( $c->request->body_params->{DOB} =~ /^\s*$/ ) {
            $c->stash->{template}      = 'add_student.tt';
            $c->stash->{dob_error_msg} = "Enter Student Date_of_birth ";

        }
        else {
            $c->stash->{template} = 'add_student.tt';
            $c->stash->{dob_error_msg} =
              "Invalid Date Of Birth! FORMAT:dd-mm-yyyy ";
            $c->log->info("Invalid Date Of Birth");
        }
        if (   ( $c->request->body_params->{gen} eq 'male' )
            or ( $c->request->body_params->{gen} eq 'female' )
            or ( $c->request->body_params->{gen} eq 'Female' )
            or ( $c->request->body_params->{gen} eq 'FEMALE' )
            or ( $c->request->body_params->{gen} eq 'Male' )
            or ( $c->request->body_params->{gen} eq 'MALE' ) )
        {
            $gen = $c->request->body_params->{gen};
        }
        elsif ( $c->request->body_params->{gen} =~ /^\s*$/ ) {
            $c->stash->{template}      = 'add_student.tt';
            $c->stash->{gen_error_msg} = "Enter Student Gender ";
        }
        else {
            $c->stash->{template} = 'add_student.tt';
            $c->stash->{gen_error_msg} =
              "Invalid Gender! FORMAT:male or female ";

            $c->log->info("Invalid Gender");
        }
        if ( $c->request->body_params->{add} ) {
            $add = $c->request->body_params->{add};
        }
        elsif ( $c->request->body_params->{add} =~ /^\s*$/ ) {
            $c->stash->{template}      = 'add_student.tt';
            $c->stash->{add_error_msg} = "Enter Student Address ";
        }
        else {
            $c->stash->{template}      = 'add_student.tt';
            $c->stash->{add_error_msg} = "Invalid Address ";
            $c->log->info("Invalid Address");
        }
        if ( $c->request->body_params->{mail} =~
            /^[a-z0-9][a-z0-9\.]+\@[a-z0-9-]{1,}\.[a-z]{2,}/ )

        {
            $email = $c->request->body_params->{mail};
        }
        elsif ( $c->request->body_params->{mail} =~ /^\s*$/ ) {
            $c->stash->{template}       = 'add_student.tt';
            $c->stash->{mail_error_msg} = "Enter Student Email Address ";
        }
        else {
            $c->stash->{template} = 'add_student.tt';
            $c->stash->{mail_error_msg} =
              'Invalid Email! FORMAT:roo4rohan@gmail.com ';

            $c->log->info("Invalid Mail Address");
        }
        if ( $c->request->body_params->{nat} =~ /^[a-zA-z]+$/ ) {
            $nationality = $c->request->body_params->{nat};
        }
        elsif ( $c->request->body_params->{nat} =~ /^\s*$/ ) {
            $c->stash->{template}      = 'add_student.tt';
            $c->stash->{nat_error_msg} = "Enter Student Nationality ";
        }
        else {
            $c->stash->{template} = 'add_student.tt';
            $c->stash->{nat_error_msg} =
              'Invalid Nationality! FORMAT:only letters Ex:Indian ';
            $c->log->info("Invalid Nationality");
        }
        if ( $c->request->body_params->{ph} =~ /^\d{10}$/ ) {
            $ph = $c->request->body_params->{ph};
        }
        elsif ( $c->request->body_params->{ph} =~ /^\s*$/ ) {
            $c->stash->{template}     = 'add_student.tt';
            $c->stash->{ph_error_msg} = "Enter Student Phone Number ";
        }
        else {
            $c->stash->{template} = 'add_student.tt';
            $c->stash->{ph_error_msg} =
              'Invalid Phone Number! FORMAT:Ten Digit Number Ex:9739657905 ';
            $c->log->info("Invalid Phone");
        }

        if ( defined $student_id ) {
            if (

                    defined $f_name
                and defined $l_name
                and defined $dob
                and defined $gen
                and defined $dob
                and defined $gen
                and defined $add
                and defined $email
                and defined $nationality
                and defined $ph
              )
            {

                my $student = $c->model('DB::Student')
                  ->find( { student_id => $student_id } )->update(

                    {

                        first_name    => $f_name,
                        last_name     => $l_name,
                        date_of_birth => $dob,
                        gender        => $gen,
                        address       => $add,
                        email         => $email,
                        nationality   => $nationality,
                        phone_no      => $ph,

                    }

                  );

                $c->flash->{success_cancel} =
                  'Student data successfully updated';
                $c->res->redirect('/studentinfo/add_show');
                $c->log->info("Student data successfully saved");

            }
            else {
                $c->stash(
                    template      => 'edit_student.tt',
                    first_name    => $f_name,
                    last_name     => $l_name,
                    date_of_birth => $dob,
                    gender        => $gen,
                    address       => $add,
                    email         => $email,
                    nationality   => $nationality,
                    phone_no      => $ph,

                );

                $c->log->info(" Student data update  unsuccessful");

            }

        }
        else {

            if (    defined $f_name
                and defined $l_name
                and defined $dob
                and defined $gen
                and defined $dob
                and defined $gen
                and defined $add
                and defined $email
                and defined $nationality
                and defined $ph )
            {
                my $student = $c->model('DB::Student')->create(
                    {

                        first_name    => $f_name,
                        last_name     => $l_name,
                        date_of_birth => $dob,
                        gender        => $gen,
                        address       => $add,
                        email         => $email,
                        nationality   => $nationality,
                        phone_no      => $ph

                    }

                );

                $c->flash->{success_cancel} = 'Student data successfully saved';
                $c->res->redirect('/studentinfo/add_show');
                $c->log->info("Student data successfully saved");

            }
            else {
                $c->log->info(" Student data save  unsuccessful");

            }
        }

    }

}

=item <search_student>

Params:first name

Return:NONE

Desc:1> search the student and display details and redirect to add_show  page 2> search all and redirect to add_show page

=cut

sub search_student : Local {
    my ( $self, $c ) = @_;
    my $method = $c->request->method;
    if ( $method eq 'POST' ) {

        my $first_name = $c->request->body_params->{firstname};
        if ( $first_name =~ /^[a-zA-z]+$/ ) {
            if ( defined $first_name ) {

                my $lower_first_name = lc $first_name;
                my $disp_student     = $c->model('DB::Student')->search(
                    {

                        'LOWER(first_name)' => $lower_first_name,

                    }
                );

                if ( $disp_student ne '0' ) {
                    if ( $first_name =~ /^[a-zA-z]+$/ ) {

                        my %disp_first_name = (
                            first_name   => $first_name,
                            disp_student => $disp_student
                        );

                        $c->forward( 'refresh_final_display',
                            [ \%disp_first_name ] );

                    }
                    elsif ( $first_name =~ /^\s*$/ ) {

                        $c->stash->{template}       = 'show_student.tt';
                        $c->stash->{search_err_msg} = 'Enter Student Name';
                    }

                }
                else {
                    $c->stash->{template}       = 'show_student.tt';
                    $c->stash->{search_err_msg} = 'Student not Found';
                }

            }
            else {

                my $disp_student = $c->model('DB::Student')->search();

                if ( $disp_student ne '0' ) {
                    my %disp_first_name = (

                        disp_student => $disp_student,
                    );

                    $c->forward( 'refresh_final_display',
                        [ \%disp_first_name ] );
                }
                else {

                    $c->stash->{template}       = 'show_student.tt';
                    $c->stash->{search_err_msg} = 'NO STUDENT INFO!!!';

                }

            }

        }
    }

}

=item <delete_student_info>

Params:student_id

Return:NONE

Desc:1>search the student with specific name  and delete detail, show updated table 2>display all student info and delete studant detail

=cut

sub delete_student_info : Local {
    my ( $self, $c ) = @_;
    my $id = $c->request->body_params->{student_id};

    my $name = $c->request->body_params->{name};

    my $method = $c->request->method;
    if ( $method eq 'POST' ) {

        if ( $c->request->body_params->{name} ) {

            $c->model('DB::Student')->search( { student_id => $id } )->delete;

            my $disp_student = $c->model('DB::Student')->search(
                {
                    first_name => $name,
                }
            );
            my %disp_first_name = (

                disp_student => $disp_student,
            );

            if ( $disp_student ne '0' ) {

                $c->forward( 'refresh_final_display', [ \%disp_first_name ] );
            }
            else {
                $c->res->redirect('/studentinfo/add_show');

            }
        }
        else {

            $c->model('DB::Student')->search( { student_id => $id } )->delete;
            my $disp_student    = $c->model('DB::Student')->search();
            my %disp_first_name = (

                disp_student => $disp_student,
            );
            if ( $disp_student ne '0' ) {
                $c->forward( 'refresh_final_display', [ \%disp_first_name ] );
            }
            else {

                $c->res->redirect('/studentinfo/add_show');
            }

        }
    }
}

=item <refresh_final_display>                                                                                                                          
                                                                                                                                                     
Params:refrence of hash (which consists search reasult set and student first_name)                                                                                                                      
                                                                                                                                                   
Return:NONE
                                                                                                                                 
Desc:display the updated student table information                                                                                   
                                                                                                                                                     
=cut    

sub refresh_final_display : Private {

    my ( $self, $c, $ds ) = @_;

    my %name_disp             = %$ds;
    my $specific_student_name = $name_disp{first_name};

    my $disp_student = $name_disp{disp_student};

    my %disp_student_ds;
    if ( $disp_student ne '0' ) {

        while ( my $disp_student_row = $disp_student->next ) {

            my $unique_key = $disp_student_row->student_id;
            $disp_student_ds{$unique_key}{student_id} =
              $disp_student_row->student_id;
            $disp_student_ds{$unique_key}{first_name} =
              $disp_student_row->first_name;
            $disp_student_ds{$unique_key}{last_name} =
              $disp_student_row->last_name;
            $disp_student_ds{$unique_key}{date_of_birth} =
              $disp_student_row->date_of_birth;
            $disp_student_ds{$unique_key}{gender}  = $disp_student_row->gender;
            $disp_student_ds{$unique_key}{address} = $disp_student_row->address;
            $disp_student_ds{$unique_key}{email}   = $disp_student_row->email;
            $disp_student_ds{$unique_key}{nationality} =
              $disp_student_row->nationality;
            $disp_student_ds{$unique_key}{phone_no} =
              $disp_student_row->phone_no;

        }

        if ( defined $specific_student_name ) {

            $c->stash->{nam}      = $specific_student_name;
            $c->stash->{template} = 'final_display.tt';
            $c->stash->{ds}       = \%disp_student_ds;
        }
        else {

            $c->stash->{template} = 'final_display.tt';
            $c->stash->{ds}       = \%disp_student_ds;

        }
    }

}

=item <edit_student>                                                                                                                          
                                                                                                                                                     
Params:student_id                                                                                                                      
                                                                                                                                                   
Return:NONE
                                                                                                                                 
Desc:display the edit form with predefined values                                                                                   
                                                                                                                                                     
=cut

sub edit_student : Local {
    my ( $self, $c ) = @_;
    my $id     = $c->request->body_params->{student_id};
    my $method = $c->request->method;
    if ( $method eq 'POST' ) {

        my $disp_student = $c->model('DB::Student')->search(
            {
                student_id => $id,
            }
        )->first;

        if ($disp_student) {
            $c->stash(
                template      => 'edit_student.tt',
                student_id    => $disp_student->student_id,
                first_name    => $disp_student->first_name,
                last_name     => $disp_student->last_name,
                date_of_birth => $disp_student->date_of_birth,
                gender        => $disp_student->gender,
                address       => $disp_student->address,
                email         => $disp_student->email,
                nationality   => $disp_student->nationality,
                phone         => $disp_student->phone_no,

            );
        }
        else {

            $c->log->info(" no record found");

        }

    }
}

=encoding utf8

=head1 AUTHOR

Rohan Ghosh,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
