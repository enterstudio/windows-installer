; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Boot2Docker"
#define MyAppVersion "0.1"
#define MyAppPublisher "Boot2Docker"
#define MyAppURL "http://boot2docker.io"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{05BD04E9-4AB5-46AC-891E-60EA8FD57D56}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName=Boot 2 Docker
InfoBeforeFile=C:\Users\svend_000\windows-installer\LICENSE
OutputBaseFilename=boot2docker-install
Compression=lzma
SolidCompression=yes
WizardImageFile=logo-docker_transparent.bmp
WizardSmallImageFile=logo-docker-small.bmp

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "C:\Users\svend_000\windows-installer\Boot2Docker\boot2docker.iso"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\svend_000\windows-installer\Boot2Docker\boot2docker-cli.exe"; DestDir: "{app}"; Flags: ignoreversion
;Source: "C:\Users\svend_000\windows-installer\Boot2Docker\profile"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\svend_000\windows-installer\start.sh"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\svend_000\windows-installer\delete.sh"; DestDir: "{app}"; Flags: ignoreversion

; msys-Git
Source: "C:\Users\svend_000\windows-installer\msys-Git\Git-1.9.0-preview20140217.exe"; DestDir: "{app}"; Flags: ignoreversion

;VirtualBox - 64 bit only
;https://forums.virtualbox.org/viewtopic.php?f=3&t=21127
Source: "C:\Users\svend_000\windows-installer\VirtualBox\VirtualBox-4.3.8-r92456-MultiArch_amd64.msi"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\svend_000\windows-installer\VirtualBox\common.cab"; DestDir: "{app}"; Flags: ignoreversion

; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{group}\Boot2Docker Shell"; WorkingDir: "{app}"; Filename: "{app}\start.sh"
Name: "{group}\Boot2Docker Delete"; WorkingDir: "{app}"; Filename: "{app}\stop.sh"
Name: "{group}\MSYS Bash"; Filename: "C:\Program Files (x86)\Git\bin\sh.exe"; Parameters: "--login -i"; Flags: dontcloseonexit

[Run]
; http://unattended.sourceforge.net/installers.php
Description: "Install MSYS-git UNIX-like environment (Required)"; Filename: "{app}\Git-1.9.0-preview20140217.exe"; Flags: postinstall
; Parameters: "/sp- /silent /norestart"
Description: "Install VirtualBox virtualisation (Required)"; Filename: "msiexec"; Parameters: "/i ""{app}\VirtualBox-4.3.8-r92456-MultiArch_amd64.msi"""; Flags: postinstall

[UninstallRun]
Filename: "{app}\delete.sh"
