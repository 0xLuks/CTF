# CactusCon CTF 2021

![](pics/cactuscon.png)

## Context

This is my first participation at the CactusCon CTF.<br/>
He has started at 5:00pm on Friday and finished at 01:00am on Saturday.

I finish 68th out of 420 participants.

## 1- 0xevilc0de.com

### Collecting pokemons

![](pics/collecting_pokemons.png)

The aim is to find the user-agent used for http post requests.<br/>
We download the .pcap file and open it with wireshark.

Use the filter http.request.method == "POST"

![](pics/pokemon_follow_stream.png)

Then Follow TCP stream to find the user-agent.

![](pics/pokemon_flag.png)

Flag : <b>Mozilla/4.08 (Charon; Inferno)</b>

### DIV Isn't Only for HTML

![](pics/divisn't.png)

The hash of the executable file must be found. I open the .pcap file</br>
in the Network Miner tool.

![](pics/miner_tool.png)

I open the file tab and find the div.exe file. Right click then Calculate MD5 / SHA1 ... hash

![](pics/div.png)

![](pics/div_hash.png)

![](pics/div.exe.png)

Hash md5 found!

Flag : <b>79afa994e75a30118512e2a079c859b1</b>

### Agent Smith

![](pics/agent.png)

It is necessary to find the protocol used during the data exfiltration.</br>

I open .pcap file in wireshark and after a little research I find an auth</br>
then a data exfiltration with the SMTP protocol.

![](pics/smtp.png)

Flag : <b>smtp</b>

## 2- CovidScammers

### Free Flag (and binary)

![](pics/freeflag.png)

The binary is an executable 32bit LSB ELF. Given the instruction</br>
i vill simply use the string command and grep to "flag" with the -i</b>
parameter for case sensitive.

![](pics/freeflag_f.png)

Flag : <b>TS{freeFlagLookatMe}</b>

### Syscalls

![](pics/syscalls.png)

### Who Me?

![](pics/whome.png)

### Scouting

![](pics/scouting.png)

## 3- Cracking

### Easy crack 2

![](pics/easy2.png)

### Easy crack 3

![](pics/easy3.png)

### Easy crack 5

![](pics/easy5.png)

## 4- Feeling Blue

### Dangers of Lateral Movement 1

![](pics/dangers1.png)

### Dangers of Lateral Movement 2

![](pics/dangers2.png)

### Hello Goodbye 2

![](pics/hello2.png)

### Hello Goodbye 4

![](pics/hello4.png)

### What SMB Activity? 1

![](pics/smb1.png)

### What SMB Activity? 2

![](pics/smb2.png)

## 5- Misc

### Discord

![](pics/discord.png)


