#Required AutoHotKey 2.0
#NoTrayIcon

; nvim
CapsLock::Esc
#M::
{
	if WinExist("ahk_exe Neovide.exe")
	WinActivate
	Else Run 'C:\Program Files\Neovide\neovide.exe'
}

; win tiling
#PgUp::#Up
#PgDn::WinMinimize("A")

; notepads
#N::
{
	if WinExist("ahk_class ApplicationFrameWindow", "Notepads")
	WinActivate
	Else Run 'Notepads'
}

; obsidian
#O::
{
	If WinExist('ahk_exe Obsidian.exe')
	WinActivate
	Else Run 'C:\Users\kavin\AppData\Local\Programs\Obsidian\Obsidian.exe'
}

; terminal
#t::
{
	If WinExist('ahk_exe WindowsTerminal.exe')
	WinActivate
	Else Run 'C:\Users\kavin\AppData\Local\Microsoft\WindowsApps\wt.exe'
}
^!t::
{
	If WinExist('ahk_exe WindowsTerminal.exe')
	WinActivate
	Else Run 'C:\Users\kavin\AppData\Local\Microsoft\WindowsApps\wt.exe'
}