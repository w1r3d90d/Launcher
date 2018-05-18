#Persistent
#Singleinstance force
SetWorkingDir %A_ScriptDir%

;;;;;  THIS VERSION IS OPTIMIZED FOR 1920x1080 RESOLUTION
;;;;;  2018 BY BRIAN DOWNER
;;;;;  https://github.com/w1r3d90d/Launcher

Gosub, PreCheck

inifile = config.ini
cfgfile = c:\Resources\Launcher\Launcher.cfg
FileDelete, %cfgfile%


FileRead, Config_raw, %inifile%
StringReplace, OutVar, Config_raw, [, [, UseErrorLevel
TotalIcons:=Errorlevel - 1


Loop %TotalIcons%
{
IniRead, ShortcutName, %inifile%, Shortcut%A_Index%, Name
IniRead, ShortcutType, %inifile%, Shortcut%A_Index%, Type
IniRead, ShortcutLocation, %inifile%, Shortcut%A_Index%, Location
IniRead, ShortcutEXE, %inifile%, Shortcut%A_Index%, EXE
IniRead, ShortcutParameters, %inifile%, Shortcut%A_Index%, Parameters
IniRead, ShortcutIcon, %inifile%, Shortcut%A_Index%, Icon
IniRead, ShortcutResolution, %inifile%, Shortcut%A_Index%, Resolution
IniRead, ShortcutManual, %inifile%, Shortcut%A_Index%, Manual

;BEGIN 640 RESOLUTION
IfEqual, ShortcutResolution, 640
{
Commands=
(
Shortcut%A_Index%:
SetWorkingDir, %ShortcutLocation%
SetTitleMatchMode 2
IfWinExist, %ShortcutName%
{
WinActivate
WinMaximize
}
else
{
IfExist, %ShortcutLocation%%ShortcutEXE%
	{
	SoundPlay, C:\Resources\Launcher\audio\click.wav
	IfExist, %ShortcutManual%
		MsgBox, 52, Read The Manual, Do you want to read the Manual for this %ShortcutType%?,60
			IfMsgBox Yes
				Run, %ShortcutManual%
			Else
				{			
				ChangeResolution(32,640,480,60)
				RunWait, %ShortcutLocation%%ShortcutEXE% %ShortcutParameters%,,Max
				ChangeResolution(32,Original_Width,Original_Height,60)
				}
	}
else
	MsgBox, 48, Error, Sorry`, %ShortcutName% is missing.,60
}
return`n`n
)
} ; END 640 RESOLUTION


;BEGIN 800 RESOLUTION
IfEqual, ShortcutResolution, 800
{
Commands=
(
Shortcut%A_Index%:
SetWorkingDir, %ShortcutLocation%
SetTitleMatchMode 2
IfWinExist, %ShortcutName%
{
WinActivate
WinMaximize
}
else
{
IfExist, %ShortcutLocation%%ShortcutEXE%
	{
	SoundPlay, C:\Resources\Launcher\audio\click.wav
	IfExist, %ShortcutManual%
		MsgBox, 52, Read The Manual, Do you want to read the Manual for this %ShortcutType%?,60
			IfMsgBox Yes
				Run, %ShortcutManual%
			Else
				{
				ChangeResolution(32,800,600,60)
				RunWait, %ShortcutLocation%%ShortcutEXE% %ShortcutParameters%,,Max
				ChangeResolution(32,Original_Width,Original_Height,60)
				}			
	}
else
	MsgBox, 48, Error, Sorry`, %ShortcutName% is missing.,60
}
return`n`n
)
} ; END 800 RESOLUTION



;BEGIN 1240 RESOLUTION
IfEqual, ShortcutResolution, 1024
{
Commands=
(
Shortcut%A_Index%:
SetWorkingDir, %ShortcutLocation%
SetTitleMatchMode 2
IfWinExist, %ShortcutName%
{
WinActivate
WinMaximize
}
else
{
IfExist, %ShortcutLocation%%ShortcutEXE%
	{
	SoundPlay, C:\Resources\Launcher\audio\click.wav
	IfExist, %ShortcutManual%
		MsgBox, 52, Read The Manual, Do you want to read the Manual for this %ShortcutType%?,60
			IfMsgBox Yes
				Run, %ShortcutManual%
			Else
				{			
				ChangeResolution(32,1024,768,60)
				RunWait, %ShortcutLocation%%ShortcutEXE% %ShortcutParameters%,,Max
				ChangeResolution(32,Original_Width,Original_Height,60)
				}
	}
else
	MsgBox, 48, Error, Sorry`, %ShortcutName% is missing.,60
}
return`n`n
)
} ; END 1024 RESOLUTION




IfEqual, ShortcutResolution, Native
;BEGIN NATIVE RESOLUTION
{
Commands=
(
Shortcut%A_Index%:
SetWorkingDir, %ShortcutLocation%
SetTitleMatchMode 2
IfWinExist, %ShortcutName%
{
WinActivate
WinMaximize
}
else
{
IfExist, %ShortcutLocation%%ShortcutEXE%
	{
		IfExist, %ShortcutManual%
		MsgBox, 52, Read The Manual, Do you want to read the Manual for this %ShortcutType%?,60
			IfMsgBox Yes
				Run, %ShortcutManual%
			Else 	
				{
				SoundPlay, C:\Resources\Launcher\audio\click.wav
				Run, %ShortcutLocation%%ShortcutEXE% %ShortcutParameters%,,Max
				}
	}
else
	MsgBox, 48, Error, Sorry`, %ShortcutName% is missing.,60
}
return`n`n
)
} ; END NATIVE RESOLUTION




FileAppend, %Commands%, %cfgfile%

} ; END LOOP


ExitApp


PreCheck:
IfNotExist, C:\Resources
FileCreateDir, C:\Resources

IfNotExist, C:\Resources\Launcher
FileCreateDir, C:\Resources\Launcher

IfNotExist, C:\Resources\Launcher\Icons
FileCreateDir, C:\Resources\Launcher\Icons

Return


