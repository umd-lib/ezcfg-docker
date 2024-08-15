use strict;

use lib qw(/aleph/a23_1/product/local/apache/perl5 /aleph/a23_1/pds/program);


$ENV{MOD_PERL} or die "not running under mod_perl!";

use LWP::UserAgent ( );
use CGI ( );
CGI->compile(':all');

1;

