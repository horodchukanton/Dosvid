use utf8;
package Dosvid::Schema::Result::UsersScienceChapter;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Dosvid::Schema::Result::UsersScienceChapter

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

=head1 TABLE: C<users_science_chapters>

=cut

__PACKAGE__->table("users_science_chapters");

=head1 ACCESSORS

=head2 uid

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 science_chapter_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 level

  data_type: 'smallint'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "uid",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "science_chapter_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "level",
  { data_type => "smallint", default_value => 0, is_nullable => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2016-06-10 09:41:30
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:t+bjglgtvRgaveZMEKRAwQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
