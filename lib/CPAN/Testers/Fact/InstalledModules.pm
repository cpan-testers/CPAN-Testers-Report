# Copyright (c) 2009 by David Golden. All rights reserved.
# Licensed under terms of Perl itself (the "License").
# You may not use this file except in compliance with the License.
# A copy of the License was distributed with this file or you may obtain a 
# copy of the License from http://dev.perl.org/licenses/

package CPAN::Testers::Fact::InstalledModules;
use strict;
use warnings;
use Carp ();

use Metabase::Fact::Hash;
our @ISA = qw/Metabase::Fact::Hash/;

our $VERSION = '1.999';
$VERSION = eval $VERSION; ## no critic

sub optional_keys { qw/prereqs toolchain undeclared/ };

sub validate_content {
  my ($self) = @_;
  $self->SUPER::validate_content;
  my $content = $self->content;
  for my $key ( keys %$content ) {
    Carp::croak "key '$key' must be a hashref" unless ref $content->{$key} eq 'HASH';
  }
}

1;

__END__

=head1 NAME

CPAN::Testers::Fact::InstalledModules - versions of particular modules installed on a system

=head1 SYNOPSIS

  my $fact = CPAN::Testers::Fact::InstalledModules->new({
    resource => 'cpan:///distfile/RJBS/CPAN-Metabase-Fact-0.001.tar.gz',
    content     => {
      prereqs => {
        'Test::More' => '0.80',
      },
      toolchain => {
        'CPAN' => '1.92', 
      },
    },
  });

=head1 DESCRIPTION

Versions detected of modules installed on a system.  There are three valid
types: prereqs, toolchain, undeclared.  

Prereqs are the versions of modules listed in any of the prerequisite fields.  

Toolchain module versions are intended to reflect the state of the toolchain
used to test the distribution (e.g.  CPAN, Test::Harness, etc.).  

Undeclared module versions capture the version of modules that were detected
as being used by the distribution, but that were not listed explicitly as 
prerequisites.  This will often be core modules or submodules, but could 
include missing dependencies.

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


