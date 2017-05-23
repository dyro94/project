use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Action';
use Action::Controller::books;

ok( request('/books')->is_success, 'Request should succeed' );
done_testing();
