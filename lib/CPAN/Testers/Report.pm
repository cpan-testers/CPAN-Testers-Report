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
    'CPAN::Testers::Fact::RFC2822' => '1',
  }
}

1;

__END__


