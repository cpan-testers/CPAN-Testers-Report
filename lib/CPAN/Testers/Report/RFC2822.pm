# Copyright (c) 2009 by David Golden. All rights reserved.
# Licensed under terms of Perl itself (the "License").
# You may not use this file except in compliance with the License.
# A copy of the License was distributed with this file or you may obtain a 
# copy of the License from http://dev.perl.org/licenses/

package CPAN::Testers::Fact::LegacyReport;
use strict;
use warnings;
use Carp ();

use base 'CPAN::Metabase::Fact::Hash';

our $VERSION = '0.001';
$VERSION = eval $VERSION; ## no critic

sub validate_content {
  my ($self) = @_;
  my $content = $self->content;
  Carp::croak "content must be a hash-ref" if ref $content ne 'HASH';
  for my $key ( qw/grade osname osversion archname perlversion textreport/ ) {
    Carp::croak "missing key '$key'" 
      unless defined $content->{$key} && length $content->{$key};
  }
  # XXX no other keys allowed
  # XXX more validation, e.g. grade names, etc.
}

sub content_metadata {
  my ($self) = @_;
  my $content = $self->content;
  return {
    grade       => [ Str => $content->{grade} ],
    osname      => [ Str => $content->{osname} ],
    archname    => [ Str => $content->{archname} ],
    perlversion => [ Num => $content->{perlversion} ],
  }
}
  
1;

__END__

=head1 NAME

CPAN::Testers::Report::RFC2822 - an email-style report for CPAN::Testers

=head1 SYNOPSIS

  my $fact = TestReport->new({
    id => 'RJBS/CPAN-Metabase-Fact-0.001.tar.gz',
    content     => {
      status => 'FAIL',
      time   => 3029,
    },
  });

  $client->send_fact($fact);

=head1 DESCRIPTION

L<CPAN::Metabase|CPAN::Metabase> is a system for associating metadata with CPAN
distributions.  The metabase can be used to store test reports, reviews,
coverage analysis reports, reports on static analysis of coding style, or
anything else for which datatypes are constructed.

CPAN::Metabase::Fact is a base class for facts (really opinions or analyses)
that can be sent to or retrieved from a CPAN::Metabase system.

=head1 USAGE

[Talk about how to subclass...]

=head1 ATTRIBUTES

=head2 Set during construction 

=head3 id (required)

The canonical CPAN ID the Fact relates to.  For distributions, this is the 
'AUTHOR/Distname-Version.Suffix' form used to install specific distributions
with CPAN.pm -- for example, 'TIMB/DBI-1.604.tar.gz' for the DBI distribution.

=head3 content (required)

A reference to the actual information associated with the fact.
The exact form of the content is up to each Fact class to determine.

=head3 refers_to (optional)

Defaults to 'distribution'.  At some point, should CPAN::Metabase be expanded
to support other CPAN objects, could be 'author', 'module', 'bundle' and 
so on.

=head2 Generated during construction

These attributes are generated automatically during the call to C<new()>.  

=head3 type

The object's class name, with double-colons converted to dashes to be more
URI-friendly.  E.g.  'CPAN::Metabase::Fact' would be 'CPAN-Metabase-Fact'.

=head3 version

The schema_version() of the Fact subclass that created the object. This may or
may not be the same as the current schema_version() of the class if newer
versions of the class have been released since the object was created.

=head2 Generated during indexing

These attributes should only be set or modified by a CPAN::Metabase::Index
object.  Thus, they are 'undef' when a fact is created, are populated when
indexed, and are available when a Fact is queried from a Metabase.

=head3 guid

A global, unique identifier for a particular Fact in a particular Metabase.

=head3 content_meta

If a Fact subclass provides a C<meta_from_content()> method, it will be used to
populate this attribute with a hash of content-specific key/value pairs to be
used during indexing.  For example, a CPAN Testers report Fact might provide a
'grade' key with a value indicating a test result of 'FAIL'. 

=head3 index_meta

A hash of simple key/value pairs used to index the Fact in a Metabase.  These
are content-independent, and will generally relate to the CPAN object the
Fact refers to (e.g. distribution name, author, or version) or to the 
submission of the fact (e.g. submitter name or timestamp).

=head1 METHODS

=head2 new()

  $fact = CPAN::Metabase::Fact::TestFact->new(
    id => 'AUTHORID/Foo-Bar-1.23.tar.gz',
    content => $content_structure,
  );

Constructs a new Fact. The 'id' and 'content' attributes are required.  The

