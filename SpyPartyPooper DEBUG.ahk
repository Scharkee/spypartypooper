#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


1stgreen=0x95FFA3
2ndgreen=0x2BFF3A
3rdgreen=0x74FF65

lightestgreen=0xA8EBA7
darkergreen=0x85EB84
evendarkergreen=0x41EB41
darkestgreen=0x16EB16

justabovegreen=863

MsgBox This is a debug version of spypartypooper.
searchfromX=0
searchtoX=0

greeny=0
greenx=0

searchcomplete=0

+RButton::

Send {RButton DOWN}
Sleep, 10
Send {RButton UP}


PixelSearch, greenx, greeny, 867, 867, 1062, 867, %lightestgreen%, 20,Fast
if ErrorLevel = 1
{
    Loop
	{
	   PixelSearch, greenx, greeny, 867, 867, 1062, 867, %darkergreen%, 20,Fast
	   if ErrorLevel = 1
	   {
	     PixelSearch, greenx, greeny, 867, 867, 1062, 867, %evendarkergreen%, 20,Fast
		 if ErrorLevel = 1
		 {
		   PixelSearch, greenx, greeny, 867, 867, 1062, 867, %darkestgreen%, 20,Fast
		   if ErrorLevel = 1
		   {
		     continue
		   }
		   else
		   {
		     foundx:=greenx
			 searchcomplete:=1
		     Break
			 
		   }
		 }
		 
		 else
		 {
		    foundx:=greenx
		    searchcomplete:=1
		    Break
		 }
	   }
	   else
	   {
	     foundx:=greenx
		 searchcomplete:=1
	     Break
	   }
	   
	   
	
	}
	 searchfromX:=foundx-1
	  searchtoX:=foundx+1
	  
	if searchcomplete=1
	{
	  Loop
	  {
	     PixelSearch, greenx, greeny,searchfromX,justabovegreen,searchtoX,justabovegreen,%lightestgreen%,20,Fast
		 if ErrorLevel=1
		 {
              PixelSearch, greenx, greeny,searchfromX,justabovegreen,searchtoX,justabovegreen,%lightestgreen%,20,Fast
              if ErrorLevel=1
              {
			       PixelSearch, greenx, greeny,searchfromX,justabovegreen,searchtoX,justabovegreen,%lightestgreen%,20,Fast
                   if ErrorLevel=1
				   {
				       PixelSearch, greenx, greeny,searchfromX,justabovegreen,searchtoX,justabovegreen,%lightestgreen%,20,Fast
                       if ErrorLevel=1
					   {
					      continue
					   }
					   else
					   {
					      Break
					   }
					   
				   }
				   else
				   {
				       Break
				   }
			  }
			  else
			  {
	             Break
			  }
			  
		 }
		 else
		 {
		     Break 
		 }
	  
	  
	  }
	  
	  MsgBox touchdown!
	  
	}
	else
	{
	  MsgBox fukin error, search completed without completing the search somehow. fix that shit!
	
	}
	
	
}
else
{
    MsgBox, green found instantly at X%greenx% Y%greeny% !
}
	MsgBox,  script finished.
	
return	
	
F4::

ExitApp

