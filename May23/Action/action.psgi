use strict;
use warnings;

use Action;

my $app = Action->apply_default_middlewares(Action->psgi_app);
$app;

