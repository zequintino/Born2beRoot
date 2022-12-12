<!-----

Yay, no errors, warnings, or alerts!

Conversion time: 0.784 seconds.


Using this Markdown file:

1. Paste this output into your source file.
2. See the notes and action items below regarding this conversion run.
3. Check the rendered output (headings, lists, code blocks, tables) for proper
   formatting and use a linkchecker before you publish this page.

Conversion notes:

* Docs to Markdown version 1.0β33
* Fri Dec 09 2022 08:51:35 GMT-0800 (PST)
* Source doc: Born2beRoot Design Doc
----->



# Born2beRoot
### Useful Info

## Virtual Machine

Think of a virtual machine as a computer within a computer. VM’s create ‘fake’/virtual  hardware components tricking the virtual machine thinking they’re legit. Those components are based on the hardware used by the computer used to create the so-called virtual machine.

Concerning the **Hypervisor**, we’ll be using **VirtualBox** (type 2 hypervisor) since it’s free and has a lot of good options regarding VM’s. Type 2 means that the host OS’s (your computer) allows the guest OS’s (virtual machines) to use its resources. A (type 1 hypervisor) is directly installed in the machine (usually a server or so). They both do pretty much the same thing whereas the latter has full control over the machine.

[Straight forward explanation on VM's.](https://www.youtube.com/watch?v=wX75Z-4MEoM)


## Operating System & Kernel

Briefly an operating system comes as a bridge between the user and the software. On the other hand a kernel is what makes the connection between the operating system and the designated hardware. The main purpose of a kernel is to manage memory, disks, tasks and processes. A system always has an operating system and an operative system always has a kernel.

Since we only have two options available, I decided to stick with Debian because it is recommended if system administration is new to the student.

Both options are good and do the job. Anyway there are differences between them that we always should consider. Debian is easier to upgrade, has more up to date packages… On the other hand, if your web server is going to be used as a reseller tool, you may want to install cPanel and in this case, CentOS is recommended since it’s officially supported.

At the end of the day, just go with the one you feel most comfortable with.

Regarding GUI it does not matter because we are installing the minimum of services. No graphical interface or graphics server will be installed.

Some info on OS and kernel:

[Operating System](https://en.wikipedia.org/wiki/Operating_system)

[Kernel (operating system)](https://en.wikipedia.org/wiki/Kernel_(operating_system))

[Difference between operating system and kernel](https://www.geeksforgeeks.org/difference-between-operating-system-and-kernel/)

Some differences between CentOS and Debian:

[CentOS vs Debian - Infographics](https://cdn.educba.com/academy/wp-content/uploads/2018/09/CentOS-vs-Debian-1.jpg)


## Additional Info

* **APT** (advancing package tool) and **Aptitude** are both packaging management tools. Search, removal, installation or upgrading are some of the capabilities of packaging management tools. **APT** is a low level management tool whereas **Aptitude** is a high level one. **APT** can be used in other higher-level package managers. Overall **Aptitude** is more flexible and lets you have more control regarding package management.

	[apt-get / aptitude guide](https://www.fosslinux.com/43884/apt-vs-aptitude.htm)

* **SELinux** is a security architecture for Linux systems. This enables admins to have more control over who can access their system.

    [SELinux overview](https://www.redhat.com/en/topics/linux/what-is-selinux#overview)

* **AppArmor** is a Linux application security system. It proactively protects the OS and applications against external and internal attacks. Debian already ships with this application. To check its status simply run the command `aa-status` on your terminal.

    [AppArmor overview](https://apparmor.net)

* **SSH** (Secure Shell) protocol is a software package that enables secure system administration and file transfers over insecure networks. It ships standard on UNIX, Linux and macOS machines. It works on the client/server-model. The **SSH** client always initiates the  setup of the secure connection and the **SSH** server listens for incoming connection requests (usually on TCP port 22 on the host system) and responds to them. _Regarding the project we want this service to be running on port 4242 only! And, for security reasons it must not be possible to connect using **SSH** as root._

    [SSH overview](https://www.ssh.com)

* **UFW** **(Uncomplicated Firewall)** makes it easier to handle security on Linux which can be done with **Iptables**. Since handling **Iptables** can be quite hard (same for its learning curve), **UFW** makes things way easier to manage, with or without **GUI**. Regarding the project, it must be active as the default firewall when you launch your VM.

    [UFW overview](https://www.linux.com/training-tutorials/introduction-uncomplicated-firewall-ufw/)


    [UFW wiki](https://en.wikipedia.org/wiki/Uncomplicated_Firewall)


    [Iptables wiki](https://pt.wikipedia.org/wiki/Iptables)



## Objectives

1. Install the OS image using VirtualBox and set up the partitions as suggested by the subject.
2. The **hostname** of your virtual machine must be your login ending with 42 (_jquintin42_ for me). You have to be able to modify your **hostname** later.
3. Strong password policy regarding **root** and **user** passwords (don’t forget to write down your passwords somewhere). You have to be able to change all the passwords accounts present on the virtual machine, including the root account.
	* Password has to expire every 30 days.
	* Minimum number of days allowed before the modification of a password will be set to 2.
	* User has to receive a warning message 7 days before their password expires.
	* Password must be at least 10 characters long. An <span style="text-decoration:underline;">uppercase letter</span>, <span style="text-decoration:underline;">lowercase letter</span> and a <span style="text-decoration:underline;">number</span> must be included. Password must not contain more than 3 consecutive identical characters.
	* It must not include the name of the user.
	* **THIS ONE DOES NOT APPLY TO THE ROOT PASSWORD**: Password must have at least 7 characters that are not part of the former (**root**) password.
4. Besides the root user, create a user with your login as username.
5. Install and configure **sudo** following strict rules.
6. Create two new groups: **user42** and **sudo**. The user you created at step 5 must be included in these two new groups. Later, you have to be able to create a user and add it to a group. **sudo **group has to comply with the following requirements:
	* Auth using **sudo** has to be limited to 3 attempts in case of incorrect password.
	* A custom message has to be displayed if there’s an error due to the wrong password when using **sudo**.
	* Each action using **sudo** has to be archived, both inputs and outputs. The **log file** has to be saved in the `/var/log/sudo` folder.
	* The **TTY** mode has to be enabled (security reasons).
	* For security reasons as well, paths that can be used by **sudo** must be restricted: `/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin`
7. Install the **SSH** service on your OS. SSH will only run on port **4242**. It must not be possible to connect using **SSH** as root (this is due to security reasons). SSH will be tested by setting up a new account.
8. Setup UFW firewall and only leave port 4242 open. Firewall must be active when launching your virtual machine.
9. Create a **bash** script to monitor your virtual machine. It must be named **monitoring.sh**. At server startup the script will display some info on all terminals every 10 minutes. Check `wall` command, **banner** is optional and no errors must be visible. You need to explain how the script works and be able to interrupt it without modifying it (check **cron**). Script must always display the following info:
	* **Architecture** of your OS and its **kernel** version.
	* Number of **physical processors**.
	* Number of **virtual processors**.
	* Available **RAM** on your VM and its utilization rate as percentage.
	* Available **memory** on your VM and its utilization rate as percentage.
	* Utilization of your **processors** as percentage.
	* **Date and time** of the **last reboot**.
	* Whether **LVM** is active or not.
	* Number of **active connections**.
	* Number of **users using the VM**.
	* **IPV4 address** of your VM and its **MAC address**.
	* Number of commands executed with the **sudo** program.
