package Test2::Require::Dev;

use strict;
use warnings;
use 5.008001;
use Path::Tiny qw( path );
use JSON::PP qw( decode_json );
use base qw( Test2::Require );

# ABSTRACT: Only run a test in development tree or in dev releases
# VERSION

=head1 SYNOPSIS

 use Test2::Require::Dev;
 use Test2::v0;
 
 ok 1; # only tested during development
       # and development releases
 
 done_testing;

=head1 DESCRIPTION

This is module skips the test file (.t) unless it detects that it is either
running in a development tree (one without a META.json file) or on a development
release (when release_status does not equal stable).  This is useful for tests
that you want to run during development AND on development releases with the
intent of getting cpantesters results, but do not want such experimental tests
to run for production releases.

=head1 SEE ALSO

=over 4

=item L<Test2::Suite>

=item L<Test2::Require>

=back

=cut

sub skip
{
  my $meta = path('META.json')->absolute;
  return undef unless -f $meta;
  $meta = decode_json($meta->slurp);
  return undef unless $meta->{release_status} eq 'stable';
  return 'Test runs only on development release';
}

1;
