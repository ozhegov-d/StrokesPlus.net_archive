#Requires AutoHotkey v2.0
SendMode("Input")

SPPath := "C:\test\StrokesPlus.net.exe"

if !FileExist(SPPath) {
    MsgBox("Error: StrokesPlus.net.exe not found at path:`n" . SPPath, "Launcher", 48)
    ExitApp
}

threshold := 200
global strokeStarted := false

StartStroke() {
    if GetKeyState("XButton1", "P") {
        strokeStarted := true
        Send "{XButton1 down}"
    }
}

; When xbutton1 was pressed
XButton1:: {
    strokeStarted := false
    SetTimer(StartStroke, -threshold)
    Return
}

; When xbutton1 was released
XButton1 Up:: {
    SetTimer(StartStroke, 0)
    if (strokeStarted)
        Send "{XButton1 up}"
    Return
}

ProcessName := "StrokesPlus.net.exe"
if !ProcessExist(ProcessName)
    Run SPPath

Return