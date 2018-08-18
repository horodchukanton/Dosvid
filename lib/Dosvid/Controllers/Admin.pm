package Dosvid::Admin;
use strict;
use warnings FATAL => 'all';

use Dancer2 qw/:syntax/;
use Dancer2::Plugin::Auth::Extensible;

prefix '/admin' => sub{
    get '/dashboard' => require_role admin => sub {

      };
  };

1;