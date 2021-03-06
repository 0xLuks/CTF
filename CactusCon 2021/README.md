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

We have to have the syscall call that prevents us from continuing the analysis.</br>
I give the rights to the "client" file and I use strace to retrieve the syscall.

![](pics/syscall_f.png)

The syscall is ptrace

Flag : <b>ptrace</b>

### Who Me?

![](pics/whome.png)

It is necessary to find the name of the malware, I use the command strings on the file client</br>
and I send it output to the file "whome" then I open it in vim.

![](pics/whome_f.png)

I find the answer on line 655

![](pics/whome_fl.png)

Flag : <b>TheCovidBotNet</b>

### Scouting

![](pics/scouting.png)

I need to find the C2 server, I run the "client" file and wait a few seconds before launching wireshark.</br>
Filter on DNS and find the name of the server.

![](pics/malware.png)

Flag : <b>covidfunds.net</b>

## 3- Cracking

### Easy crack 2

![](pics/easy2.png)

$1$ represents a md5crypt hash as shown [here](https://hashcat.net/wiki/doku.php?id=example_hashes)</br>
I use JohnTheRipper to crack it.

![](pics/easy2_f.png)

Flag : <b>Bonnie48</b>

### Easy crack 3

![](pics/easy3.png)

It's an NTLM hash, I use crackstation.

![](pics/easy3_f.png)

Flag <b>09205973067</b>

### Easy crack 5

![](pics/easy5.png)

As with the first one, I use john

![](pics/easy5_f.png)

Flag : <b>kuako</b>

## 4- Feeling Blue

### Dangers of Lateral Movement 1

![](pics/dangers1.png)

We download a file from the Windows event viewer to analyze it, set the error</br>
filter, we quickly find a strange service.

![](pics/danger1_f.png)

Flag : <b>53b07c3</b>

### Dangers of Lateral Movement 2

![](pics/dangers2.png)

By closely analysing the logs we find the installation of a service on 29/01/2021</br>
at 20:10/21 from the adress 192.168.27.134.

![](pics/danger2_f.png)

Flag : <b>192.168.27.134</b>

### Hello Goodbye 2

![](pics/hello2.png)

In the logs we found a kerberot ticket request on 02/02/2021 at 05:38:55 on the user Arash.

![](pics/hello2_f.png)

Flag : <b>Arash</b>

### Hello Goodbye 4

![](pics/hello4.png)

We can see a special user: sAadmin on 02/02/2021 at 05:56:18

![](pics/hello4_f.png)

Flag : <b>sAadmin</b>

### What SMB Activity? 1

![](pics/smb1.png)

We open the .pcap file in wireshark and filter on smb2, we find the name

![](pics/smb1_f.png)

Flag : <b>PipeMeMario</b>

### What SMB Activity? 2

![](pics/smb2.png)

We filter on smb2.data.offset and we see the "read response" stream with data (75 bytes).</br>

![](pics/smb2_f1.png)

I send the stream to "Follow TCP Stream"

![](pics/smb2_f2.png)

At the very bottom I find something that looks like base64.

![](pics/smb2_f3.png)

Flag : <b>flag{AnalyzeTheTrafficAndDecodeTheBase64}</b>

## 5- Misc

### Discord

![](pics/discord.png)

After going around the discord (channels, members, description...), I used the seach function on "flag".

![](pics/disc.png)

Flag : <b>flag{fitness_this_flag_on_discord}</b>
