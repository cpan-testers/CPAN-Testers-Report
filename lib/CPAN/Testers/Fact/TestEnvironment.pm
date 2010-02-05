# Copyright (c) 2009 by David Golden. All rights reserved.
# Licensed under terms of Perl itself (the "License").
# You may not use this file except in compliance with the License.
# A copy of the License was distributed with this file or you may obtain a 
# copy of the License from http://dev.perl.org/licenses/

package CPAN::Testers::Fact::TestEnvironment;
use strict;
use warnings;
use Carp ();

use base 'Metabase::Fact::Hash';

our $VERSION = '0.11';
$VERSION = eval $VERSION; ## no critic

# special_vars: $^X, UID/EID, GID/EGID, win32 stuff from CPAN::Reporter
# -- dagolden, 2009-03-30 
sub optional_keys { qw/environment_vars special_vars/ }

sub validate_content {
  my ($self) = @_;
  $self->SUPER::validate_content;
  my $content = $self->content;
  for my $key ( keys %$content ) {
    Carp::croak "key '$key' must be a hashref" unless ref $content->{$key} eq 'HASH';
  }
}

# XXX do we want content_metadata? -- dagolden, 2009-03-30
 
1;

__END__

=head1 NAME

CPAN::Testers::Fact::TestEnvironment - Environment vars and other local context during a CPAN Testers report

=head1 SYNOPSIS

  my $fact = CPAN::Testers::Fact::TestEnvironment>new(
    resource => 'cpan:///distfile/RJBS/CPAN-Metabase-Fact-0.001.tar.gz',
    content     => {
      environment_vars => {
        PERL5LIB  => $ENV{PERL5LIB},
        TEMP      => $ENV{TEMP},
      },
      special_vars => {
        'EXECUTABLE_NAME' => $^X,
        'UID'             => $<,
      },
    },
  );


=head1 DESCRIPTION

Describes aspects of the environment during a CPAN Testers run.

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


