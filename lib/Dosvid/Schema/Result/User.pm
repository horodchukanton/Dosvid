use utf8;
package Dosvid::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Dosvid::Schema::Result::User

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<users>

=cut

__PACKAGE__->table("users");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 username

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 password

  data_type: 'varchar'
  is_nullable: 0
  size: 40

=head2 salt

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 email

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 128

=head2 birthdate

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 photo

  data_type: 'mediumblob'
  is_nullable: 1

=head2 account

  data_type: 'double precision'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "username",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "password",
  { data_type => "varchar", is_nullable => 0, size => 40 },
  "salt",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "email",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 128 },
  "birthdate",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "photo",
  { data_type => "mediumblob", is_nullable => 1 },
  "account",
  { data_type => "double precision", default_value => 0, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<username>

=over 4

=item * L</username>

=back

=cut

__PACKAGE__->add_unique_constraint("username", ["username"]);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2016-06-10 09:41:30
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ICbzjvubxa0pNBugd64ATQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
