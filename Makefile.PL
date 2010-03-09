require 5.006;
use inc::Module::Install;

all_from('lib/CPAN/Testers/Report.pm');

requires      ('Carp'                         => 0       );
requires      ('Metabase::Fact::Hash'         => 0.003   );
requires      ('Metabase::Fact::String'       => 0.003   );
requires      ('Metabase::Report'             => 0.003   );
requires      ('base'                         => 2.14    );
build_requires('File::Find'                   => 0       );
build_requires('File::Spec'                   => 3.31    );
build_requires('Test::More'                   => 0.88    );
  
extra_tests;

WriteAll;
