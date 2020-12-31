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
