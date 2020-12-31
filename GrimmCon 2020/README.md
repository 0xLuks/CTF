# GrimmCon CTF 2020

## WARMUP

### 1- Read the rules

![](images/read_the_rules.png)

After reading the CTF rules, we have no indication on what to do, the first thing to do is to check in the source code. The first flag is on line 242.

![](images/rules_flag.png)

flag{90bc54705794a62015369fd8e86e557b}

### 2- Zip Zip

![](images/zipzip_state.png)

There is a .zip file to download that has been compressed 50 times. We are given the password "pass" and indeed when we decompress it, we end up with 49.zip then 48.zip etc. To avoid having to do it fifty times, I will use a simple but effective powershell script.

```powershell
$i = 0
Do{
$7ZipPath = '"C:\Program Files\7-Zip\7z.exe"' 
$zipFile = '"D:\Téléchargements\50.zip"' 
$zipFilePassword = "pass" 
$command = "& $7ZipPath e -oD:\chall -y -tzip -p$zipFilePassword $zipFile" 
iex $command

$7ZipPath = '"C:\Program Files\7-Zip\7z.exe"' 
$zipFile = '"D:\chall\*.zip"' 
$zipFilePassword = "pass" 
$command = "& $7ZipPath e -oD:\chall -y -tzip -p$zipFilePassword $zipFile" 
iex $command
}Until($i -eq 50)
```
![](images/after_unzip.png)

flag{cf97382071cb149aac8d6ab8baeaa3ee}

### 3- Triple

The statement tell us about ASCII and encoding, when I open the file it reminds me directly of the Base64 encoding. The autor of the challenge also tells us that he doesn't know how to decode his message anymore, why ? Because it was encoded several times. It will be necessary to go through three times to find the flag.

![](images/encoded.png)

![](images/b64_d.png)

flag{39905d2148f4fdb7b025c23d684003cb}

## OSINT

### 1- wannabeel33t

![](images/wannabeel33t.png)

By searching for wannabeel33t on Google, one quickly find a link to has reddit profile. In particular this string which looks like an [encoded URL](https://fr.wikipedia.org/wiki/Encodage-pourcent).

![](images/reddit_profile.png)

The -d parameter is used to specify that you want to decode the char string

![](images/wannabee_flag.png)

flag{66b15347c58c91d1937f0b40e973d3f6}
