#!/usr/bin/perl
#tcpdump.pl - designed to parse the output of tcpdump, something like
#              tcpdump -n -c 1000 | ./tcpdump.pl
#
#             Written by Bill Broadley bill@broadley.org
$lines=0;
$lengths=0;
$minSec=86400;
$maxSec=0;
$eoct1=0;
$eoct2=0;	
while (<>)
{
	$lines++;
	@f = split / /;
	if (/(\S+) > (\S+): .* length (\S+)/)
	{
#ignore the port with $null
#		($aoct1,$boct1,$coct1,$doct1,$null) = split /\./,$1;
#		($aoct2,$boct2,$coct2,$doct2,$null) = split /\./,$2;
		($aoct1,$boct1,$coct1,$doct1,$eoct1) = split /\./,$1;
		($aoct2,$boct2,$coct2,$doct2,$eoct2) = split /\./,$2;
		$hosta=$aoct1 . "." .  $boct1 . "." . $coct1 . "." . $doct1 . "." . $eoct1;
		$hostb=$aoct2 . "." . $boct2 . "." . $coct2 . "." . $doct2 . ".". $eoct2;
#		print "hosta=$hosta hostb=$hostb\n";
		($hour,$min,$seconds) = split /:/,$f[0];
		$sec =$hour*60*60+$min*60+$seconds;
		if ( $sec < $minSec ){ 
			$minSec=$sec;
		}
		if ( $sec > $maxSec ){ 
			$maxSec=$sec;
		}
		$lengths++;
		$bytes{$hosta." -> ".$hostb} += $3;
		$solob{$hosta} += $3;
		$solob{$hostb} += $3;
	}
}

$duration=$maxSec-$minSec;

print "lines=$lines lengths=$lengths\n";
print "sorted list of host:port pairs\n";
$total=0;
foreach $i (sort { $bytes{$b} <=> $bytes{$a} } keys %bytes)
{
	printf "%10d %s %f kbit/sec\n",$bytes{$i},$i,($bytes{$i}*8)/($duration*1000);
	$total=$total+$bytes{$i};
}
printf "total bytes=$total totaltime=$duration\n";
printf "bandwidth=%f kbit/sec\n\n",($total*8)/($duration*1000);

print "sorted list of IP:port \n";
$total=0;
foreach $i (sort { $solob{$b} <=> $solob{$a} } keys %solob)
{
        printf "%10d %s %f kbit/sec\n",$solob{$i},$i,($solob{$i}*8)/($duration*1000);
        $total=$total+$solob{$i};
}

printf "total bytes=$total totaltime=$duration\n";
printf "bandwidth=%f kbit/sec\n",($total*8)/(2*$duration*1000);
