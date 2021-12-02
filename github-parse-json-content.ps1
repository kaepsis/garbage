$user = Read-Host "Utente"

$url = "https://api.github.com/users/" + $user

$request = Invoke-WebRequest -Uri $url
$jsonResult = ConvertFrom-Json $([String]::new($request.Content))

Write-Host "URL TO PROFILE: $($jsonResult.html_url)"
Write-Host "NAME: $($jsonResult.name)"
Write-Host "ID: $($jsonResult.id)"
Write-Host "NODE ID: $($jsonResult.node_id)"
Write-Host "EMAIL: $(If (!($null -eq $jsonResult.email)) {$jsonResult.email} Else {'//'})"
Write-Host "WEBSITE: $(If (!($null -eq $jsonResult.blog)) {$jsonResult.blog} Else {'//'})"
Write-Host "HIREABLE: $(If (!($null -eq $jsonResult.hireable)) {'Yes'} Else {'No'})"
Write-Host "BIO: $(If (!($null -eq $jsonResult.bio)) {$jsonResult.bio} Else {'//'})"
Write-Host "TWITTER: $(If (!($null -eq $jsonResult.twitter_account)) {$jsonResult.twitter_account} Else {'//'})"
Write-Host "LOCATION: $(If (!($null -eq $jsonResult.location)) {$jsonResult.location} Else {'//'})"
Write-Host "COMPANY: $(If (!($null -eq $jsonResult.company)) {$jsonResult.company} Else {'//'})"
Write-Host "PUBLIC REPOS: $($jsonResult.public_repos)"
Write-Host "FOLLOWERS: $($jsonResult.followers)"
Write-Host "FOLLOWING: $($jsonResult.following)"
Write-Host "CREATION DATE: $($jsonResult.created_at)"
Write-Host "IS SITE ADMIN? $(If ($jsonResult.site_admin) {'Yes'} Else {'No'})"