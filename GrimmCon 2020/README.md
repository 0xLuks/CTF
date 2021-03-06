# GrimmCon CTF 2020

![](images/grimm.png)

## Context

This is my first participation at the GrimmCon CTF. I have just finished my day (python training) that the CTF is starting. 🤯 I lost a lot of time on the web and forensic challenges, but not that much time, because reading the other write-ups, I wasn't that far away. The CTF has started at 5:45pm and ended at 12:30am.

I finish 179th out of 472 participants.

### 1- Read the rules

![](images/read_the_rules.png)

After reading the CTF rules, we have no indication on what to do, the first thing to do is to check in the source code. The first flag is on line 242.

![](images/rules_flag.png)

flag{90bc54705794a62015369fd8e86e557b}

### 2- Zip Zip

![](images/zipzip_state.png)

There is a .zip file to download that has been compressed 50 times. We are given the password "pass" and indeed when we decompress it, we end up with 49.zip then 48.zip etc. To avoid having to do it fifty times, I will use a simple but effective [powershell](https://github.com/0xLuks/CTF/blob/main/GrimmCon%202020/scripts/multiple_unzip.ps1) script.

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

![](images/triple_state.png)

The statement tell us about ASCII and encoding, when I open the file it reminds me directly of the Base64 encoding. The autor of the challenge also tells us that he doesn't know how to decode his message anymore, why ? Because it was encoded several times. It will be necessary to go through three times to find the flag.

![](images/encoded.png)

![](images/b64_dc.png)

flag{39905d2148f4fdb7b025c23d684003cb}

### 4- Hyperopia

![](images/hyperopia_state.png)

We are told that the image is blurry and indeed it is blurry to the point of hurting the eyes. Impossible to scan with my smartphone.

![](images/qr_code.png)

I know there is a feature in the gimp software that allows you to work on this, let's try it with this configuration. Filters -> Enhance -> Sharpen

![](images/qr_code_sharp.png)

Now it works and I get the flag!

![](images/qr_code_flag.png)

flag{3efd4bd34663e618c70e051505c83f9f}

### 5- wannabeel33t

![](images/wannabeel33t.png)

By searching for wannabeel33t on Google, one quickly find a link to has reddit profile. In particular this string which looks like an [encoded URL](https://fr.wikipedia.org/wiki/Encodage-pourcent).

![](images/reddit_profile.png)

The -d parameter is used to specify that you want to decode the char string

![](images/wannabee_flag.png)

flag{66b15347c58c91d1937f0b40e973d3f6}
