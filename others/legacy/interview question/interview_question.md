Non-tech Question
=========


### Q: What is you're favorite Programming Language / OS / Computer ?
- tech reason, but not to be the person hard to work with
- acknowledge that some task for the language is poor choice. and I know plenty language.
```
My favraite programming language is python because it is a simple, portable
and most of all, it has a lot of extensive libraries.
I always can have a fast Proof of Concept by Python.

Althogh it has some performance issue,
most of th time it is not the best but the second choice on many problem.
```
- cons
```
not multi-thread friendly
weak in web
===TODO===
```
- vs ruby
```
I have some experience on Ruby on Rails, I am not that familar with ruby.
It is a good language.
In my opinions, Python has a larger community and more people are developing fast feature on it.
For example, Cython, scipy, numpy. Sometime second best choice.
```
- vs js
```
JS is a high growing language nowaday.
As web technolegde and JS engine grows, it becomes a very popular language.
I can also write JS and recently I'm following the news of ReactJS.
```



### Q: What is your working style ?
- fit the company
- Speed and accuracy
- Working with collaboration

```
I'll consider my working style as speed and accuracy.
I usually find out the walking skeleton first and implement it.
Then iterative and incremental development.
// ex: root volume: insert OS -> switch boot -> access to internet -> decrypt -> add key

When collaborate with colleague, we use pair programming to sync our program style and idea.
It make us more productive and efficency. sync up.
```



### Q: Tell me about your experience ?
- MUST HAVE
- highlight spec achieve
- be enthusiastic when talk about project
- what have learn
- what goes right and what goes wrong
```
I have joined Trend Micro for 3 years.

My first project is SecureCloud, it is a data encryption product.
My main contribution is building boot volume encryption on cloud solution,
for example, AWS EC2, Microsoft Azure and HP-Cloud.
We also have apply a patent about boot volume encryption on para-virtualiztion platform last year.

My second project is Deep Security, it is a server protection product.
My main contribution is integrate virus scan and active content scan feature with SAP.
Currently we are preparing for a PoC demo in August.
```



### Q: biggest achievement and failure
```
Successful boot a encrypt boot on EC2, it is amazing.
and apply for my first patent.


SEG Case that KVM boot crash.
Cp back, work well. Not on every OS(centOS only).
Slow, debug not efficient.

Finally, stack overflow on decrypt function.
-> minize decrypt function(time-space trade off, remove encrypt)
-> check stack, or use other not standard space.
```


### Q: Describe your strength and weakness
```
I consider greatest strength is learning agility.
For example, in SecureCloud I do the PoC, pick up knowledge, ToI from colleague.
In Deep Security, I do the PoC.
And I participate the Scrum Master training try to improve myself.


As far as weakness, I do not do the paperwork very well
and I am constantly working on it to improve them.
For example, using the good template from other colleague,
using some tool to make a clear flow chart,
ask colleague to do pair review to improve it.
```

### Q: How your colleague describe you ?
```
high performance.
easy to cooperate with.
always working with passions.

Beside the job, we also make up a team to join Trend Device App Contest.
```


### Q: Why should We hire you ?
- show your qualified
- postive
```
learn thing fast: new things, creative things is interesting for me,
according to my experience I not only like it and also good at it. , EX: aws boot volume

working in speed and accuracy, : PoC, aws boot, sap integration

Basic knowledge to security and learn fast.
```



### Q: Do you have any Question?
- important, don't ask stupid question.
- Demonstrate your interest in the employer.
```
1. I would like to know what project we focus on in US team.
    - What is the most interesting project have achieved ?
2. What are the prospects for growth and advancement?
    - Our strategy to growth of mobile device and Internet of things ?
3. What are biggest challenges of this position ?
4. What is the most interesting of your position ?
```




Business Problem
=============

### Q: How many gas station / starbucks in XXX ?
- market size problem
- support and demand
- cost based



Tech Question
============

General
-------
### Q: describe the patent
```
Problem: To boot up a encrypted boot disk on pv-grub platform.
Solution: hook miniOS and sc-pv-grub for ask key and decryption.

Flow:
pv-grub -> sc-pv-grub
Ask key -> set key -> use sc-pv-grub -> can boot encrypted boot.

```


### Q: Boot sequence
```
MBR:
- BIOS
- Boot sector (MBR), stage 1
- Boot Loader (GRUB), stage 1.5
- kernel initrd/initramfs
- init, pid 1
- change root, inittab


GPT:
- UEFI
- GPT format
- UEFI boot manager
```


### Q: What is GRUB
```
Boot loader
Support multi format, ext2/3/4, xfs, FAT, NTFS.
Support network download boot images.

stage 1: #0(MBR), boot.img
stage 1.5: #1, core.img, , contain filesystem driver.
Stage 2: /boot/grub

GRUB 1: stage 1 -> stage 2
GRUB 2: stage 1 -> stage 1.5 -> stage 2
```



### Q: MIFARE Classic weakness
```
http://www.doc.ic.ac.uk/~mgv98/MIFARE_files/report.pdf
Weakness 1: Low Entropy of Random Generator (2^16)
Weakness 2: Only Odd State Bits Used to Generate Keystream
Weakness 3: Leftmost LFSR Bit Not Used By Filter Generator
Weakness 5: Parity Weakness and Reuse of One-time Pad, use last bit to encrypt Parity bit.
Weakness 6: Information Leak from Parity

LFSR: Linear feedback shift register
```



### Q: process vs thread
```
Program: not yet in memory
Process: each process dont share memory, a process can have multi-thread.
Thread: under same process share global memory. May have deadlock.
```

### mutex vs semaphore

### how to wait socket file descriptor to be ready

### const, volatile keyword in C

### class vs struct

### difference between abstract class and interface in Java

### fork ? pid ? resource file open ?

### SQL vs noSQL

### database Normalization ?

### singleton implement ?
- getinstance
- class init

### virtual function ? virtual destructor ?

### mutex , critial session, pthread

### distribute system design?

### how to implement critical section in Python

### Docker

### how to test API
- how many clients can it accept at the same time

### scalibility on web services? how to implement

### Q: data struct ?
```
class ListNode:
    def __init__(self, value):
        self.value = value
        self.next = None

class TreeNode:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None

class TrieNode:
    def __init__(self):
        self.children = collections.defaultdict(TrieNode)
        self.flag = False

class Stack: # FILO
    def __init__(self):
    def push(self, x):
    def pop(self):
    def peek(self):

class Queue: # FIFO
    def __init__(self):
    def push(self, x):
    def pop(self):
    def peek(self):

HashTable(dict)
```


### Q: L1 cache and L2 cache
```
Processor registers: the fastest possible access (usually 1 CPU cycle).

Cache:
Level 0 (L0) Micro operations cache – 6 KiB [7] in size
Level 1 (L1) Instruction cache – 128 KiB in size
Level 1 (L1) Data cache – 128 KiB in size. Best access speed is around 700 GiB/second
Level 2 (L2) Instruction and data (shared) – 1 MiB in size. Best access speed is around 200 GiB/second
Level 3 (L3) Shared cache – 6 MiB in size. Best access speed is around 100 GB/second
Level 4 (L4) Shared cache – 128 MiB in size. Best access speed is around 40 GB/second


use __builtin_prefetch to prefetch the data.
```


### Q: Memory: stack vs heap
```
Stack: memory that stores temporary variables created by each function, FILO
- very fast access
- don't have to explicitly de-allocate variables
- space is managed efficiently by CPU, memory will not become fragmented
- local variables only
- limit on stack size (OS-dependent)
- variables cannot be resized

Heap: memory that is manged by you, may leak. malloc(), calloc(), free().
- variables can be accessed globally
- no limit on memory size
- (relatively) slower access
- no guaranteed efficient use of space, memory may become fragmented over time as blocks of memory are allocated, then freed
- you must manage memory (you're in charge of allocating and freeing variables)
- variables can be resized using realloc()
```


### Q: Design Pattern ?
```
Singleton Design Pattern
Factory Design Pattern(simple factory)
- Product interface
- Product
- Factory interface
- Factory
Abstract Factory Design Pattern
- Multi Product interface


factory vs abs factory
```



Network
--------
<!-- ### Q: Network layer
```
7.  Application Layer (DNS/FTP/DHCP/SMTP)
6.  Presentation Layer(MIME)
5.  Session Layer
4.  Transport Layer(TCP/UDP)
3.  Network Layer(IPv4/IPsec)
2.  Data link Layer(ARP/MAC)
1.  Physical Layer(Bluetooth)
``` -->

### What’s SSL ?
```
SSL: Secure Sockets Layer
TSL: Transport Layer Security

Alg:
- Handshake
- Key exchange, Diffie-Hellman
    - agree a prime p and base g
    - g^a and g^b mod p
    - share result
    - share secret = g^a^b mod p
```


### TCP vs UDP, socket ?


<!-- ### private IP
```
Three ranges of IP addresses have been reserved for private address.
Class A 10.0.0.0 10.255.255.255
Class B 172.16.0.0 172.31.255.255
Class C 192.168.0.0 192.168.255.255
``` -->


Virtualization
-------------
### Q What is Virtualization ?
```
a technique for creating virtual resources

EX:
- Server Virtualization
- Network Virtualization
- Hardware virtualization
- Application virtualization
- Desktop virtualization
```

### Q: difference between full virtualization &  para virtualization
```
Full Virtualization: guest machine(virtual machines) is unware that it is in virtualized environment. For OS, it think it communicate with hardware.

Para Virtualization : It is a virtualization in which guest machine is aware that it is in virtualized environment. May have some speed up.
```

### Q: different hypervisors
```
xen-pv :  install Xen kernel, boot the machine with Xen kernel.
    Domain0 is the initial domain started by xen hypervisor. has special right. run all driver.
xen (xen-hvm): full vir
KVM: kernel based Virtualization, dont need extra kernel for KVM.

Type 1: Hardware -> Hypervisor -> OSs (HyperV/VMWare ESXI/ XenServer)
Type 2: Hardware -> OSs -> Hypervisor s -> OS (VMWare workstation/Virtual Box)


```

Coding
------
### maze
### string reverse
### strcpy
- while (*target++ = *source++);
