package Node;

use Moose;
use strict;
use warnings;

has 'val' => (
    is     =>'ro',
    isa    =>'Int',
    reader => 'get_val',
    documentation => 'The value of the node',
);

has 'next' => (
    is      => 'ro',
    isa     => 'Node',
    reader  => 'get_next',
    writer  => '_set_next',
    documentation => 'The next node in the list',
);

1;
