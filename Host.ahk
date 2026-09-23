;+ Capslock hotkeys
; Created by Asger Juul Brunshøj
;Blank Template written by GroggyOtter https://pastebin.com/mMxi8KEQ

; if not A_IsAdmin
; {
;     Run *RunAs "%A_ScriptFullPath%"
;     ExitApp
; }
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
; Keeps script permanently running
#Persistent
; Determines how fast a script will run (affects CPU utilization).
; The value -1 means the script will run at its max speed possible.
SetBatchLines, -1
; Avoids checking empty variables to see if they are environment variables.
; Recommended for performance and compatibility with future AutoHotkey releases.
#NoEnv
; Ensures that there is only a single instance of this script running.
#SingleInstance, Force
; Makes a script unconditionally use its own folder as its working directory.
; Ensures a consistent starting directory.
SetWorkingDir %A_ScriptDir%
; Sets title matching to search for "containing" instead of "exact"
SetTitleMatchMode, 2

; GroupAdd, saveReload, %A_ScriptName%
; GroupAdd, saveReload, UserCommands.ahk
Loop, Files, %A_ScriptDir%\*.ahk, R
{
    GroupAdd, saveReload, %A_LoopFileName%
}

SetCapsLockState, AlwaysOff

; #InstallKeybdHook

;-------------------------------------------------------
; AUTO EXECUTE SECTION FOR INCLUDED SCRIPTS
; Scripts being included need to have their auto execute
; section in a function or subroutine which is then
; executed below.
;-------------------------------------------------------
Gosub, gui_autoexecute
;-------------------------------------------------------
; END AUTO EXECUTE SECTION
return
;-------------------------------------------------------

;============================== Save Reload / Quick Stop ==============================
#IfWinActive, ahk_group saveReload

    ; Use Control+S to save your script and reload it at the same time.
    ~^s::
        TrayTip, Reloading updated script, %A_ScriptName%
        SetTimer, RemoveTrayTip, 1500
        Sleep, 1750
        Reload
    return

    ; Removes any popped up tray tips.
    RemoveTrayTip:
        SetTimer, RemoveTrayTip, Off
        TrayTip
    return

    ; Control+Esc to close your script
    ^Esc::
    ExitApp

#IfWinActive
; Load the GUI code
#Include %A_ScriptDir%\GUI\GUI.ahk

; General settings
#Include %A_ScriptDir%\Miscellaneous\miscellaneous.ahk
