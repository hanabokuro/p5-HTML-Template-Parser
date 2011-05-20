use strict;
use warnings;

use inc::Module::Install;

all_from 'lib/HTML/Template/Parser.pm';

tests_recursive;

WriteAll;


