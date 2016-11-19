This is a simple script to help show where your network bandwidth is going.

It shows two reports, one for host:port pairs:

sorted list of host:port pairs
 124377884 10.22.5.12.720 -> 10.22.5.30.2049 5494.358957 kbit/sec
  84917064 128.120.242.198.53 -> 10.22.5.30.50420 3751.188042 kbit/sec
  57499836 10.22.5.2.684 -> 10.22.5.30.2049 2540.039505 kbit/sec
  13546400 10.22.6.22.680 -> 10.22.5.30.2049 598.408509 kbit/sec
   6961492 10.22.4.2.899 -> 10.22.5.30.2049 307.522002 kbit/sec
   6909428 10.22.4.22.851 -> 10.22.5.30.2049 305.222089 kbit/sec
   5417064 10.22.5.30.50420 -> 128.120.242.198.53 239.297318 kbit/sec
   2174896 10.22.6.12.978 -> 10.22.5.30.2049 96.075435 kbit/sec
   1071288 10.22.5.30.2049 -> 10.22.5.2.684 47.323854 kbit/sec
   1048420 10.22.5.30.2049 -> 10.22.6.12.978 46.313666 kbit/sec
    805796 10.22.5.30.2049 -> 10.22.6.22.680 35.595818 kbit/sec

Another just sorted on host:port:
sorted list of IP:port 
 215353700 10.22.5.30.2049 9513.190708 kbit/sec
 125039520 10.22.5.12.720 5523.586546 kbit/sec
  90334128 10.22.5.30.50420 3990.485360 kbit/sec
  90334128 128.120.242.198.53 3990.485360 kbit/sec
  58571124 10.22.5.2.684 2587.363359 kbit/sec
  14352196 10.22.6.22.680 634.004327 kbit/sec
   7083196 10.22.4.2.899 312.898243 kbit/sec
   7021228 10.22.4.22.851 310.160824 kbit/sec
   3223316 10.22.6.12.978 142.389101 kbit/sec
   1570072 10.22.5.30.6817 69.357501 kbit/sec
    382653 10.22.0.1.57554 16.903591 kbit/sec


It builds a list of IP:port pairs and sorts them by bandwidth.

To run:
   $ sudo tcpdump -n -c 100000 | ./tcpdump.pl

