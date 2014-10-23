package LinkedList;

use Moose;
use 5.12.0;
use Node;

has 'head' => (is =>'rw', isa=>'Node',reader=>'get_head',writer=>'_set_head',);

has 'size' => (is =>'ro', isa=>'Int', default=>sub{0},reader=>'get_size',writer=>'_set_size',);

sub add_node{
	my $self = shift;
	my $val = shift;
	my $node = Node->new(val=>$val);
	my $cur = $self->get_head();
	if(!$cur){
		$self->_set_head($node);
		$self->_set_size(1);
		return;	
	}
	while($cur->get_next()){
		$cur = $cur->get_next();
	}
	$cur->_set_next($node);
	$self->_set_size($self->get_size()+1);
}

sub delete_node {
	my $self = shift;
	my $val = shift;
	if($val == $self->get_head()->get_val()){
		my $head = $self->get_head();
		if($head->get_next()){
			my $newhead = $head->get_next();
			$self->set_head($newhead);
			return;
		} else {
			$self = new LinkedList->new();
			return;
		}
	}
	my $cur = $self->get_head();
	while($cur){
		return unless $cur->get_next();
		if($cur->get_next()->get_val() == $val){
			$cur->_set_next($cur->get_next()->get_next());
			$self->_set_size($self->get_size()-1);
		}
		$cur = $cur->get_next();		
	}
}

1;
