use utf8;
package Dosvid::Schema::Result::Message;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Dosvid::Schema::Result::Message

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

=head1 TABLE: C<messages>

=cut

__PACKAGE__->table("messages");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 created

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head2 is_read

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 readed

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head2 sender

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 receiver

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 header

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 120

=head2 message

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "created",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
  "is_read",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "readed",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
  "sender",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "receiver",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "header",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 120 },
  "message",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2016-06-10 09:41:30
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:w2CsbU5HWzNgIR/2VhdiIw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
