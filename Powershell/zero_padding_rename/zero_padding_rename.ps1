# Zero Padding Rename
# zero_padding_rename.ps1
# $args[0] Target Directory
# $args[1] Target filename extension(ex: '*.jpg' , '*.png')
# MattMizusawa 2024/03/23 Ver.0.01

# Update-FileNameWithNumberPadding
# From: PowerShellでファイル名に含まれる数字を0埋めしてリネームする
# https://maeda577.github.io/2021/07/29/powershell-padding.html
function Update-FileNameWithNumberPadding {
    [CmdletBinding(SupportsShouldProcess = $true)]
    Param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [ValidateScript( { Test-Path $_.FullName })]
        [System.IO.FileInfo]
        # Target file for update.
        $FileInfo,
        [int]
        # Padding width. Default is 3.
        $TotalWidth = 3,
        [char]
        # Padding character. Default is '0'.
        $PaddingChar = '0'
    )
    Process{
        $selectStr = Select-String -InputObject $FileInfo.Name -Pattern "\d+" -AllMatches
        if ($null -eq $selectStr) { return }
        $lastMatch = $selectStr.Matches | Select-Object -Last 1
        $newName = $FileInfo.Name.Substring(0, $lastMatch.Index) + $lastMatch.Value.PadLeft($TotalWidth, $PaddingChar) + $FileInfo.Name.Substring($lastMatch.Index + $lastMatch.Length)
        Move-Item -Path $FileInfo.FullName -Destination (Join-Path -Path $FileInfo.DirectoryName -ChildPath $newName) -WhatIf:$WhatIfPreference
    }
}

Get-ChildItem -Path $args[0] -File -Recurse -Include $args[1] | Update-FileNameWithNumberPadding
