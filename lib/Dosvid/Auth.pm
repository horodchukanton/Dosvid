package Dosvid::Auth;
use strict;
use warnings FATAL => 'all';

use Dancer ':syntax';
use Dancer::Plugin::Auth::Extensible;
use Dancer::Plugin::Database;

use Crypt::SaltedHash;

get '/login' => sub {
    template 'login', { app_name => config->{appname} };
  };

post '/login' => sub {
    my $user = database( 'mysql' )->quick_select( 'users', { username => params->{user} } );
    if ( !$user ) {
      warning "Failed login for unrecognised user " . params->{user};
      redirect '/login?failed=user';
    }
    else {

      my $csh = Crypt::SaltedHash->new( algorithm => 'SHA-256' );

      if ( $csh->validate( $user->{password}, params->{pass} . $user->{salt} . params->{user} ) ) {
        debug "Password correct";
        # Logged in successfully
        session user => $user;
        session logged_in_user => params->{user};
        session logged_in_user_realm => 'realm_one';

        redirect params->{return_url} || '/';
      }
      else {
        debug( "Login failed - password incorrect for " . params->{user} );
        redirect '/login?failed=pass';
      }
    }

  };

get '/registration' => sub {
    template 'registration', {
        app_name          => config->{appname},
        lifeplace_options => { '0' => 'Mid school', '1' => 'High school', '2' => 'University', '3' => 'Work' }
      }, { layout => 'simple' };
  };

post '/registration' => sub {
    if ( params->{pass} && params->{user} ) {
      debug ( 'Registration  ' . params->{user} );

      my $csh = Crypt::SaltedHash->new( { algorithm => 'SHA-256' } );

      my $salt = $csh->salt_hex();
      $csh->add( params->{pass} . $salt . params->{user} );

      database( 'mysql' )->quick_insert( 'users',
        { username => params->{user}, password => $csh->generate(), salt => $salt } );

      redirect '/user';
    }
    else {
      my $failed_param = (!params->{pass}) ? 'password' : 'login';

      redirect "/registration?failed=$failed_param";
    }
  };

1;