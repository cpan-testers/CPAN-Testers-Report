# Copyright (c) 2009 by David Golden. All rights reserved.
# Licensed under terms of Perl itself (the "License").
# You may not use this file except in compliance with the License.
# A copy of the License was distributed with this file or you may obtain a 
# copy of the License from http://dev.perl.org/licenses/

package CPAN::Testers::Fact::LegacyReport;
use strict;
use warnings;
use Carp ();

use Metabase::Fact::Hash;
our @ISA = qw/Metabase::Fact::Hash/;

our $VERSION = '1.999';
$VERSION = eval $VERSION; ## no critic

sub required_keys { qw/grade osname osversion archname perl_version textreport/ }

sub content_metadata {
  my ($self) = @_;
  my $content = $self->content;
  return {
    grade       => $content->{grade},
    osname      => $content->{osname},
    osversion   => $content->{osversion},
    archname    => $content->{archname},
    perl_version => $content->{perl_version},
  };
}
  
sub content_metadata_types {
  return {
    grade       => '//str',
    osname      => '//str',
    osversion   => '//str',
    archname    => '//str',
    perl_version => '//str',
  };
}
  
1;

__END__

=head1 NAME

CPAN::Testers::Fact::LegacyReport - an email-style report for CPAN Testers

=head1 SYNOPSIS

  # assume $tr is an (upgraded) Test::Reporter object
  # that has the accessors below (it doesn't yet)
  
  my $fact = CPAN::Testers::Fact::LegacyReport->new({
    resource => 'cpan:///distfile/RJBS/CPAN-Metabase-Fact-0.001.tar.gz',
    content     => {
      grade         => $tr->grade,
      osname        => $tr->osname,
      osversion     => $tr->osversion
      archname      => $tr->archname
      perl_version  => $tr->perl_version_number
      textreport    => $tr->report
    },
  });

=head1 DESCRIPTION

Wraps up old-style CPAN Testers report

=head1 USAGE


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

