
use strict;
use warnings;

BEGIN { require v5.6.0; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'A HTTP POE filter for HTTP clients or servers',
  'AUTHOR' => 'Chris Williams <chris@bingosnet.co.uk>',
  'BUILD_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.42',
    'Test::More' => '0.47',
    'Test::POE::Client::TCP' => '0.1',
    'Test::POE::Server::TCP' => '0.16'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'POE-Filter-HTTP-Parser',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'POE::Filter::HTTP::Parser',
  'PREREQ_PM' => {
    'Encode' => '0',
    'HTTP::Parser' => '0.06',
    'HTTP::Request' => '0',
    'HTTP::Response' => '0',
    'HTTP::Status' => '0',
    'POE' => '1.003'
  },
  'VERSION' => '1.06',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



