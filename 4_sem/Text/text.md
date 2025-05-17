# Text EN
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


# Text RU
1. ВВЕДЕНИЕ<br>
В сети самой базовой, важной и старой службой является DNS[1] (система доменных имён). Система доменных имён — это эффективная система в Интернете, которая решает проблему именования онлайн-компьютеров. Как и в случае с посещением друзей, сначала нужно узнать, как зовут других. Когда хост хочет получить доступ к другому хосту в Интернете, он должен сначала узнать его адрес. IP-адрес в TCP/IP состоит из четырёх чисел, разделённых точкой. Состав всегда не так удобен, как название, поэтому для управления соответствием между названием и IP-адресом используется система доменных имён[2]. Анализ данных DNS может выявить потенциальное поведение киберпреступников в интернете. Анализ исторических данных DNS и данных в реальном времени выявит потенциальные риски для безопасности в нашей школе и позволит изучить тенденцию развития сетевых вирусов, которые не могут быть обнаружены традиционными антивирусными программами, и реализовать функцию блокировки. DNS использует UDP-порт 53 для связи. Поэтому он легко подвергается атакам. В настоящее время, несмотря на то, что появились DNS через TLS и DNS через https, традиционный udp по-прежнему популярен. Злоумышленники используют доменные имена intelligence для распространения информации. Большое количество сетевых атак, таких как черви, майнинг, ботнеты, трояны, бэкдоры и удаленное управление, используют DNS-запросы для связи с сервером удаленного управления. Таким образом, в Интернете существует множество форм атак на уязвимости dns. Это DNS malformed packet attack, DNS malformed packet attack[3], DNS malformed packet attack - разновидность сетевой DDOS-атаки. Злоумышленник отправляет целевой DNS-серверу повреждённый пакет запроса, что приводит к сбою DNS или зависанию при обработке таких пакетов данных. Атака с усилением отражения[4] — злоумышленник использует тот факт, что пакет ответа DNS больше, чем пакет запроса, для усиления трафика. IP-адрес источника поддельного пакета запроса совпадает с IP-адресом жертвы, и трафик пакета ответа направляется на сервер жертвы, что снижает производительность сервера. Атака с использованием подстановочных доменных имён. Злоумышленник отправляет на рекурсивный сервер большое количество доменных имён, на которые не отвечает рекурсивный сервер, что приводит к постоянному потреблению системных ресурсов рекурсивным сервером и, следовательно, влияет на нормальное разрешение доменных имён. Атака с использованием DDoS-атаки по исходному адресу. Этот тип атаки означает, что конкретный заражённый терминал отправляет большое количество незаконных запросов и постоянно потребляет ресурсы рекурсивного сервера, влияя на нормальное разрешение. Целевая DDoS-атака на домен[5]: злоумышленник использует заражённый терминал или программу-зомби, чтобы инициировать большое количество случайных запросов к поддоменам домена жертвы для реализации DDoS-атаки на авторитетный сервер и связанные с ним рекурсивные серверы в целевом домене. Незаконная атака с захватом доменного имени[6]: захват доменного имени — это метод интернет-атаки. Атакуя сервер разрешения доменных имён (DNS) или подделывая сервер разрешения доменных имён (DNS), злоумышленники перенаправляют доменное имя целевого веб-сайта на неправильный IP-адрес, чтобы пользователь не мог получить доступ к целевому веб-сайту, или чтобы намеренно или злонамеренно заставить пользователей перейти по указанному IP-адресу (веб-сайту). Засорение кэша DNS[7] означает, что злоумышленники используют поддельные данные для загрязнения кэша DNS, побуждая пользователей переходить по незаконным адресам в кэше DNS, чтобы украсть данные и совершить другие атаки. Атака с использованием DNS-туннелирования[8]. Злоумышленники используют DNS в качестве скрытого канала связи для передачи конфиденциальных данных за пределы сети или для удалённого управления захваченным терминалом через DNS-туннель для проведения других атак. Это позволяет создать канал управления и связи через протокол DNS, что делает злоумышленника более скрытным. Вы можете получить доступ к любым данным, загружать и скачивать файлы, а также получить оболочку. Например, когда вы входите в сеть, требующую аутентификации, вы обнаруживаете, что все IP-адреса и порты недоступны, но можно использовать DNS-порт 53, что создаёт удобные условия для атак через DNS-туннели. 

2. МЕТОД ИССЛЕДОВАНИЯ<br>
Чтобы бороться со всё более изощрёнными и разнообразными методами DNS-атак, мы должны поддерживать передовые технологии.  И первым шагом является правильная идентификация и обнаружение этих атак.  Существует два способа распознавания данных: анализ полезной нагрузки и анализ трафика.  Анализ принципа атаки на основе доменного имени прикладного уровня. Метод обнаружения атак на основе DNS-данных, основанный на доменных именах прикладного уровня. В этом проекте в основном используются следующие два типа: во-первых, на основе метода обнаружения изменений в трафике доступа к DNS, изменений в трафике доступа к сети кампуса, можно эффективно уменьшить количество ошибок обнаружения, вызванных колебаниями трафика доступа к DNS. В этом проекте в основном отслеживаются данные DNS на узлах основной сети кампуса. С помощью данных о трафике доступа и информации Netflow можно извлечь атакуемый адрес и адрес источника атаки. Во-вторых, на основе метода обнаружения DNS-атак по количеству и распределению запросов к источнику данных доменного имени, чтобы скрыть атаку, злоумышленник в интернете может снизить скорость атаки и приблизить скорость атаки к нормальной скорости доступа, тем самым усложнив обнаружение. Однако при DDOS-атаке или атаке компьютерного вируса резкое увеличение количества обращений к доменному имени является отличительной особенностью атаки, и эту особенность невозможно скрыть. На основе этой особенности анализ выполняется с помощью облегчённой технологии анализа больших данных с открытым исходным кодом.
