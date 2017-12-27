#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


toggleon:=false

F1::

if toggleon

    toggleon:=false
else 

toggleon:=true



return

+RButton::

Send {RButton DOWN}
Sleep, 10
Send {RButton UP}




1stgreen=0x95FFA3
2ndgreen=0x2BFF3A
3rdgreen=0x74FF65


justabovegreen=863

MsgBox This is a debug version of spypartypooper.
tehwhite=0xE5E5E5

greeny=0
greenx=0

foundx=0




PixelSearch, greenx, greeny, 867, 867, 1062, 867, 0x2BFF3A, 50,Fast
if ErrorLevel = 1
{
    Loop
	{
	   PixelSearch, greenx, greeny, 867, 867, 1062, 867, 0x95FFA3, 20,Fast
	   if ErrorLevel = 1
	   {
	     PixelSearch, greenx, greeny, 867, 867, 1062, 867, 0x2BFF3A, 20,Fast
		 if ErrorLevel = 1
		 {
		   PixelSearch, greenx, greeny, 867, 867, 1062, 867, 0x74FF65, 20,Fast
		   if ErrorLevel = 1
		   {
		     continue
		   }
		   else
		   {
		     foundx:=greenx
		     Break
		   }
		 }
		 
		 else
		 {
		    foundx:=greenx
		    Break
		 }
	   }
	   else
	   {
	      foundx:=greenx
	     Break
	   }
	   
	
	}
	MsgBox found green after looping at X%greenx% Y%greeny%.
	MsgBox looking for green to trigger at X%foundx% Y%justabovegreen%
}
else
{
    MsgBox, green found instantly at X%greenx% Y%greeny% !
}
	MsgBox,  script finished.
	
return	
	
F4::

ExitApp

