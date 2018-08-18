package Dosvid;

use Data::Dumper;


use Dancer2 appname => 'Dosvid';

use Dancer2::Plugin::Auth::Extensible;
use Dancer2::Plugin::DBIC;

use Dosvid::Globals;
use Dosvid::Schema;

use Dosvid::Controllers::Auth;
use Dosvid::Controllers::Admin;
use Dosvid::Controllers::User;

our $VERSION = '0.1';

my Dosvid::Globals $globals = Dosvid::Globals->new();

my $schema = schema('default') or die "Can't get schema";

my $admin_info = $schema->resultset('User');

$globals->set_schema($schema);

#$globals->set_cache_connection(database('mongodb'));

get '/' => sub {
#    debug Dumper session;

    my %template_info = (
      message => '',
      debug => '',
    );

    if (user_has_role('admin')){
      $template_info{message} = 'Hello, admin';
      my $admin_info = $schema->resultset('User')->find(session()->{user}->{id})->username;

      $template_info{debug_info} = Dumper $admin_info;
    }
    else {
      $template_info{message} = 'Hello, user';
    }

    template ('index', \%template_info);
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
