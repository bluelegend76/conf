TODO: PLUGIN OUTLINE + TESTING
TODO: Reversing KeyBindings

TODO: CREATE COMPLETE LISTING OF ALL QWERTY2SVORAK-KEYS (INCLUDING CTRL-KEYS ETC)

___AutoHotKey
Okay, here are a couple of
examples of using
AutoHotkey for key
remapping and other tasks,
to give you a flavor of its
capabilities:

1. Remapping Keys (Simple):

This script remaps Caps Lock to Ctrl and the right Alt key to the Windows key:

CapsLock::Control
RAlt::LWin
CapsLock::Control: This line remaps the Caps Lock key to function as the Ctrl key.
RAlt::LWin: This line remaps the right Alt key to function as the left Windows key.

2. Remapping Keys (With Modifiers):

This script remaps Shift+1
to produce an exclamation
mark (!) and Ctrl+Alt+T to
open a new terminal (adjust
the terminal command to
your system):

+1::! ; Shift + 1 = !
^!t::Run, wt.exe ; Ctrl + Alt + T = Open Windows Terminal (adapt to your terminal)
+1::!: The + symbol represents the Shift modifier. So, this line remaps Shift+1 to !.
^!t::Run, wt.exe: The ^ symbol represents Ctrl, and the ! symbol represents Alt. Run, wt.exe executes the command to open Windows Terminal. Change wt.exe to the appropriate command for your terminal (e.g., cmd.exe, powershell.exe, gnome-terminal if you are running AHK in Wine on Linux).

- 3. Sending Text with a Hotkey:

This script remaps
Ctrl+Shift+S to send a
specific text string:

^+s::SendInput, This is some pre-defined text.{Enter}
^+s::: Ctrl+Shift+S is the hotkey.
SendInput, This is some pre-defined text.{Enter}: This sends the text "This is some pre-defined text." followed by an Enter key press. SendInput is generally preferred over Send for better reliability.

- 4. Running an Application
  with a Hotkey:

This script remaps Win+E to
open File Explorer:

#e::Run, explorer.exe
#e::: The # symbol represents the Windows key.
Run, explorer.exe: This executes the command to open File Explorer.

5. Context-Sensitive Hotkeys:

This script remaps Ctrl+Space to insert a tab character only in Notepad:

#IfWinActive, ahk_exe notepad.exe
^Space::SendInput, {Tab}
#IfWinNotActive
#IfWinActive, ahk_exe notepad.exe: This makes the remapping active only when a Notepad window is active.
#IfWinNotActive: This ends the context-sensitive block.


How to Use AutoHotkey Scripts:

- Install AutoHotkey:
  Download and install
  AutoHotkey from
  https://www.autohotkey.com/.
- Create a script file:
  Create a plain text file
  with a .ahk extension
  (e.g., my_script.ahk).
- Write your script: Paste
  the AutoHotkey code into
  the file.
- Run the script:
  Double-click the .ahk
  file to run it.
  AutoHotkey will run in
  the background, and your
  remappings and hotkeys
  will be active.
- Make the script run on
  startup: To make the
  script run automatically
  when you log in, create a
  shortcut to the .ahk file
  and place it in your
  startup folder (usually
  C:\Users\<YourUserName>\AppData\Roaming\Microsoft\Windows\Start
  Menu\Programs\Startup).

Key AutoHotkey Concepts:

- Hotkeys: Combinations of
  keys that trigger
  actions.
- Commands: Actions that
  are performed when a
  hotkey is pressed (e.g.,
  SendInput, Run).
- Modifiers: Special keys
  that modify the behavior
  of other keys (e.g.,
  Shift, Ctrl, Alt, Win).
- Context Sensitivity:
  Applying hotkeys only in
  specific windows or
  applications.

These examples should give
you a good starting point
for using AutoHotkey. It's
a very powerful tool that
can significantly improve
your productivity by
automating tasks and
customizing your keyboard.
Remember to consult the
AutoHotkey documentation
for more advanced features
and commands.


- It seems like AutoHotkey
  actually could be used to
  create a script for
  remapping all the keys to
  emulate resetting the
  keyboard to using Dvorak
  (or specifically in my
  case to Svorak)?

Yes, AutoHotkey is
perfectly capable of
remapping all keys to
emulate Dvorak or Svorak
layouts. It's a common use
case for AutoHotkey,
especially for users who
want to use these layouts
on systems where they
aren't natively supported
or easily configurable.

Here's how you can approach
creating an AutoHotkey
script for Dvorak/Svorak
emulation:


___AutoHotKey=Svorak
- 1. Understanding the Key
  Mappings:

You'll need a mapping of
QWERTY keys to
Dvorak/Svorak keys. There
are many resources online
that provide these
mappings. For example, a
basic QWERTY to Dvorak
mapping looks like this
(simplified):

': '
,: ,
.: .
p: y
y: f
f: u
g: r
c: p
r: l
l: d
u: j
d: h
j: k
k: x
x: b
b: w
w: v
v: z
z: '

And so on for all the other keys.

- 2. Creating the
  AutoHotkey Script:

You'll use the :: operator
to remap keys. Here's a
snippet demonstrating how
to remap a few keys from
QWERTY to Dvorak:

; Remap QWERTY to Dvorak (example)
p::y
y::f
f::u
g::r
c::p
r::l
l::d
u::j
d::h
j::k
k::x
x::b
b::w
w::v
v::z
z::'
; ... add all other mappings

- 3. Handling Shift and
  Other Modifiers:

To handle shifted
characters (uppercase
letters and symbols),
you'll use the + modifier:

; Remap shifted characters (example)
+p::Y ; Shift+p = Y
+y::F ; Shift+y = F
; ... add all other shifted mappings

- 4. Handling Special
  Characters and Symbols:

You'll need to map special
characters and symbols as
well. You might need to use
their names or their
ASCII/Unicode codes. For
example:

; Remap special characters (example)
`;::[
'::]
/::/
+;::{+
+'::}
+/::?

- 5. Complete Example
  (Partial Dvorak):

Here's a more complete (but
still partial) example of a
QWERTY to Dvorak remapping:

; Lowercase letters
p::y
y::f
f::u
g::r
c::p
r::l
l::d
u::j
d::h
j::k
k::x
x::b
b::w
w::v
v::z
z::'
; ... other lowercase

; Uppercase letters
+p::Y
+y::F
+f::U
+g::R
+c::P
+r::L
+l::D
+u::J
+d::H
+j::K
+k::X
+x::B
+b::W
+w::V
+v::Z
+z::" ; Shift+z = "

; Symbols
`;::[
'::]
/::/
+;::{+
+'::}
+/::?

; Numbers (if you want to remap them as well)
1::1
2::2
3::3
4::$ ; Example remapping of 4 to $
+4::4
; ... other numbers


- 6. Svorak Mapping:

To create a Svorak mapping,
you would simply use the
Svorak key mappings instead
of the Dvorak ones in your
AutoHotkey script.

- 7. Making the Script Run
  on Startup:

As mentioned before, to
make the script run
automatically when you log
in, create a shortcut to
the .ahk file and place it
in your startup folder.  __


Important Considerations:

- Complete Mapping: Make
  sure you map all keys,
  including numbers,
  symbols, function keys,
  and other special keys,
  to ensure a complete and
  consistent layout.
- Testing: Thoroughly test
  your script after
  creating it to make sure
  all keys are mapped
  correctly.
- Context-Specific
  Remapping (Optional): If
  you only want the
  Dvorak/Svorak layout to
  be active in certain
  applications, you can use
  context-sensitive hotkeys
  (#IfWinActive,
  #IfWinNotActive).
- Alternative Layouts:
  Consider using built-in
  keyboard layouts in
  Windows if they are
  available for your
  desired layout.
  AutoHotkey is most useful
  when a layout isn't
  readily available.

By following these steps,
you can create a fully
functional AutoHotkey
script to emulate Dvorak or
Svorak layouts on your
Windows system. This is a
powerful way to customize
your keyboard layout and
improve your typing
experience.
