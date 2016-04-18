#Module 2: Linux
##4.Questions
###4.1. Linux Shell and file permissions

1. Name commands used for copying, moving and deleting files, changing and making newdirectories.
> ``cp``, ``mv``, ``rm``, ``cd``, ``mkdir``

2. If your current directory is ``/home/user/livingroom/``, what is the absolute path of ``../../bakery/``?
> ``/home/bakery/``

3. Which directory does ``~`` refer to?
> The current user's home directory.

4. Which directory contains system settings?
> ``/etc/``

5. What is autocomplete?
> It predicts a word or phrase that the user wants to type in without the user actually typing it in completely. In a **linux** terminal, one can use ``TAB`` to autocomplete a command or a directory.

6. How do you run an executable file in the current directory?
> ``./executablefile``

7. Why and how would you use output redirection?
> When one wants to dump the output information into a file, especially when the result has too many lines too show in a screen.
> ``>`` or ``>>`` for stardard output and ``2>`` or ``2>>`` for error output.

8. How would you execute a command within a command?
> Commands can be nested using the `` ` `` special character. To list all file under a directory named **test** under current directory, the nested command: `` $ ls `find -type d -name test` `` can be used.

9. What is the purpose of the super user (root)?
> **root** is the *god* in the linux system who creates and rescues all other users.

10. What is a shebang and what do we use it for?
> A shebang stands for ``#!``. It is put at the beginning of a script and calls the specified interpreter to parse this script.

11. You are user mkobal, member of the group godlike. What permissions do you have on the fileslisted below? Why?
   ```
-rwxr--r-- root    root       290 Jan 26 14:08 compressed.gz r
-rwxr-xr-- unixguy godlike 331836 Jan 26 14:06 frozenBubble  r&x
drwxrwxr-x unixguy staff       48 Jan 26 11:28 parties       r
-rwxrwx--x mkobal  godlike     29 Jan 26 14:03 executable    r,w&x
   ```

12. What is a software package? Name a few package managers.
>A software package is a software that has been built from source with one of the available package management systems.
``yum/rmp`` and ``apt/dpkg`` are common used package managers.

##4.2. Networking 
1. Is the computer with the IP ``10.5.2.1``, netmask ``255.255.255.0`` connectable to the IP ``10.5.3.8``? Why? What would happen if the netmask on both computers was ``255.255.252.0``?
> Unconnectable. Because this computer is in a network segment which IP varies in ``10.5.2.X``, so it can't reach the IP ``10.5.3.8``.
When the netmask on both computers was ``255.255.252.0``, then the IP ``10.5.2.X`` and ``10.5.3.X`` are belong to the same network segment, so it is connectable.

2. What is a TCP/IP port? How many ports are there?
> * The port does the job of transporting and managing the data across the network is called TCP/IP port which stands for Transmission Control Protocol (TCP) and Internet Protocol (IP).
> * Port numbers are straight unsigned integer values which range up to a value of 65535.

3. What is NAT? What is a firewall? How do they relate?
> NAT standing for Network Address Translation is the process where a network device, usually a firewall, assigns a public address to a computer (or group of computers) inside a private network.
A firewall is a technological barrier designed to prevent unauthorized or unwanted communications between computer networks or hosts.
They work together to make a cluster of computers inside a private network work and work safer.


4. Why and how would you use SSH port tunneling?
> Because SSH tunneling allows us to access an otherwise inaccessible computer on the internal network from another computer on that network that is running SSH server and can be accessed from the outside network. Besides, SSH provides secure encrypted communications between two untrusted hosts over an insecure network, so it is more secure to use SSH port tunneling.
To establish the SSH tunnel from remote host port 80 to your local port 7000, execute the following: 
`` $ ssh -L 7000:<inaccessibleHost>:80 user@<accessibleHost> ``

5. Is ``www.example.com`` always the same as ``example.com``? What's the difference to ``http://www.example.com``?
>  No, it depends on the Domain DNS.
It will use ``http`` protocol to transport the data in this website.

##4.3. Software installation
1. Name a few package managers.
> ``yum/rmp ``， ``apt/dpkg``

2. Which commands do you need to run to compile and install a downloaded source archive file(.tar.gz)?
    ```
    $ tar xzvf software.tar.gz 
    $ cd software 
    $ ./configure 
    $ make 
    # make install
    ```

3. Which file do you usually need to modify before compiling EPICS software?
> ``./configure``

4. What do you do when something goes wrong and compilation fails?
> Check out where the first error occurs, find the solution to it， find other independent fails in sequence and then compile it again. If it still goes wrong, check and fix it again. If something apperantly makes no sense, then look into the makefile and even the source code of the software. 

5. What went wrong during the compilation below?
> ``re2c`` command is not found:        
    ```
    re2c -o lexer.c ../snl.re 
    make[3]: re2c: Command not found 
    ```