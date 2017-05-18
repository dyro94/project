use strict;
use warnings;
use Test::More;


use Catalyst::Test 'MyApp';
use MyApp::Controller::rohan;

ok( request('/rohan')->is_success, 'Request should succeed' );
done_testing();
