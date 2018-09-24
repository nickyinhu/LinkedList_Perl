use LinkedList;
use strict;
use warnings;
use feature 'say';

my $list = LinkedList->new();

$list->add_node(1);

say $list->get_head()->get_val();

$list->add_node(2);
$list->add_node(3);
$list->add_node(4);
$list->add_node(5);

my $node = $list->get_head()->get_next();

say $node->get_val();

$list->delete_node(3);

my $next = $node->get_next();

say $next->get_val();

say $list->get_size();
