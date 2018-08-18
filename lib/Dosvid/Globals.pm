package Dosvid::Globals;
use strict;
use warnings FATAL => 'all';

my $instance = undef;


#**********************************************************
=head2 new() - constructor for singleton Globals

=cut
#**********************************************************
sub new{
  unless (defined $instance) {
    my $class = shift;
    $instance = {};
    bless( $instance, $class );
  }

  return $instance;
}

#**********************************************************
=head2 get_instance()

=cut
#**********************************************************
sub get_instance {
  my $self = shift || $instance;
  return $self;
}

#**********************************************************
=head2 set_db_connection($connection)

=cut
#**********************************************************
sub set_db_connection {
  die 'set_db_connection';
  my $self = shift;
  my ($connection) = @_;
  $self->{db} = $connection;
}

#**********************************************************
=head2 get_db_connection()

=cut
#**********************************************************
sub get_db_connection(){
  die 'get_db_connection';

  return shift->{db};
}

#**********************************************************
=head2 set_cache_connection($connection)

=cut
#**********************************************************
sub set_cache_connection {
  my $self = shift;
  my ($connection) = @_;
  $self->{cache} = $connection;
}

#**********************************************************
=head2 get_cache_connection()

=cut
#**********************************************************
sub get_cache_connection(){
  return shift->{cache};
}


#**********************************************************
=head2 set_schema($schema)

=cut
#**********************************************************
sub set_schema {
  my $self = shift;
  my ($schema) = @_;
  $self->{schema} = $schema;
}

#**********************************************************
=head2 get_schema()

=cut
#**********************************************************
sub get_schema(){
  return shift->{schema};
}



1;