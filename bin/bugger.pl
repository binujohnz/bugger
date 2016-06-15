#!/usr/bin/env perl

use strict;
use warnings;

use DBI;
use DBD::SQLite;
use Data::Dumper;
use FindBin;

use sigtrap 'handler', \&bg_handler, 'normal-signals';

my(%STATUS) = (
                'NEW' => 1,
                'OPEN' => 1,
                'CLOSED' => 1,
                'DELETE' => 1,
               );

my($dbh);
my($database) = "$FindBin::Bin/../data/bugger.dat";

sub bg_handler {
   my($sig) = @_;
}

sub main {
   my($rc) = 0;

   if ( -f $database ) {
      $dbh = DBI->connect("dbi:SQLite:dbname=$database","","");
      my $sth = $dbh->prepare("SELECT * FROM BG_USER");
  $sth->execute();
  my $row = $sth->fetch;

   print Dumper $row;
   }
   else {
      print "Error: Unable to find Database.. $database";
   }
   
   return $rc;

}

exit main();

__END__
