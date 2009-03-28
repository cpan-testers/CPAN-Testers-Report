# Copyright (c) 2009 by David Golden. All rights reserved.
# Licensed under terms of Perl itself (the "License").
# You may not use this file except in compliance with the License.
# A copy of the License was distributed with this file or you may obtain a 
# copy of the License from http://dev.perl.org/licenses/

package CPAN::Testers::Report;
use strict;
use warnings;

our $VERSION = '0.001';
$VERSION = eval $VERSION; ## no critic

use base 'CPAN::Metabase::Report';

sub report_spec { 
  return {
    'CPAN::Testers::Fact::LegacyReport' => 1,
    'CPAN::Testers::Fact::TestSummary' => 1, # include date
    'CPAN::Testers::Fact::TestOutput' => 1, # eventually by phase
    'CPAN::Testers::Fact::TesterComment' => 1,
    'CPAN::Testers::Fact::PerlMyConfig' => 1,
    'CPAN::Testers::Fact::TestEnvironment' => 1,
    'CPAN::Testers::Fact::Prereqs' => 1, # declared versions
    # Installed modules spec: 
    # Foo::Bar => { type => 'prereq|toolchain|undeclared|loaded'?, version => 123 }
    'CPAN::Testers::Fact::InstalledModules' => 1, 
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
  
1;

__END__


