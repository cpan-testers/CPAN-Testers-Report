# Copyright (c) 2009 by David Golden. All rights reserved.
# Licensed under terms of Perl itself (the "License").
# You may not use this file except in compliance with the License.
# A copy of the License was distributed with this file or you may obtain a 
# copy of the License from http://dev.perl.org/licenses/

package CPAN::Testers::Fact::TestSummary;
use strict;
use warnings;
use Carp ();

use base 'CPAN::Metabase::Fact::Hash';

our $VERSION = '0.001';
$VERSION = eval $VERSION; ## no critic

sub required_keys { qw/grade osname osversion archname perl_version/ }

sub content_metadata {
  my ($self) = @_;
  my $content = $self->content;
  return {
    grade         => [ Str => $content->{grade} ],
    osname        => [ Str => $content->{osname} ],
    archname      => [ Str => $content->{archname} ],
    perl_version  => [ Num => $content->{perl_version} ],
  }
}

# should validate grades, etc. -- dagolden, 2009-03-30 

1;

__END__

=head1 NAME

CPAN::Testers::Fact::TestSummary - summary of a CPAN Testers analysis of a distribution

=head1 SYNOPSIS

  # assume $tr is an (upgraded) Test::Reporter object
  # that has the accessors below (it doesn't yet)
  
  my $fact = CPAN::Testers::TestSummary->new(
    resource => 'cpan:///distfile/RJBS/CPAN-Metabase-Fact-0.001.tar.gz',
    content     => {
      grade         => $tr->grade,
      osname        => $tr->osname,
      osversion     => $tr->osversion
      archname      => $tr->archname
      perl_version  => $tr->perl_version_number
    },
  );

=head1 DESCRIPTION

Summarize CPAN testers run -- this is equivalent to the content of the old
email Subject line, plus explicit OS name and perl version, which previously had
to be parsed out of the report

=head1 USAGE

# XXX document valid grades, etc. -- dagolden, 2009-03-30 

=head1 BUGS

Please report any bugs or feature using the CPAN Request Tracker.  
Bugs can be submitted through the web interface at 
L<http://rt.cpan.org/Dist/Display.html?Queue=CPAN-Testers-Report>

When submitting a bug or request, please include a test-file or a patch to an
existing test-file that illustrates the bug or desired feature.

=head1 AUTHOR

=over 

=item * David A. Golden (DAGOLDEN)

=back

=head1 COPYRIGHT AND LICENSE

Copyright (c) 2009 by David A. Golden

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


