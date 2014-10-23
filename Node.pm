package Node;

use Moose;
use 5.12.0;

has 'val' => (is=>'ro', isa=>'Int', reader=>'get_val',);

has 'next' => (is=>'ro', isa=>'Node', reader=>'get_next', writer=>'_set_next',);

1;
