package Dosvid::Misc::Form;
use strict;
use warnings FATAL => 'all';

#**********************************************************
=head2 new() - very simple constructor

  Returns:
    object

=cut
#**********************************************************
sub new{
  bless( {}, shift );
}

#**********************************************************
=head2 generate(@params)

  Arguments:
    @params - list of hash_refs
      $arg_ref1 - { name => 'Name', label => 'Label for name', type => 'text' };

  Returns:
    html

=cut
#**********************************************************
sub generate {
  my (@params) = @_;

}


1;