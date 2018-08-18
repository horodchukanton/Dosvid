package Dosvid::Auth;
use strict;
use warnings FATAL => 'all';

use Dancer2 appname => 'Dosvid';;
use Dancer2::Plugin::Auth::Extensible;
use Dancer2::Plugin::DBIC;

use Crypt::SaltedHash;

get '/login' => sub {
    template 'auth/login', { app_name => config->{appname} };
};

post '/login' => sub {
    my $schema = schema('default') or die "Can't get schema";

    my $user = $schema->resultset('User')->find({ username => params->{username} });
    if (! $user) {
        warning "Failed login for unrecognised user " . params->{username};
        redirect '/login?failed=user';
    }
    else {
        require Crypt::SaltedHash;

        my $csh = Crypt::SaltedHash->new(algorithm => 'SHA-256');

        if ($csh->validate($user->{password}, params->{password} . $user->{salt} . params->{username})) {
            debug "Password correct";
            # Logged in successfully
            session user => $user;
            session logged_in_user => params->{username};
            session logged_in_user_realm => 'realm_one';

            redirect params->{return_url} || '/';
        }
        else {
            debug("Login failed - password incorrect for " . params->{username});

            # Check corectness
            session failed_logins_counter => ( ( session->{failed_logins_counter} ) ? session->{failed_logins_counter} ++ : 1 );

            redirect '/login?failed=pass';
        }
    }

};

get '/registration' => sub {
    template 'auth/registration', {
        app_name          => config->{appname},
        lifeplace_options => {
            '0' => 'Mid school',
            '1' => 'High school',
            '2' => 'University',
            '3' => 'Work'
        }
    }, { layout => 'simple' };
};

post '/registration' => sub {
    my $schema = schema('default') or die "Can't get schema";

    if (params->{password} && params->{username}) {
        debug('Registration  ' . params->{username});

        require Crypt::SaltedHash;
        my $csh = Crypt::SaltedHash->new({ algorithm => 'SHA-256' });

        my $salt = $csh->salt_hex();
        $csh->add(params->{password} . $salt . params->{username});

        $schema->resultset('User')->create(
            {
                %{params()},
                password => $csh->generate(),
                salt     => $salt,
            }
        );

        redirect '/user';
    }
    else {
        my $failed_param = ( ! params->{password} ) ? 'password' : 'login';

        redirect "/registration?failed=$failed_param";
    }
};

any '/logout' => sub {
    session->destroy();
    redirect '/';
};

get '/login/denied' => sub {
    template 'auth/permission_denied';
};

1;