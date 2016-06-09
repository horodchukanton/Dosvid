package Auth;
use strict;
use warnings FATAL => 'all';

use Dancer ':syntax';
use Dancer::Plugin::Auth::Extensible;
use Dancer::Plugin::Database;

sub http_login {
  my $user = database->quick_select( 'users', { username => params->{user} } );
  if ( !$user ) {
    warning "Failed login for unrecognised user " . params->{user};
    redirect '/login?failed=1';
  }
  else {
    #      if (Crypt::SaltedHash->validate($user->{password}, params->{pass})){
    if ( $user->{password} eq params->{pass} ) {
      debug "Password correct";
      # Logged in successfully
      session user => $user;
      redirect params->{return_url} || '/';
    }
    else {
      debug( "Login failed - password incorrect for " . params->{user} );
      redirect '/login?failed=1';
    }
  }
}

1;