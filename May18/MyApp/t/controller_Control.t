use strict;
use warnings;
use Test::More;


use Catalyst::Test 'MyApp';
use MyApp::Controller::Control;

ok( request('/control')->is_success, 'Request should succeed' );
done_testing();
