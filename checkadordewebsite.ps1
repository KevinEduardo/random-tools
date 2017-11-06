function bannerq {
	Write-Host "  -=Rodando Malandramente=-" -fore green
	Write-Host "  Version 1.1" -fore green
    
}
function checkSite($hostname)
{
cls;
bannerq
[string] $url = "http://$hostname"
[net.httpWebRequest] $req = [net.webRequest]::create($url)
$req.Method = "GET"
Write-Host "INFO: Fazendo request para $url" -fore white
$ss = "false"
try {
    [net.httpWebResponse] $res = $req.getResponse()
    $ss = "true"
} catch {
    notrunning
}
if ($ss -eq "true") {
    running
}
else {
    notrunning
}
}

function running
{
cls;
bannerq
$tempo = (Get-Date -DisplayHint Time).ToString()
Write-Host "=====Resultado=====" -fore yellow
Write-Host "" -fore green
Write-Host "----------------------" -fore green
Write-Host " Access to web = OK " -fore green
Write-Host " $tempo " -fore green
Write-Host "----------------------" -fore green
}
function notrunning
{
cls;
bannerq
$tempo = (Get-Date -DisplayHint Time).ToString()
Write-Host "=====Resultado=====" -fore yellow
Write-Host "" -fore red
Write-Host "-------------------------" -fore red
Write-Host "  Site down - Site Down  " -fore red
Write-Host "  $tempo  " -fore red
Write-Host "-------------------------" -fore red
}

function core
{
    bannerq
    [string] $hostname = Read-Host -Prompt 'Coloque o site a ser verificado (somente http)'
	while(1) {
		checkSite -hostname $hostname
		start-sleep -seconds 30
	}
}
core