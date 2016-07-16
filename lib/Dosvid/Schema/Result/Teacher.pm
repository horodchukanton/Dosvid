use utf8;
package Dosvid::Schema::Result::Teacher;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Dosvid::Schema::Result::Teacher

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

=head1 TABLE: C<teachers>

=cut

__PACKAGE__->table("teachers");

=head1 ACCESSORS

=head2 uid

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 level

  data_type: 'smallint'
  is_nullable: 1

=head2 is_verified

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 documents

  data_type: 'mediumblob'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "uid",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "level",
  { data_type => "smallint", is_nullable => 1 },
  "is_verified",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "documents",
  { data_type => "mediumblob", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2016-06-10 09:41:30
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6TgbPArkS5Wug+uZYNECUg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
