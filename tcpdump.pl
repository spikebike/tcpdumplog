#!/usr/bin/perl
#tcpdump.pl - designed to parse the output of tcpdump, something like
#              tcpdump -n -c 1000 | ./tcpdump.pl | head -20
#
#             Written by Bill Broadley bill@broadley.org
$lines=0;
$lengths=0;
while (<>)
{
        $lines++;
        if (/(\S+) > (\S+): .* length (\S+)/)
        {
                $lengths++;
                $bytes{$1." -> ".$2} += $3;
        }
}

print "lines=$lines lengths=$lengths\n";

foreach $i (sort { $bytes{$b} <=> $bytes{$a} } keys %bytes)
{
        printf "%10d %s\n",$bytes{$i},$i;
}

