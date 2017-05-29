package StudentDetails::Controller::Login;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

StudentDetails::Controller::Login -this module will store the student info and display

=head1 DESCRIPTION

use case1=store the data
sub redirect_first_page:Local
use case2=display the data
sub final_display:Local

=head1 METHODS

=cut

=head2 index

=cut

sub index : Path : Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched StudentDetails::Controller::Login in Login.');
}

=item B<get_conn>

params:NONE

return:NONE

desc:go to first page

=cut

sub first_page : Local {
    my ( $self, $c ) = @_;
    $c->stash->{template} = 'first.tt';
}

=item B<get_conn>

params:NONE

return:NONE

desc:go to second page from first page 

=cut

sub second_page : Local {
    my ( $self, $c ) = @_;
    $c->stash->{template} = 'second.tt';
}

=item B<get_conn>

params:NONE

return:NONE

desc:go to third page from first page

=cut

sub third_page : Local {
    my ( $self, $c ) = @_;
    $c->stash->{template} = 'third.tt';
}

=item B<get_conn>

params:NONE

return:NONE

desc:1>store data into database ,redirect to first page

=cut

sub redirect_first_page : Local {
    my ( $self, $c ) = @_;
    my $student_id  = $c->request->params->{RN};
    my $f_name      = $c->request->params->{firstname};
    my $l_name      = $c->request->params->{lastname};
    my $dob         = $c->request->params->{DOB};
    my $gen         = $c->request->params->{gen};
    my $add         = $c->request->params->{add};
    my $email       = $c->request->params->{mail};
    my $nationality = $c->request->params->{nat};
    my $ph          = $c->request->params->{ph};

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

    $c->stash->{template} = 'first.tt';

}

=item B<get_conn>

params:NONE

return:NONE

desc:cancel the from input, redirect to first page

=cut

sub redirect_first_p_cancel : Local {
    my ( $self, $c ) = @_;
    $c->stash->{template} = 'first.tt';
}

=item B<get_conn>

params:NONE

return:NONE

desc:go to final display page,display,redirect to first page

=cut

sub final_display : Local {
    my ( $self, $c ) = @_;
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
        $disp_student_ds{$unique_key}{last_name} = $disp_student_row->last_name;
        $disp_student_ds{$unique_key}{date_of_birth} =
          $disp_student_row->date_of_birth;
        $disp_student_ds{$unique_key}{gender} = $disp_student_row->gender;
        $disp_student_ds{$unique_key}{email}  = $disp_student_row->email;
        $disp_student_ds{$unique_key}{nationality} =
          $disp_student_row->nationality;
        $disp_student_ds{$unique_key}{phone_no} = $disp_student_row->phone_no;

    }

    $c->stash->{template} = 'final_display.tt';
    $c->stash->{ds}       = \%disp_student_ds;

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
