#!/usr/bin/perl

use strict;
use warnings;

use HTML::Template::Parser;

foreach my $template_file (@ARGV){
    open(my $fh, $template_file) or die "Can't open file[$template_file]:[$!]\n";
    my $template_text;
    { local $/; $template_text = <$fh>; }

    eval {
        my $parser = HTML::Template::Parser->new;
        my $list = $parser->parse($template_text);
        my $tree = $parser->list_to_tree($list);
    };
    if($@){
        my $error = $@;
        print STDERR <<"END;";
file: $template_file
$@
END;
    }
}
