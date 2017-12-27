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
velo=0.1481
finalpixelofgreen=0

errorcounter=0

justabovegreen=863

MsgBox This is a debug version of spypartypooper.
searchfromX=0
searchtoX=0

greeny=0
greenx=0

searchcomplete=0

+RButton::

Send {RButton DOWN}
Sleep, 30
Send {RButton UP}


Time1 := A_TickCount


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
	
	  
	  

	  ErrorLevel = 0
	  
	  
	  MsgBox checking from %searchfromX%
	  
	  Loop
	  {
	  
	    
	  
	   PixelSearch, lastseenx, lastseeny, searchfromX, 867, searchfromX, 867, %darkergreen%,250,Fast
	   if ErrorLevel = 0
	   {
	     searchfromX:=searchfromX-1
		 MsgBox first barrier crossed
	     PixelSearch, lastseenx, lastseeny, searchfromX, 867, searchfromX, 867, %evendarkergreen%, 20,Fast
		 if ErrorLevel = 0
		 {
		 
		   searchfromX:=searchfromX-1
		   PixelSearch, lastseenx, lastseeny, searchfromX, 867, searchfromX, 867, %darkestgreen%, 20,Fast
		   if ErrorLevel = 0
		   {
		      searchfromX:=searchfromX-1
		      PixelSearch, lastseenx, lastseeny, searchfromX, 867, searchfromX, 867, %lightestgreen%, 20,Fast
              if ErrorLevel = 0
			  
			  {
			        searchfromX:=searchfromX-1
			  
			  }
			  
			  else
			  {
			      if errorcounter<20
			      {
			      errorcounter:=errorcounter+1
				  continue
			      }
			      else
			      { 
			 
			       finalpixelofgreen:=%searchfromX%
			       Break
			      }
			   
			  
			  
			  }
		     
		   }
		   else
		   {
		     if errorcounter<20
			 {
			      errorcounter:=errorcounter+1
				  continue
			 }
			 else
			 { 
			 
			       finalpixelofgreen:=%searchfromX%
			       Break
			 }
			 
		   }
		 }
		 
		 else
		 {
		    if errorcounter<20
			{
			      errorcounter:=errorcounter+1
				  continue
			}
			else
			{ 
			 
			       finalpixelofgreen:=%searchfromX%
			       Break
			}
		 }
	   }
	   else
	   {
		  if errorcounter<20
	      {
			    errorcounter:=errorcounter+1
				continue
		  }
		  else
			{ 
			 
			     finalpixelofgreen:=%searchfromX%
			     Break
			}
	   }
	   
	   
	
	  }
	  MsgBox greens last pixel after loops is %searchfromX%
	

	  
	  
	  

	  
      if searchcomplete=1
      {
	      
	      Dist:=%finalpixelofgreen%-867
		  
		  
	   
	      Time2:=A_TickCount
		  TimePraejo:=Time2-Time1
		  
		  LaikasNuvaziuot:=Dist/velo
		  LaikoLiko:=LaikasNuvaziuot-TimePraejo
		  
		  TimePabaiga:=Time2+LaikoLiko+120
		  
		  while(A_TickCount<TimePabaiga)
		  {
		      
		  }
		  
		  Send {RButton DOWN}
          Sleep, 20
          Send {RButton UP}
		  
		  
		  
		 ; MsgBox praejo %TimePraejo%  laiko nuo paspaudimo iki suradimo, atstumas %Dist%

	  
	     
	  
	  
	  }
	  else
	  {
	     MsgBox error yo
	  
	  }
	  

	
	
}
else
{
    MsgBox, lol fuck
}
	
	
return	
	
F4::

ExitApp

