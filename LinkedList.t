use LinkedList;
use strict;
use warnings;
use Test::More;

use_ok('LinkedList');

# Initialization test
my $list = LinkedList->new();
is($list->get_size, 0, 'Initiated a new empty list');
$list->add_node(2);
is($list->get_size, 1, 'Added one node successfully');
is($list->get_head()->get_val(), 2, 'Got the correct value');

# Add node test
$list->add_node(4);
$list->add_node(6);
$list->add_node(8);
$list->add_node(10);
is($list->get_size, 5, 'Added 4 more nodes successfully');

# Remove node test
my $node;
$node = $list->get_head()->get_next();
is($node->get_val(), 4, 'Got the correct value');

$list->delete_node(6);

$node = $node->get_next();
is($node->get_val(), 8, 'Removed the next node successfully');
is($list->get_size, 4, 'Removed one node successfully');

# Edge cases
$list->delete_node(11);
is($list->get_size, 4, 'Nothing to remove');

$list = LinkedList->new();
$list->delete_node(1);
is($list->get_size, 0, 'Nothing to remove');
is($list->get_head, undef, 'Empty list');

$list->add_node(4);
$list->delete_node(4);
is($list->get_size, 0, 'Removed the only node, size is 0 now');
is($list->get_head, undef, 'Removed the only node, it is now empty');

done_testing();