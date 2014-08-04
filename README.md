This is a simple script to help show where your network bandwidth is going.

It builds a list of IP:port pairs and sorts them by bandwidth.

To run to see the top 20 bandwidth users:
   tcpdump -n -c 1000 | ./tcpdump.pl | head -20



