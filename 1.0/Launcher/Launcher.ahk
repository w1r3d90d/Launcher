#Persistent
#NoTrayIcon
#Singleinstance force
SetWorkingDir, C:\Resources\Launcher

;;;;;  THIS VERSION IS OPTIMIZED FOR 1920x1080 RESOLUTION
;;;;;  2018 BY BRIAN DOWNER
;;;;;  https://github.com/w1r3d90d/Launcher

inifile = C:\Resources\Launcher\config.ini
cfgfile = C:\Resources\Launcher\Launcher.cfg
ShortcutIconOverlay = C:\Resources\Launcher\Icons\ButtonOverlay.png

ButtonSize=128
Spacing = 64
TotalAreaWidth := (ButtonSize * 9) + (Spacing * 10)
ButtonTextPOSv := (ButtonSize - 14)
FONTSIZE = s8
Original_Height:= A_ScreenHeight
Original_Width:= A_ScreenWidth

FileRead, Config_raw, %inifile%
StringReplace, OutVar, Config_raw, [, [, UseErrorLevel
TotalIcons:=Errorlevel - 1

ChangeResolution( cD, sW, sH, rR ) {
  VarSetCapacity(dM,156,0), NumPut(156,2,&dM,36)
  DllCall( "EnumDisplaySettingsA", UInt,0, UInt,-1, UInt,&dM ), 
  NumPut(0x5c0000,dM,40)
  NumPut(cD,dM,104), NumPut(sW,dM,108), NumPut(sH,dM,112), NumPut(rR,dM,120)
  Return DllCall( "ChangeDisplaySettingsA", UInt,&dM, UInt,0 )
}

if (GetKeyState("CapsLock", "T") = 1)
	{
	ChangeResolution(32,1920,1080,60) 
	}

Loop %TotalIcons%
{
IniRead, ShortcutName, %inifile%, Shortcut%A_Index%, Name
IniRead, ShortcutType, %inifile%, Shortcut%A_Index%, Type
IniRead, ShortcutLocation, %inifile%, Shortcut%A_Index%, Location
IniRead, ShortcutEXE, %inifile%, Shortcut%A_Index%, EXE
IniRead, ShortcutParameters, %inifile%, Shortcut%A_Index%, Parameters
IniRead, ShortcutIcon, %inifile%, Shortcut%A_Index%, Icon
IniRead, ShortcutResolution, %inifile%, Shortcut%A_Index%, Resolution


;WinSet, Transparent, 128, %ShortcutName%

Gui, %A_Index%:Font, bold %FONTSIZE%, Calibri
Gui, %A_Index%:Color, 000002
Gui, %A_Index%:Margin, 0, 0
Gui, %A_Index%:+ToolWindow
Gui, %A_Index%:Add, Picture, vGUI%A_Index% gShortcut%A_Index% x0 y0 w%ButtonSize% h%ButtonSize% +BackgroundTrans, %ShortcutIcon%
Gui, %A_Index%:Add, Picture, x0 y0 w%ButtonSize% h%ButtonSize% +BackgroundTrans, %ShortcutIconOverlay%
Gui, %A_Index%:Add, Text, w%ButtonSize% +Center BackgroundTrans cFFFFFF x0 y%ButtonTextPOSv% ,%ShortcutName%
Gui %A_Index%:-Caption -Border

if ( A_Index -le 9 )
{
row1 := Ceil(ButtonSize + (Spacing))
col1 := (.5 * (A_ScreenWidth - TotalAreaWidth) - ButtonSize) + (A_Index * (ButtonSize + Spacing))
Gui, %A_Index%:Show, x%col1% y%row1% h%ButtonSize% w%ButtonSize%, launcher
}
if ( A_Index > 9 ) && ( A_Index -le 18 )
{
A_Index2++
row2 := Ceil((ButtonSize * 2) + (Spacing * 2))
col2 := (.5 * (A_ScreenWidth - TotalAreaWidth) - ButtonSize) + (A_Index2 * (ButtonSize + Spacing))
Gui, %A_Index%:Show, x%col2% y%row2% h%ButtonSize% w%ButtonSize%, launcher
}
if ( A_Index > 18 ) && ( A_Index -le 27 )
{
A_Index3++
row3 := Ceil((ButtonSize * 3) + (Spacing * 3))
col3 := (.5 * (A_ScreenWidth - TotalAreaWidth) - ButtonSize) + (A_Index3 * (ButtonSize + Spacing))
Gui, %A_Index%:Show, x%col3% y%row3% h%ButtonSize% w%ButtonSize%, launcher
}
if ( A_Index > 27 ) && ( A_Index -le 36 )
{
A_Index4++
row4 := Ceil((ButtonSize * 4) + (Spacing * 4))
col4 := (.5 * (A_ScreenWidth - TotalAreaWidth) - ButtonSize) + (A_Index4 * (ButtonSize + Spacing))
Gui, %A_Index%:Show, x%col4% y%row4% h%ButtonSize% w%ButtonSize%, launcher
}
WinSet, Transcolor, 000002, launcher

}

Return
^F9::ExitApp



#Include C:\Resources\Launcher\Launcher.cfg

