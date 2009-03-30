# Copyright (c) 2009 by David Golden. All rights reserved.
# Licensed under terms of Perl itself (the "License").
# You may not use this file except in compliance with the License.
# A copy of the License was distributed with this file or you may obtain a 
# copy of the License from http://dev.perl.org/licenses/

use strict;
use warnings;

use Test::More;

# Work around buffering that can show diags out of order
Test::More->builder->failure_output(*STDOUT) if $ENV{HARNESS_VERBOSE};

my @classes = qw (
  CPAN::Testers::Report
  CPAN::Testers::Fact::TestSummary
  CPAN::Testers::Fact::TestOutput
  CPAN::Testers::Fact::LegacyReport
  CPAN::Testers::Fact::TesterComment
  CPAN::Testers::Fact::Prereqs
  CPAN::Testers::Fact::InstalledModules
  CPAN::Testers::Fact::TestEnvironment
  CPAN::Testers::Fact::PerlConfig
);

plan tests => scalar @classes;

require_ok( $_ ) for @classes;

