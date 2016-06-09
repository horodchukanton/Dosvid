package Dosvid;
use Dancer ':syntax';

use Dancer::Plugin::Auth::Extensible;
use Data::Dumper;

our $VERSION = '0.1';

get '/' => sub {
    debug Dumper session;

    template ('index');
  };


get '/login' => sub {
    template 'login', { app_name => config->{appname} };
  };

get '/hello' => require_login sub {
      my $user = logged_in_user();
      return "Hi there, $user->{username}";
    };

#any '/logout' => sub {
#    session->destroy();
#  };

get '/user' => require_login sub {
    my $result = '';

    $result = Dumper logged_in_user();

    return $result;
  };

true;
