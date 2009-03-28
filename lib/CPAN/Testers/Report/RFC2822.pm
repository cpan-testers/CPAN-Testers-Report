# Copyright (c) 2009 by David Golden. All rights reserved.
# Licensed under terms of Perl itself (the "License").
# You may not use this file except in compliance with the License.
# A copy of the License was distributed with this file or you may obtain a 
# copy of the License from http://dev.perl.org/licenses/

package CPAN::Testers::Report::RFC2822;
use strict;
use warnings;

our $VERSION = '0.001';
$VERSION = eval $VERSION; ## no critic

sub validate_content {
  my ($self) = @_;
  Carp::croak "plain scalars only please" if ref $self->content;
  Carp::croak "non-empty scalars please"  if ! length $self->content;
}

sub content_as_string {
  my ($self) = @_;

  return $self->content;
}

sub content_from_string { 
  my ($class, $string) = @_;

  $string = $$string if ref $string;

  return $string;
}

1;

__END__

=begin wikidoc

= NAME

CPAN::Testers::Report::RFC2822 - Add abstract here

= VERSION

This documentation describes version %%VERSION%%.

= SYNOPSIS

    use CPAN::Testers::Report::RFC2822;

= DESCRIPTION


= USAGE


= BUGS

Please report any bugs or feature requests using the CPAN Request Tracker  
web interface at [http://rt.cpan.org/Dist/Display.html?Queue=CPAN-Testers-Report-RFC2822]

When submitting a bug or request, please include a test-file or a patch to an
existing test-file that illustrates the bug or desired feature.

= SEE ALSO


= AUTHOR

David A. Golden (DAGOLDEN)

= COPYRIGHT AND LICENSE

Copyright (c) 2009 by David A. Golden. All rights reserved.

Licensed under terms of Perl itself (the "License").
You may not use this file except in compliance with the License.
A copy of the License was distributed with this file or you may obtain a 
copy of the License from http://dev.perl.org/licenses/

Files produced as output though the use of this software, shall not be
considered Derivative Works, but shall be considered the original work of the
Licensor.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=end wikidoc

=cut

