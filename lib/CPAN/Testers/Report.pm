# Copyright (c) 2009 by David Golden. All rights reserved.
# Licensed under terms of Perl itself (the "License").
# You may not use this file except in compliance with the License.
# A copy of the License was distributed with this file or you may obtain a 
# copy of the License from http://dev.perl.org/licenses/

package CPAN::Testers::Report;
use 5.006;
use strict;
use warnings;

our $VERSION = '0.11';
$VERSION = eval $VERSION; ## no critic

use base 'Metabase::Report';
__PACKAGE__->load_fact_classes;

sub report_spec { 
  return {
    'CPAN::Testers::Fact::LegacyReport' => 1,
    'CPAN::Testers::Fact::TestSummary' => 1, # include date
    'CPAN::Testers::Fact::TestOutput' => '0+', # eventually by phase
    'CPAN::Testers::Fact::TesterComment' => '0+',
    'CPAN::Testers::Fact::PerlConfig' => '0+',
    'CPAN::Testers::Fact::TestEnvironment' => '0+',
    'CPAN::Testers::Fact::Prereqs' => '0+', # declared versions
    'CPAN::Testers::Fact::InstalledModules' => '0+', 
    # XXX needs NNTP_ID for old reports -- dagolden, 2009-06-24
    # future goals
    # 'CPAN::Testers::Fact::TAPArchive' => 1, 
  }
}

sub content_metadata {
  my ($self) = @_;
  for my $fact ( $self->facts ) {
    next unless $fact->type eq 'CPAN::Testers::Fact::LegacyReport';
    return $fact->content_metadata;
  }
}
  
sub content_metadata_types {
  my ($self) = @_;
  for my $fact ( $self->facts ) {
    next unless $fact->type eq 'CPAN::Testers::Fact::LegacyReport';
    return $fact->content_metadata_types;
  }
}
  
1;

__END__

=head1 NAME

CPAN::Testers::Report - CPAN Testers report object

=head1 SYNOPSIS

  my $report = CPAN::Testers::Report->open(
    resource => 'cpan:///distfile/RJBS/CPAN-Metabase-Fact-0.001.tar.gz',
  );

  $report->add( CPAN::Testers::Fact::LegacyReport => {
    grade         => $tr->grade,
    osname        => $tr->osname,
    osversion     => $tr->osversion
    archname      => $tr->archname
    perlversion   => $tr->perl_version_number
    textreport    => $tr->report
  });

  # TestSummary happens to be the same as content metadata 
  # of LegacyReport for now
  $report->add( CPAN::Testers::Fact::TestSummary =>
    $report->facts->[0]->content_metadata()
  );
    
  $report->close();

=head1 DESCRIPTION

Metabase report class encapsulating Facts about a CPAN Testers report

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



