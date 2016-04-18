#Module 1: Virtual Machines

---

##4. Questions
1. Why do we use virtualization and remote connections?
	>Because it can save time for installing system and configuring it.

2. Why should you install virtual machine locally?
	>Because you can develop and test the software locally, especially when your PC is offline.
	
3. How can you remotely connect to a Linux or Windows machine?	
	>You can remotely connect to it by **SSH** or **TELNET** through some tools like SecureCRT or PuTTY.
	For Windows, you can also use the ``mstsc`` command to remotely connect to the Remote Desktop window.

4. There’s a small issue with all virtualizations and remote connections. What is it?
    >The software running inside the virtual machine or remote machine is limited to the resources and abstractions provided by the virtual/remote machine — it cannot break out of its virtual world.
	

##5. Bonus Questions
1. Is a virtual machine any different from a physical machine?
    >The performance is different. The performance of a virtual machine is constrained by its host machine, while that of a physical machine is directly subject to the hardware.
	It is worth noting when you test a software in a virtual machine while run it on a physical machine.

2. Is it possible to access host directories?
	>Yes, one can setting the shared folders for the virtual machine to access host directories after installing the Guest Additions if using VirtualBox or VmWare Tools if using VmWare Player.

3. What type of network interfaces are available in the virtual machine?
    > * NAT 
    > * Brigded Adapter 
    > * Host-only Adapter
