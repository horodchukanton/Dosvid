package Dosvid::Admin;
use strict;
use warnings FATAL => 'all';

use Dancer qw/:syntax/;
use Dancer::Plugin::Auth::Extensible;

prefix 'admin' => sub{
    get '/dashboard' => require_role admin sub {

      };
  };

1;