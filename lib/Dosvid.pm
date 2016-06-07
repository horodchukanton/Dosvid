package Dosvid;
use Dancer ':syntax';

our $VERSION = '0.1';

set 'auto_reload' => true;

get '/' => sub {
    template 'index';
};

get '/login' => sub {
    template 'login';
  };

get '/hello/' => sub {
    template 'index';
  };


true;
