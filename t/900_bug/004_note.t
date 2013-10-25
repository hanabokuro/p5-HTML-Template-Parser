use strict;
use warnings;
use Test::More;

use HTML::Template::Parser::ExprParser;

use t::lib::Util;

expr_eq('not e', [ 'op', 'not', [ 'variable', 'e', ]]);
expr_eq('note',  [ 'variable', 'note', ]);

expr_eq('a and b',  [ 'op', 'and', [ 'variable', 'a', ], [ 'variable', 'b', ]]);
test_error_message('a andb',  qr/ andb/);

expr_eq('a or b',  [ 'op', 'or', [ 'variable', 'a', ], [ 'variable', 'b', ]]);
test_error_message('a orb',  qr/ orb/);

done_testing;

sub test_error_message {
    my($expr, $remain_re) = @_;

    my $parser = HTML::Template::Parser::ExprParser->new;
    my $expr_temp = $expr;
    my $list = $parser->parse(\$expr_temp);

    like($expr_temp, $remain_re, "expr is [$expr]");
}
