# Copyright (c) 2009 by David Golden. All rights reserved.
# Licensed under terms of Perl itself (the "License").
# You may not use this file except in compliance with the License.
# A copy of the License was distributed with this file or you may obtain a 
# copy of the License from http://dev.perl.org/licenses/

use strict;
use warnings;
package CPAN::Testers::Fact::TestOutput;
# ABSTRACT: output from configuration, build and test

use Carp ();

use Metabase::Fact::Hash 0.016;
our @ISA = qw/Metabase::Fact::Hash/;

sub optional_keys { qw/configure build test/ }
  
1;

__END__

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

A fact to store output from configuration build and test.  Not generally used
if LegacyReport is used.

=head1 USAGE

See L<Metabase::Fact>.

=head1 BUGS

Please report any bugs or feature using the CPAN Request Tracker.  
Bugs can be submitted through the web interface at 
L<http://rt.cpan.org/Dist/Display.html?Queue=CPAN-Testers-Report>

When submitting a bug or request, please include a test-file or a patch to an
existing test-file that illustrates the bug or desired feature.

=cut


