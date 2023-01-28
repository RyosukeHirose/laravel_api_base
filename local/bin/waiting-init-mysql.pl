#!/usr/bin/env perl
use strict;
use warnings;
$|=1;

my $kid=open(my $log,"docker logs -f $ARGV[0] 2>&1 | ") || die $!;
my $count=0;

while(<$log>) {
	print "$_";
	if(m#usr/sbin/mysqld: ready for connections#){
		kill 2,$kid;
		print "** MySQLの起動を確認しました **\n";
		exit(0);
	}
	if(/Error/){
		kill 2,$kid;
		print "** MySQLの起動に失敗しました **\n";
		exit(1);
	}
}

