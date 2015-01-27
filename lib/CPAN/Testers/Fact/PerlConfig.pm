use 5.006;
use strict;
use warnings;

package CPAN::Testers::Fact::PerlConfig;
# ABSTRACT: Perl build and configuration information for a CPAN Testers report

our $VERSION = '1.999004';

use Carp ();

use Metabase::Fact::Hash 0.016;
our @ISA = qw/Metabase::Fact::Hash/;

sub required_keys { return qw/build config/ }

# XXX replace this with whatever Tux says is useful -- dagolden, 2009-03-30
sub content_metadata {
    my ($self) = @_;
    my $content = $self->content;
    return {
        osname   => $content->{config}{osname},
        archname => $content->{config}{archname},
        version  => $content->{config}{version},
    };
}

sub content_metadata_types {
    return {
        osname   => '//str',
        archname => '//str',
        version  => '//str',
    };
}

1;

__END__

=for Pod::Coverage required_keys

=head1 SYNOPSIS

  use Config::Perl::V;

  my $info = Config::Perl::V::myconfig();
  my $content; 
  @{$content}{build,config} = @{$info}{build,config};

  my $fact = CPAN::Testers::Fact::PerlConfig->new(
    resource => 'cpan:///distfile/RJBS/CPAN-Metabase-Fact-0.001.tar.gz',
    content     => $content,
  );

=head1 DESCRIPTION

Summarize perl build and config from a CPAN testers run 

=head1 USAGE

See L<Metabase::Fact>.

=head1 BUGS

Please report any bugs or feature using the CPAN Request Tracker.  
Bugs can be submitted through the web interface at 
L<http://rt.cpan.org/Dist/Display.html?Queue=CPAN-Testers-Report>

When submitting a bug or request, please include a test-file or a patch to an
existing test-file that illustrates the bug or desired feature.

=cut


