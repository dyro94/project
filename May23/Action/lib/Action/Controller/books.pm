package Action::Controller::books;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

Action::Controller::books - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched Action::Controller::books in books.');
}

sub url_create:Local{
 (my $self,my $c,my $title,my $rating,my $author_id)= @_ ;
   my  $book=$c->model('rohan::book')->create({
        title=>$title,
        rating=>$rating
          });
   $book->add_to_book_authors({author_id => $author_id});
   $c->stash(book =>$book,
               template => 'books/create_done.tt');
   $c->response->header('Cache-Control' => 'no-cache');
   print"---------------Done\n";
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
