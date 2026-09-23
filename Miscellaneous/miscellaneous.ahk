
; Allow normal CapsLock functionality to be toggled by Shift+CapsLock:
!CapsLock::
    GetKeyState, capsstate, CapsLock, T ;(T indicates a Toggle. capsstate is an arbitrary varible name)
    if capsstate = U
        SetCapsLockState, AlwaysOn
    else
        SetCapsLockState, AlwaysOff
    return
CapsLock::Enter
; Capslock & w::Send {Blind}{Up}
; Capslock & s::Send {Blind}{Down}
Capslock & w::Up
Capslock & s::Down
CapsLock & a::Left
CapsLock & d::Right
Capslock & q::PgUp
Capslock & e::PgDn

; A function to escape characters like & for use in URLs.
uriEncode(str) {
    f = %A_FormatInteger%
    SetFormat, Integer, Hex
    If RegExMatch(str, "^\w+:/{0,2}", pr)
        StringTrimLeft, str, str, StrLen(pr)
    StringReplace, str, str, `%, `%25, All
    Loop
        If RegExMatch(str, "i)[^\w\.~%/:]", char)
           StringReplace, str, str, %char%, % "%" . SubStr(Asc(char),3), All
        Else Break
    SetFormat, Integer, %f%
    Return, pr . str
}
