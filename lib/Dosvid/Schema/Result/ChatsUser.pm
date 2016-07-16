use utf8;
package Dosvid::Schema::Result::ChatsUser;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Dosvid::Schema::Result::ChatsUser

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

=head1 TABLE: C<chats_users>

=cut

__PACKAGE__->table("chats_users");

=head1 ACCESSORS

=head2 chat_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 uid

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 joined

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "chat_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "uid",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "joined",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2016-06-10 09:41:30
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zEBOz+5rUdyzMBbRLVBXLg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
