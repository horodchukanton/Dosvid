use Test::More tests => 3;
use strict;
use warnings;

BEGIN {
    use FindBin '$Bin';
    use lib "$Bin/../"
}

use Dancer2 appname => 'Dosvid';;
use Dosvid;
use Dancer2::Plugin::DBIC;

use Plack::Test;
use HTTP::Request::Common;
use Plack::App::PSGIBin;
my Plack::App::PSGIBin $app = Dancer2->psgi_app(['Dosvid']);

my $test = Plack::Test->create($app);

{
    my $request = GET("/hello");
    my $res = $test->request($request, 'Unathorized redirect');
    is ($res->code, 302);
}

{
    my $request = POST("/login", {
        username => 'admin',
        password => 'wrong_password'
    });
    my $res = $test->request($request, 'Login with wrong password redirects to logins');
    is ($res->code, 302)
}
{
    my $request = POST("/registration", {
        username  => 'admin',
        password  => 'wrong_password',
        email     => 'test@email.com',
        birthdate => '2025-08-10'
    });

    my $res = $test->request($request, 'Login with wrong password redirects to logins');
    is ($res->code, 302);

    # TODO: check redirected to login
}



done_testing();

END {
    my $schema = schema('default') or die "Can't get schema";
    $schema->resultset('User')->find({username => 'admin'})->delete();
}