# 0x09. Web infrastructure design
## About this projecrt:
Web infrastructure refers to the underlying framework and components necessary to support the functioning, accessibility, and performance of web-based applications, websites, or services. It involves a combination of hardware, software, networking, and other resources required to deliver content and services over the internet.  
A well-designed web infrastructure is critical for delivering reliable, fast, and secure web experiences to users. It directly impacts user satisfaction, website performance, and the success of web-based applications or services in an increasingly connected digital world.
So understanding each component of a web design infrastructure is essential.  

**Server:**  
is a computer or software dedicated to providing services, resources, or functionalities to other devices or users within a network. It responds to requests, such as serving web pages, handling email, storing files, or executing application code. Servers play a central role in facilitating communication, data storage, and the delivery of services across networks like the internet.   

**Web server:**  
A web server is a specialized computer or software that stores and delivers web content, such as web pages, images, videos, and other (html, css, js) files, to the user's browsers upon request. It's the foundational component responsible for hosting websites and serving their content over the internet. Web servers handle HTTP requests from clients (like web browsers) and respond by sending the requested web pages or files.  

**Application server:**  
An application server is a software framework or platform responsible for executing, managing, and delivering backend application logic or business processes to client applications or users. It provides an environment for running software applications and handling tasks such as transaction management, security, scalability, and data access.  

**database:**  
A database is a structured collection of organized data stored electronically, typically managed by a database management system (DBMS). It serves as a central repository for storing, managing, and retrieving data in a systematic and efficient manner  

**DNS:**  
DNS, or Domain Name System, is like the internet's address book. It translates human-friendly domain names (like example.com) into machine-readable IP addresses (like 192.0.2.1) that computers use to communicate with each other.
in case when the browser/os didn't find the IP of a domain name then the `Resolver` is called its the (ISP) internet service provider that responsible for finding the IP :  
Resolver -> Root -> TLD (Top Level Domain) (ex: .COM) -> Authoritative (ex: n1.example.com)  
the Authoritatives are servers that contain the Records and data about a domain name. they are created along when a domain name is created to hold the IP addresses and other info about a DN.  
**DNS record types:**  
*A Record:* or Adress Record it holds the IP address of the Domain Name (DN <-> IP)  
*CNMAE Record:* records the different Domain Names that refers to the same Domain Name ex. both blog.example.com and store.example.com refer to example.com(DN <-> DN)  
*TXT Record* that hold many other data in the form of human readable informations.  
**Round Robin DNS:**  
it is an algorithem that allows to create and map multiple IP addresses to the same Domain Name. it is usefull since there will be multiple servers and network device that are needed for a web server of application.  

**Load balancer:**  
A load balancer acts as a traffic manager, distributing incoming network traffic across multiple servers or resources to optimize performance, ensure high availability, and prevent overload on any single server. It efficiently balances the workload by directing requests, such as web traffic, across a group of servers, helping to avoid bottlenecks and improve the overall reliability and responsiveness of applications or services.  

**Monitoring:**  
`You can not fix and improve what you can not measure`  
Monitoring involves observing and tracking various aspects of systems applicaitons, networks to ensure proper functionning, performance, security and availability it is a process that helps in identifying issues anomalities or potential problems.  

**the difference between a web server and an app server**  
web servers focus on delivering static web content, while app servers handle application-specific functionalities and the dynamic processing needed for web applications. Often, both work together in a coordinated manner to deliver complete web applications.  

**SPOF**  
SPOF stands for Single Point of Failure. It refers to a part of a system that, if it fails, can cause the entire system to fail or significantly affect its operation. Having a single point of failure poses a risk because there's no redundancy or backup in place, making the system vulnerable to disruptions or downtime if that particular component fails. Systems are often designed to avoid SPOFs by introducing redundancy or failover mechanisms to ensure continued operation even if one part of the system fails.  

**How to avoid downtime when deploying new code**  
to avoid downtime when deploying new code involves implementing strategies that continue availability of services or software while updating or introducing new code without causing interruptions.  
Among the many strategies there is the:  
The *Blue-Green* deployment strategy, It involves maintaining two identical production environments, allowing for seamless transitions between the two.  

**High availability cluster (active-active/active-passive)**  
A high availability cluster is a setup where multiple interconnected systems or nodes work together to ensure continuous operation and minimize downtime.  
High availability clusters employ mechanisms such as load balancing, failover, and redundancy to enhance system reliability and ensure uninterrupted services for users.  
it uses the configurations "Active-active" and "active-passive"  for high availability setups for redundancy and fault tolerance:  
*Active-Active:*  
all systems or nodes are actively providing services simultaneously.  
Traffic or workload is distributed among all active systems.  
If one system fails, the others continue handling the load, ensuring continuous operation.  
*Active-Passive:*  
In an active-passive setup, one system actively serves incoming requests while others remain in a standby or passive state.  
If the active system fails, the passive system(s) take over and become active to handle the workload.  

**What is a firewall**  
A firewall is a security system, either software or hardware-based, that monitors and controls incoming and outgoing network traffic based on predetermined security rules. It acts as a barrier between a trusted internal network and untrusted external networks (like the internet), filtering data packets to prevent unauthorized access, malicious attacks, or potential threats from reaching or affecting the protected network. Firewalls help enforce network security policies and protect systems and data from various cyber threats.  

`these concepts will allows us to understand why we use certain components and how to use them in our web design infrastructure`
