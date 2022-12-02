<!-----

Yay, no errors, warnings, or alerts!

Conversion time: 0.288 seconds.


Using this Markdown file:

1. Paste this output into your source file.
2. See the notes and action items below regarding this conversion run.
3. Check the rendered output (headings, lists, code blocks, tables) for proper
   formatting and use a linkchecker before you publish this page.

Conversion notes:

* Docs to Markdown version 1.0β33
* Fri Dec 02 2022 06:54:31 GMT-0800 (PST)
* Source doc: Born2beRoot Design Doc
----->



# Born2beRoot useful documentation


## Info / setup / monitoring


## Virtual Machine

Think of a virtual machine as a computer within a computer. VM’s create ‘fake’/virtual  hardware components tricking the virtual machine thinking they’re legit. Those components are based on the hardware used by the computer used to create the so-called virtual machine.

Concerning the **Hypervisor**, we’ll be using **VirtualBox** (type 2 hypervisor) since it’s free and has a lot of good options regarding VM’s. Type 2 means that the host OS’s (your computer) allows the guest OS’s (virtual machines) to use its resources. A (type 1 hypervisor) is directly installed in the machine (usually a server or so). They both do pretty much the same thing whereas the latter has full control over the machine.

[Straight forward explanation on VM's.](https://www.youtube.com/watch?v=wX75Z-4MEoM)


## Operating System

Since we only have two options available, I decided to stick with Debian because it is recommended if system administration is new to the student.

Both options are good and do the job. Anyway there are differences between them that we always should consider. Debian is easier to upgrade, has more up to date packages… On the other hand, if your web server is going to be used as a reseller tool, you may want to install cPanel and in this case, CentOS is recommended since it’s officially supported.

At the end of the day, just go with the one you feel most comfortable with.

Regarding GUI it does not matter because we are installing the minimum of services. No graphical interface or graphics server will be installed.

Some of the differences between CentOS and Debian:

[CentOS vs Debian - Infographics](https://cdn.educba.com/academy/wp-content/uploads/2018/09/CentOS-vs-Debian-1.jpg)

[Source: EDUCBA](https://www.educba.com/)


## Additional Info



* **APT** (advancing package tool) and **Aptitude** are both packaging management tools. Search, removal, installation or upgrading are some of the capabilities of packaging management tools. **APT** is a low level management tool whereas **Aptitude** is a high level one. **APT** can be used in other higher-level package managers. Overall **Aptitude** is more flexible and lets you have more control regarding package management.

	[apt-get / aptitude guide](https://www.fosslinux.com/43884/apt-vs-aptitude.htm)



* **SELinux** is a security architecture for Linux systems. This enables admins to have more control over who can access their system.

    [SELinux overview](https://www.redhat.com/en/topics/linux/what-is-selinux#overview)

* **AppArmor** is a Linux application security system. It proactively protects the OS and applications against external and internal attacks. Debian already ships with this application. To check its status simply run the command
```aa-status```
on your terminal.

    [AppArmor overview](https://apparmor.net)


* **SSH** (Secure Shell) protocol is a software package that enables secure system administration and file transfers over insecure networks. It ships standard on UNIX, Linux and macOS machines. It works on the client/server-model. The **SSH** client always initiates the  setup of the secure connection and the **SSH** server listens for incoming connection requests (usually on TCP port 22 on the host system) and responds to them. _Regarding the project we want this service to be running on port 4242 only! And, for security reasons it must not be possible to connect using **SSH** as root._

    [SSH overview](https://www.ssh.com)






* **UFW** **(Uncomplicated Firewall)** makes it easier to handle security on Linux which can be done with **Iptables**. Since handling **Iptables** can be quite hard (same for its learning curve), **UFW** makes things way easier to manage, with or without **GUI**. Regarding the project, it must be active as the default firewall when you launch your VM.

    [UFW overview](https://www.linux.com/training-tutorials/introduction-uncomplicated-firewall-ufw/)


    [UFW wiki](https://en.wikipedia.org/wiki/Uncomplicated_Firewall)


    [Iptables wiki](https://pt.wikipedia.org/wiki/Iptables)
