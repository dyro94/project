package StudentDetails::Controller::Student_info;
use Moose;
use namespace::autoclean;
use Plack::Request;
BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

StudentDetails::Controller::Student_info -this module will store the student info and display

=head1 DESCRIPTION

use case1=store the data
$c->model('DB::student')->create
use case2=search and display  the data
$c->model('DB::student')->search

=head1 METHODS

=cut

=head2 index

=cut

=item 

params:NONE

return:NONE

desc:Match Student Details

=cut

sub index : Path : Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body(
        'Matched StudentDetails::Controller::Student_info in Student_info.');
}

=item 

params:NONE

return:NONE

desc:go to add or show student page

=cut

sub add_show : Local {
    my ( $self, $c ) = @_;
    my $method = $c->request->method;
    if ( $method == 'GET' ) {
        $c->stash->{template} = 'add_show.tt';
    }
}

=item 

params:NONE

return:NONE

desc:go to add student page 

=cut

sub add_student : Local {
    my ( $self, $c ) = @_;
    my $method = $c->request->method;
    if ( $method == 'GET' ) {

        $c->stash->{template} = 'add_student.tt';
    }
}

=item

params:NONE

return:NONE

desc:go to search student page

=cut

sub show_student : Local {
    my ( $self, $c ) = @_;
    my $method = $c->request->method;
    if ( $method == 'GET' ) {

        $c->stash->{template} = 'show_student.tt';
    }
}

=item

params: student id,first name,last name,date of birth,gender,address,email,nationality,phone number 

return:NONE

desc:store studen_info into database ,redirect to add_show page

=cut

sub store_into_db : Local {
    my ( $self, $c ) = @_;
    my $method = $c->request->method;
    if ( $method eq 'POST' ) {
        my $student_id;
        my $f_name;
        my $l_name;
        my $dob;
        my $gen;
        my $add;
        my $email;
        my $nationality;
        my $ph;

        if ( $c->request->body_params->{RN} =~ /^\d+$/ ) {

            $student_id = $c->request->body_params->{RN};
        }
        else {
            $c->log->info("Invalid first roll no");
        }

        if ( $c->request->body_params->{firstname} =~ /^[A-Z][a-z]+$/ ) {
            $f_name = $c->request->body_params->{firstname};
        }
        else {
            $c->log->info("Invalid first name");
        }

        if ( $c->request->body_params->{lastname} =~ /^[A-Z][a-z]+$/ ) {
            $l_name = $c->request->body_params->{lastname};

        }
        else {
            $c->log->info("Invalid last name");
        }
        if ( $c->request->body_params->{DOB} =~ /^(\d{2}-\d{2}-\d{4})$/ ) {
            $dob = $c->request->body_params->{DOB};
        }
        else {
            $c->log->info("Invalid Date Of Birth");
        }
        if ( $c->request->body_params->{gen} =~ /^[a-zA-z]+$/ ) {
            $gen = $c->request->body_params->{gen};
        }
        else {
            $c->log->info("Invalid Gender");
        }
        if ( $c->request->body_params->{add} ) {
            $add = $c->request->body_params->{add};
        }
        else {
            $c->log->info("Invalid Address");
        }
        if ( $c->request->body_params->{mail} =~ /^[a-z0-9.]+\@[a-z0-9.-]+$/ ) {
            $email = $c->request->body_params->{mail};
        }
        else {
            $c->log->info("Invalid Mail Address");
        }
        if ( $c->request->body_params->{nat} =~ /^[a-zA-z]+$/ ) {
            $nationality = $c->request->body_params->{nat};
        }
        else {
            $c->log->info("Invalid Nationality");
        }
        if ( $c->request->body_params->{ph} =~ /^\d{10}$/ ) {
            $ph = $c->request->body_params->{ph};
        }
        else {
            $c->log->info("Invalid Phone");
        }
        if (    defined $student_id
            and defined $f_name
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
            my $student = $c->model('DB::student')->create(
                {
                    student_id    => $student_id,
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
            $c->log->info("Student data successfully saved");

        }
        else {
            $c->log->info(" Student data save  unsuccessful");

        }
    }

    $c->stash->{template} = 'add_show.tt';

}

=item 

params:NONE

return:NONE

desc:cancel the from input, redirect to add_show page

=cut

sub cancel_storage : Local {
    my ( $self, $c ) = @_;
    my $method = $c->request->method;
    if ( $method == 'GET' ) {

        $c->stash->{template} = 'add_show.tt';
    }
}

=item 

params:first name

return:NONE

desc:search the student and display details and redirect to add_show  page

=cut

sub search_student : Local {
    my ( $self, $c ) = @_;
    my $method = $c->request->method;
    if ( $method == 'GET' ) {

        my $first_name   = $c->request->params->{firstname};
        my $disp_student = $c->model('DB::student')->search(
            {
                first_name => $first_name,
            }
        );

        my %disp_student_ds;

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

        $c->stash->{template} = 'final_display.tt';
        $c->stash->{ds}       = \%disp_student_ds;
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
