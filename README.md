# PSGoogleTranslator
PowerShell Google translator API cmdlet

This cmdlet interfaces with the Google Translation API when given an source and target language.  By default is is configured to accept string content without using the -SourceLang or -TargetLang and will translate English to Spanish.  Alternatively you can opt to use -TargetLang and it assumes the sources is English. 

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
