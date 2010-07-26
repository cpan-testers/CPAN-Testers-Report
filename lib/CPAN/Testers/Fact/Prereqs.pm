# Copyright (c) 2009 by David Golden. All rights reserved.
# Licensed under terms of Perl itself (the "License").
# You may not use this file except in compliance with the License.
# A copy of the License was distributed with this file or you may obtain a 
# copy of the License from http://dev.perl.org/licenses/

use strict;
use warnings;
package CPAN::Testers::Fact::Prereqs;
# ABSTRACT: prerequisites detected in running a CPAN Testers report

use Carp ();

use Metabase::Fact::Hash 0.016;
our @ISA = qw/Metabase::Fact::Hash/;

sub optional_keys { qw/configure_requires requires build_requires/ }

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


=head1 SYNOPSIS

  my $fact = CPAN::Testers::Fact::Prereqs->new(
    resource => 'cpan:///distfile/RJBS/CPAN-Metabase-Fact-0.001.tar.gz',
    content     => {
      configure_requires => {
        'ExtUtils::MakeMaker' => 0,
      },
      build_requires => {
        'Test::More' => '0.60',
      },
      requires => {
        'Carp' => 0,
        'File::Spec' => 0.82,
      },
    },
  );


=head1 DESCRIPTION

Prerequisites detected.  There are three valid types: configure_requires, requires,
and build_requires.

The prerequisite must be a version number or logical comparision as defined in the
META.yml specification document.

=head1 USAGE

See L<Metabase::Fact>.

=head1 BUGS

Please report any bugs or feature using the CPAN Request Tracker.  
Bugs can be submitted through the web interface at 
L<http://rt.cpan.org/Dist/Display.html?Queue=CPAN-Testers-Report>

When submitting a bug or request, please include a test-file or a patch to an
existing test-file that illustrates the bug or desired feature.

=cut


