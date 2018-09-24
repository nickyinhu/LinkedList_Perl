package LinkedList;

use Moose;
use strict;
use warnings;
use Node;

has 'head' => (
	is     =>'ro',
	isa    =>'Node',
	reader => 'get_head',
	writer => '_set_head',
	documentation => 'The head of the linked list',
);

has 'size' => (
	is      => 'ro',
	isa     => 'Int',
	default => 0,
	reader  => 'get_size',
	writer  => '_set_size',
	documentation => 'The size of the linked list',
);

# Add a node to the end of the current linked list
# Args: val, value of the new node
sub add_node{
	my $self = shift;
	my $val = shift;
	my $node = Node->new(val=>$val);
	my $cur = $self->get_head();
	# If the list is empty, set the new node as the head
	if(!$cur){
		$self->_set_head($node);
		$self->_set_size(1);
		return;
	}
	# Add the new node to the end of the list
	while($cur->get_next()){
		$cur = $cur->get_next();
	}
	$cur->_set_next($node);
	$self->_set_size($self->get_size()+1);
}

# Remove a node from the list
# Args: val, the val of the node to be removed
sub delete_node {
	my $self = shift;
	my $val = shift;

	return unless $self->get_head();

	# If the val is the head's value
	if($val == $self->get_head()->get_val()){
		my $head = $self->get_head();

		if($head->get_next()){
			my $newhead = $head->get_next();
			$self->set_head($newhead);
			$self->_set_size($self->get_size()-1);
			return;
		# Head is the only node, remove the head, make self an empty list
		} else {
			$self = new LinkedList->new();
			$self->_set_size(0);
			return;
		}
	}
	# Iterate through linked list to check value of the nodes
	my $cur = $self->get_head();
	while($cur){
		return unless $cur->get_next();
		# Next node's value equals val, so remove next, and get next node's node and link it to current node
		if($cur->get_next()->get_val() == $val){
			$cur->_set_next($cur->get_next()->get_next());
			$self->_set_size($self->get_size()-1);
			return;
		}
		$cur = $cur->get_next();		
	}
}

1;
