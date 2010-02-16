require 5.006;
use inc::Module::Install;

all_from('lib/CPAN/Testers/Report.pm');

requires('Metabase::Fact::Hash'     => 0.002); 
requires('Metabase::Report'         => 0.002); 

test_requires('Test::More'      => 0.62);
test_requires('Test::Exception' => 0.26); # avoid bugs
  
extra_tests;

WriteAll;
