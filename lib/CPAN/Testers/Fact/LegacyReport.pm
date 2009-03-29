# Copyright (c) 2009 by David Golden. All rights reserved.
# Licensed under terms of Perl itself (the "License").
# You may not use this file except in compliance with the License.
# A copy of the License was distributed with this file or you may obtain a 
# copy of the License from http://dev.perl.org/licenses/

package CPAN::Testers::Fact::LegacyReport;
use strict;
use warnings;
use Carp ();

use base 'CPAN::Metabase::Fact::Hash';

our $VERSION = '0.001';
$VERSION = eval $VERSION; ## no critic

sub validate_content {
  my ($self) = @_;
  my $content = $self->content;
  Carp::croak "content must be a hash-ref" if ref $content ne 'HASH';
  for my $key ( qw/grade osname osversion archname perlversion textreport/ ) {
    Carp::croak "missing key '$key'" 
      unless defined $content->{$key} && length $content->{$key};
  }
  # XXX no other keys allowed
  # XXX more validation, e.g. grade names, etc.
}

sub content_metadata {
  my ($self) = @_;
  my $content = $self->content;
  return {
    grade       => [ Str => $content->{grade} ],
    osname      => [ Str => $content->{osname} ],
    archname    => [ Str => $content->{archname} ],
    perlversion => [ Num => $content->{perlversion} ],
  }
}
  
1;

__END__

=head1 NAME

CPAN::Testers::Report::LegacyReport - an email-style report for CPAN Testers

=head1 SYNOPSIS

  # assume $tr is an (upgraded) Test::Reporter object
  # that has the accessors below (it doesn't yet)
  
  my $fact = CPAN::Testers::LegacyReport->new({
    resource => 'RJBS/CPAN-Metabase-Fact-0.001.tar.gz',
    content     => {
      grade         => $tr->grade,
      osname        => $tr->osname,
      osversion     => $tr->osversion
      archname      => $tr->archname
      perlversion   => $tr->perl_version_number
      textreport    => $tr->report
    },
  });

=head1 DESCRIPTION

Wraps up old-style CPAN Testers report

=head1 USAGE


=head1 BUGS

Please report any bugs or feature using the CPAN Request Tracker.  
Bugs can be submitted through the web interface at 
L<http://rt.cpan.org/Dist/Display.html?Queue=CPAN-Metabase-Fact>

When submitting a bug or request, please include a test-file or a patch to an
existing test-file that illustrates the bug or desired feature.

=head1 AUTHOR

=over 

=item * David A. Golden (DAGOLDEN)

=item * Ricardo J. B. Signes (RJBS)

=back

=head1 COPYRIGHT AND LICENSE

 Portions copyright (c) 2008-2009 by David A. Golden
 Portions copyright (c) 2008-2009 by Ricardo J. B. Signes

Licensed under the same terms as Perl itself (the "License").
You may not use this file except in compliance with the License.
A copy of the License was distributed with this file or you may obtain a 
copy of the License from http://dev.perl.org/licenses/

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=cut

