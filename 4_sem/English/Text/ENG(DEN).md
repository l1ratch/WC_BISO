1. Introduction
DNS is one of the most important network infrastructures, mainly responsible for the transformation of
domain names into IP addresses. Almost all Internet applications depend on DNS. Due to the easy
implementation, difficult tracking and serious consequences, distributed denial of service attack become
a major problem of network security. And the DDoS against DNS will bring great damages and
extensive influence.
In October 2016, Dyn, a service provider, suffered a DDoS attack of its DNS, which took down the
service for many websites, including Visa, Amazon, GitHub, and so on. It was one of the largest
bandwidth DDoS attacks ever recorded, with attack bandwidth over 650 Gbps. In October 2019, the
DNS server of the famous cloud services company AWS suffered a DDoS attack, which lasted for 15
hours and caused partial AWS service to be paralyzed.
DNS has the following security vulnerabilities related to denial-of-service attacks.
a) Lack of legitimacy verification: The client program determines whether the response matches with
the query through the port number and serial number, but there is no mechanism to authenticate the
legitimacy of the reply content. It is easy to receive the reply message of incorrect mapping between
domain name and IP address.
b) Open system: The DNS system is open and provides services continuously. The data on most DNS
servers is unencrypted and has no access restrictions. Customers in different regions can access the same
DNS server, and most DNS servers allow recursive queries.
c) Connectionless: Each access is independent. Most of the network layer protocol used by DNS
clients and servers for query requests is UDP, which does not require three-way-handshake.
d) Stateless: It means that the protocol has no memory for transactions. The DNS server does not
record the client's request or its own response. If the client requests the same domain name resolution
repeatedly, the server responds to the query continuously. The attacker can conceal himself from
traceability very well.
Open systems result of DNS having to accept all user requests unconditionally, and the attack
messages of DNS are all legitimate DNS UDP requests, which are difficult to be recognized by ordinary
DDoS protection equipment. The failure of a single DNS server or domain name can cause the failure
of other DNS systems, and causing Dominoes Effect.
In this paper, we try to further understand DDoS attack based on DNS, analyze and summarize the
attack characteristics and defense methods, aiming to lay a theoretical foundation for future research.
The remaining part is organized as follows. Section 2 discusses the classification of attacks, Section 3
summarizes current detection and defense methods, and make a conclusion in Section 4.
2. Attack classification
We can divide DNS DDoS attacks into different types according to its attack path, target, mode, etc.
According to the attack path, it can be divided into direct attack and stepping attack. Direct attack is to
send flood DNS request message to the target DNS server directly. Stepping attack does not attack the
target DNS server directly, but by sending flood DNS request message to the common recursive server.
When it comes to attack target, one is aimed at the DNS server, and another is using DNS server as
an attack amplifier to cause other host denying of service.
According to the mode of resource consumption, it can be divided into server resource consumption
and bandwidth resource consumption. Server resource consumption is to send a large number of
flooding DNS requests, consume the resources of DNS server, make it reach or exceed the service limit.
For example, the domain name prefix or suffix DNS flood attack. Bandwidth resource consumption is
to consume the outlet bandwidth of the DNS system, block the normal DNS reply message to the user.
Such as DNS flood amplification attack.
According to the attack mode, it can be divided into DNS query flood, DNS reply flood, DNS water
torture attack and hybrid attack. DNS query flood is to send a large number of DNS query requests to
the selected server directly, forcing the server to run out of resources [1]. DNS reply flood is by using
the open recursive service of DNS server to amplify the attack traffic and carry out DDoS attack on
some victims. 
