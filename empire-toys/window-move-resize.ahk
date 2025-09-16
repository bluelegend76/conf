; Win + Left-click and drag to move window
#LButton::
    WinGetPos, X, Y, Width, Height, A
    MouseGetPos, MouseX, MouseY
    offset_x := MouseX - X
    offset_y := MouseY - Y
    WinMove, A, , , , , , 1 ; Activate the window

    while (GetKeyState("LButton", "P")) {
        MouseGetPos, NewMouseX, NewMouseY
        NewX := NewMouseX - offset_x
        NewY := NewMouseY - offset_y
        WinMove, A, , NewX, NewY
        Sleep, 10
    }
return

; Win + Right-click and drag to resize window
#RButton::
    WinGetPos, X, Y, Width, Height, A
    MouseGetPos, MouseX, MouseY
    offset_width := MouseX - X - Width
    offset_height := MouseY - Y - Height
    WinMove, A, , , , , , 1 ; Activate the window

    while (GetKeyState("RButton", "P")) {
        MouseGetPos, NewMouseX, NewMouseY
        NewWidth := NewMouseX - X - offset_width
        NewHeight := NewMouseY - Y - offset_height
        WinMove, A, , X, Y, NewWidth, NewHeight
        Sleep, 10
    }
return