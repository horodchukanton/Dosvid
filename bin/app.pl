#!/usr/bin/env perl

BEGIN {
    our $Bin;
    use FindBin '$Bin';
    use lib "$Bin/../lib";
    use lib "$Bin/../";
}

use Dancer2 appname => 'Dosvid';;
use Dosvid;

dance;
