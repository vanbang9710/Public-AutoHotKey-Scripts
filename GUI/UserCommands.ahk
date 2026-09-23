; Created by Asger Juul Brunshøj

; Note: Save with encoding UTF-8 with BOM if possible.
; I had issues with special characters like in ¯\_(ツ)_/¯ that wouldn't work otherwise.
; Notepad will save UTF-8 files with BOM automatically (even though it does not say so).
; Some editors however save without BOM, and then special characters look messed up in the AHK GUI.

;-------------------------------------------------------------------------------
;;; SEARCH GOOGLE ;;;
;-------------------------------------------------------------------------------
if Pedersen = g%A_Space% ; Search Google
{
    gui_search_title = Search Google
    gui_search("https://www.google.com/search?num=50&safe=off&site=&source=hp&q=REPLACEME&btnG=Search&oq=&gs_l=")
}
else if Pedersen = m%A_Space% ; Open more than one URL
{
    gui_search_title = multiple
    gui_search("https://www.google.com/search?&q=REPLACEME")
    gui_search("https://www.bing.com/search?q=REPLACEME")
    gui_search("https://duckduckgo.com/?q=REPLACEME")
}
; else if Pedersen = x%A_Space% ; Search Google as Incognito
; ;   A note on how this works:
; ;   The function name "gui_search()" is poorly chosen.
; ;   What you actually specify as the parameter value is a command to run. It does not have to be a URL.
; ;   Before the command is run, the word REPLACEME is replaced by your input.
; ;   It does not have to be a search url, that was just the application I had in mind when I originally wrote it.
; ;   So what this does is that it runs chrome with the arguments "-incognito" and the google search URL where REPLACEME in the URL has been replaced by your input.
; {
;     gui_search_title = Google Search as Incognito
;     gui_search("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe -incognito https://www.google.com/search?safe=off&q=REPLACEME")
; }
else if Pedersen = y%A_Space% ; Search Youtube
{
    gui_search_title = Search Youtube
    gui_search("https://www.youtube.com/results?search_query=REPLACEME")
}


;-------------------------------------------------------------------------------
;;; LAUNCH WEBSITES AND PROGRAMS ;;;
;-------------------------------------------------------------------------------
if Pedersen = face ; facebook.com
{
    gui_destroy()
    run www.facebook.com
}
else if Pedersen = red ; reddit.com
{
    gui_destroy()
    run www.reddit.com
}
else if Pedersen = inbox ; Open google inbox
{
    gui_destroy()
    run https://inbox.google.com/u/0/
    ; run https://mail.google.com/mail/u/0/#inbox  ; Maybe you prefer the old gmail
}


; ;-------------------------------------------------------------------------------
; ;;; INTERACT WITH THIS AHK SCRIPT ;;;
; ;-------------------------------------------------------------------------------
; else if Pedersen = rel ; Reload this script
; {
;     gui_destroy() ; removes the GUI even when the reload fails
;     Reload
; }
; else if Pedersen = dir ; Open the directory for this script
; {
;     gui_destroy()
;     Run, %A_ScriptDir%
; }
; else if Pedersen = host ; Edit host script
; {
;     gui_destroy()
;     run, notepad.exe "%A_ScriptFullPath%"
; }
; else if Pedersen = user ; Edit GUI user commands
; {
;     gui_destroy()
;     run, notepad.exe "%A_ScriptDir%\GUI\UserCommands.ahk"
; }


;-------------------------------------------------------------------------------
;;; TYPE RAW TEXT ;;;
;-------------------------------------------------------------------------------
; else if Pedersen = clip ; Paste clipboard content without formatting
; {
;     gui_destroy()
;     SendRaw, %ClipBoard%
; }


;-------------------------------------------------------------------------------
;;; OPEN FOLDERS ;;;
;-------------------------------------------------------------------------------
else if Pedersen = rec ; Recycle Bin
{
    gui_destroy()
    Run ::{645FF040-5081-101B-9F08-00AA002F954E}
}


;-------------------------------------------------------------------------------
;;; MISCELLANEOUS ;;;
;-------------------------------------------------------------------------------
else if Pedersen = ping ; Ping Google
{
    gui_destroy()
    Run, cmd /K "ping store.steampowered.com"
}
else if Pedersen = week ; Which week is it?
{
    gui_destroy()
    FormatTime, weeknumber,, YWeek
    StringTrimLeft, weeknumbertrimmed, weeknumber, 4
    if (weeknumbertrimmed = 53)
        weeknumbertrimmed := 1
    MsgBox It is currently week %weeknumbertrimmed%
    weeknumber =
    weeknumbertrimmed =
}
else if Pedersen = ? ; Tooltip with list of commands
{
    GuiControl,, Pedersen, ; Clear the input box
    Gosub, gui_commandlibrary
}
