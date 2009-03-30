# Copyright (c) 2009 by David Golden. All rights reserved.
# Licensed under terms of Perl itself (the "License").
# You may not use this file except in compliance with the License.
# A copy of the License was distributed with this file or you may obtain a 
# copy of the License from http://dev.perl.org/licenses/

package CPAN::Testers::Fact::TestOutput;
use strict;
use warnings;
use Carp ();

use base 'CPAN::Metabase::Fact::Hash';

our $VERSION = '0.001';
$VERSION = eval $VERSION; ## no critic

sub optional_keys { qw/configure build test/ }
  
1;

__END__

=head1 NAME

CPAN::Testers::Fact::TestOutput - Captured output from configuration, build and test

=head1 SYNOPSIS

  my $fact = CPAN::Testers::Fact::TestOutput->new(
    resource => 'cpan:///distfile/RJBS/CPAN-Metabase-Fact-0.001.tar.gz',
    content => {
      configure => $makefile_pl_output,
      build     => $make_output,
      test      => $make_test_output,
    },
  );

=head1 DESCRIPTION


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


