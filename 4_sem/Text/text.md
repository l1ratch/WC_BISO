1. INTRODUCTION<br>
In the network, The most basic, important and oldest service is DNS[1] (domain name system) . The
domain name system is an effective system on the Internet that solves the naming of online machines.
Just like visiting friends, you need to know how others go first. When a host wants to access another
host on the Internet, you must first know its address. The IP address in TCP/IP is composed of four
numbers separated by "." The composition is always not as convenient as the name, so the domain
name system is used to manage the correspondence between the name and the IP[2]. Analysis of DNS
data can reveal potential cyber-attack behavior in the Internet. The analysis of historical and real-time
DNS data will reveal potential security risks in our school, and can explore the development trend of
some kind of network virus which cannot be found by traditional antivirus software, and realize the
blocking function.
DNS use udp port 53 for commination. So it is easily to be attacks. Nowadays although DNS over
TLS, DNS over https came out, traditional udp is still mainstream. Attackers use intelligence domain
names for outreach. A large number of network attacks such as worms, mining, botnets, Trojans,
backdoors, and remote control are using DNS requests to communicate with the remote control server.
So there are many forms of attacks against dns vulnerabilities on the Internet. They are DNS malformed
packet attack,
DNS malformed packet attack[3], DNS malformed packet attack is a kind of network DDOS attack.
The attacker sends a defective request packet to the target DNS server, causing DNS to crash or crash
while processing such data packets.
Reflection amplification attack[4], the attacker uses the feature that the DNS reply packet is larger
than the request packet to amplify the traffic. The source IP of the forged request packet is the victim IP,
and the traffic of the reply packet is introduced into the victim server, which degrades the server
performance.
Wildcard domain name attack, the attacker initiates a large number of unresponsive domain names
to the recursive server, causing the recursive server to continuously consume system resources, thereby
affecting normal domain name resolution.
Source address DDoS attack, this type of attack means that a specific infected terminal initiates a
large number of illegal requests and continuously consumes recursive server resources, affecting
normal resolution.
Target domain DDoS attack[5], the attacker uses the infected terminal or zombie program to initiate a
large number of random subdomain requests to the victim's domain to implement a DDoS attack on the
authoritative server and related recursive servers in the target domain.
Illegal domain name hijacking attack[6], Domain name hijacking is a method of Internet attack. By
attacking the domain name resolution server (DNS) or forging the domain name resolution server
(DNS), the target website domain name is resolved to the wrong IP address to achieve the purpose that
the user cannot access the target website or The purpose of deliberately or maliciously requiring users
to access the specified IP address (website).
DNS cache poisoning[7], DNS cache poisoning refers to that attackers use counterfeit data to pollute
the DNS cache, enticing users to access illegal addresses in the DNS cache, to achieve data theft and
other attacks.
DNS tunneling attack[8], Attackers use DNS as a covert communication channel to transmit sensitive
data outside the network, or remotely control the trapped terminal through a DNS tunnel to carry out
other attacks. It can create a C&C tunnel through the DNS protocol, making the attacker more covert.
You can access any data and upload and download files, and get a shell. For example, when you enter a
network that requires authentication, you find that all IPs and ports are inaccessible, but DNS port 53
can be used, which provides a convenient condition for DNS tunnel attacks.

2. RESEARCH METHOD<br>
In order to deal with the increasingly severe and diversified DNS attack methods, we must maintain the
leading technology. And the first step is to correctly identify and discover these attacks. There two
ways in data recognition, playload analysis and traffic analysis.
Analysis of attack principle based on application layer domain name. DNS data implementation
attack detection method based on application layer domain name This project mainly adopts the
following two types: First, based on the detection method of DNS access traffic change, the change of
access traffic of the campus network, the detection error caused by the fluctuation of the DNS access
traffic can be effectively reduced. By monitoring the core network nodes of the campus network, the
DNS data is mainly monitored in this project. Extract the attacked address and the attack source address
by using the access traffic data and Netflow information. Second, based on the DNS attack detection
method of the number and distribution of the domain name data request source, in order to hide the
attack, the attacker on the internet can reduce the attack rate and make the attack traffic rate close to the
normal access rate, thereby increasing the detection difficulty, but DDOS or computer virus attack, the
large increase in the number of access to a domain name is a distinct feature of the attack and this
feature cannot be hidden. Based on this feature, the analysis is performed using open source lightweight
big data analysis technology. 
