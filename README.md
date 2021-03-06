# ElkStak-Project

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.
![image](https://user-images.githubusercontent.com/89826430/147420850-45f252e7-464d-447f-9b39-ba5262738c3b.png)



 
These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.
 
  - install-filebeat.yml
 
This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build
 
 
### Description of the Topology
The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.
 
Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
- Load balancing helps protect against cyber attacks such as, Distributed Denial-of-Service (DDoS) of attacks. By distributing traffic amongst servers to lighten the load of potential malious traffic. One benefit of using a jump box is that it retricts access and protects your virtual machines from the internet.
 
Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log files and system metrics.
- Filebeat monitors log files
- Metricbeat monitors metrics 
 
The configuration details of each machine may be found below.
 
| Name 	   | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Ubuntu 18.04-LTS |
| Web-1 	 | VM       | 10.0.0.5   | Ubuntu 18.04-LTS |
| Web-2	   | VM       | 10.0.0.6   | Ubuntu 18.04-LTS |
| RedElk   | ElkStak  | 10.1.0.4   | Ubuntu 18.04-LTS	|
 
### Access Policies
 
The machines on the internal network are not exposed to the public Internet.
 
Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Home-IP
 
Machines within the network can only be accessed by SSH via the Jump Box
- 10.0.0.4
 
A summary of the access policies in place can be found in the table below.
 
| Name 	| Publicly Accessible | Allowed IP Addresses |
|----------|------------------|----------------------|
| Jump Box | No          	    | Home-IP	             |
| Web-VM's | No              	| 10.0.0.4 & Home-IP   |
| RedElk   | No    	          | 10.0.0.4 & Home-IP   |
 
### Elk Configuration
 
Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because Ansible can ensure that provisioning scripts can be identically run between systems and users.
 
The playbook implements the following tasks:
- Installs Docker.io on the ELK machine
- Installs Python3-pip
- pip installs docker module
- Uses sysctl to increase System Virtual Memory
- Downloads and launches a docker elk container with exposed ports
- Enables Docker service on boot
  
 
The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.
![image](https://user-images.githubusercontent.com/89826430/147420057-9409b3e3-9408-4275-8f61-b3bafdf1e741.png)

 
### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.5 (Web-1)
- 10.0.0.6 (Web-2)
 
We have installed the following Beats on these machines:
- Filebeat
- Metricbeat
 
These Beats allow us to collect the following information from each machine:
- Filebeat collects log events, which we use to track and monitor user log messages.
- Metricbeat collects metric data, which we use to track user system health and metrics.
 
### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned:
 
SSH into the control node and follow the steps below:
- Copy the configuration files and the playbooks to /etc/ansible.
- Update the hosts file to include private IP address of the machine you wish install and configure ELK in.
- Run the playbook, and navigate to Kibana (Public_IP:5601) to check that the installation worked as expected.
 

- Which file is the playbook? Where do you copy it?
    - The playbook files would be a YAML (.yml) file and it should be copied into the /etc/ansible directory into the ansible container.   
- Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?
    - You must update the hosts file in the etc/ansible directory. By adding the private ip address of the specific machine or machines you wish to install ELK or Filebeat on.

- Which URL do you navigate to in order to check that the ELK server is running?
    - http://[your.VM.IP]:5601/app/kibana
   
## User commands:
-To run the playbooks for the ansible installations you need to run the following command:
  - ansible-playbook (name-of-playbook)

