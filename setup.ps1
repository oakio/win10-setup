function Remove-FoldersFromThisPC {
    Write-Host "Remove folders from ThisPC"
    
    $folders_keys = @(
        "{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}", # Remove 3D Objects Folder,
        "{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}", # Remove Documents From This PC
        "{d3162b92-9365-467a-956b-92703aca08af}", # Remove Documents From This PC
        "{1CF1260C-4DD0-4ebb-811F-33C572699FDE}", # Remove Music From This PC
        "{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}", # Remove Music From This PC
        "{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}", # Remove Pictures From This PC
        "{24ad3ad4-a569-4530-98e1-ab02f9417aa8}", # Remove Pictures From This PC
        "{A0953C92-50DC-43bf-BE83-3742FED03C9C}", # Remove Videos From This PC
        "{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}"  # Remove Videos From This PC
        )

    foreach ($folder_key in $folders_keys) {
        $path = Join-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\" $folder_key
        if(Test-Path -Path $path) {
            Remove-Item -Path $path
        }

        $path = Join-Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\" $folder_key
        if(Test-Path -Path $path) {
            Remove-Item -Path $path
        }
    }
}

Remove-FoldersFromThisPC
