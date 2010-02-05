# Copyright (c) 2009 by David Golden. All rights reserved.
# Licensed under terms of Perl itself (the "License").
# You may not use this file except in compliance with the License.
# A copy of the License was distributed with this file or you may obtain a 
# copy of the License from http://dev.perl.org/licenses/

package CPAN::Testers::Fact::PerlConfig;
use strict;
use warnings;
use Carp ();

use base 'Metabase::Fact::Hash';

our $VERSION = '0.11';
$VERSION = eval $VERSION; ## no critic

sub required_keys { return qw/build config/ }

# XXX replace this with whatever Tux says is useful -- dagolden, 2009-03-30 
sub content_metadata {
  my ($self) = @_;
  my $content = $self->content;
  return {
    osname      => $content->{config}{osname},
    archname    => $content->{config}{archname},
    version     => $content->{config}{version},
  }
}
  
sub content_metadata_types {
  return {
    osname      => '//str',
    archname    => '//str',
    version     => '//str',
  }
}
  
1;

__END__

=head1 NAME

CPAN::Testers::Fact::PerlConfig - Perl build and configuration information for a CPAN Testers report

=head1 SYNOPSIS

  use Config::Perl::V;

  my $info = Config::Perl::V::myconfig();
  my $content; 
  @{$content}{build,config} = @{$info}{build,config};

  my $fact = CPAN::Testers::Fact::PerlConfig->new(
    resource => 'cpan:///distfile/RJBS/CPAN-Metabase-Fact-0.001.tar.gz',
    content     => $content,
  );

=head1 DESCRIPTION

Summarize perl build and config from a CPAN testers run 

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


