package Dosvid;
use Dancer ':syntax';

use Dancer::Plugin::Auth::Extensible;
use Data::Dumper;

use Dosvid::Auth;

our $VERSION = '0.1';

my $counter = 0;

get '/' => sub {
    debug Dumper session;

    template ('index', {counter => $counter++ });
  };


get '/hello' => require_login sub {
      my $user = logged_in_user();

      template ('index', {  counter =>  "Hi there, $user->{username}" }, { layout => 'admin' } );
    };


get '/user' => require_login sub {
    my $result = '';

    $result = Dumper logged_in_user();

    return $result;
  };



true;
