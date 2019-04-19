<#
    .Synopsis
    Google Language Translator API

    .DESCRIPTION
    This cmdlet allows you to pass in string content and translate
    it into another supported languages.

    See this link for supported language codes: 
    https://cloud.google.com/translate/docs/languages

    .EXAMPLE
    This demonstrates default english to spanish if no source 
    or target lang are defined: 

    Get-GoogleTranslation.ps1 -Content "The bubble gum cigars"

    .EXAMPLE
    This demonstrates using english as source lang and swahili
    as target lang: 

    Get-GoogleTranslation.ps1 -SourceLang en `
        -TargetLang sw `
        -Content "The bubble gum cigars"
#>

Param(
    [parameter(Mandatory)]
    [string]$SourceLang = 'en',

    [parameter(Mandatory)]
    [string]$TargetLang = 'es',

    [parameter(Mandatory)]
    [string]$Content
)

$contentStr = $Content.TrimStart('"').TrimEnd('"')
$uri = "https://translate.googleapis.com/translate_a/single?client=gtx&sl=$SourceLang&tl=$TargetLang&dt=t&q=$contentStr"
$Translator = Invoke-WebRequest -Uri $uri `
    -SessionVariable Session `
    -UserAgent ([Microsoft.PowerShell.Commands.PSUserAgent]::Chrome) `
    -Method Get `
    -ContentType 'application/json'

($Translator.Content.TrimStart('[').TrimEnd(']') -split ',' | select -First 1).TrimStart('"').TrimEnd('"')