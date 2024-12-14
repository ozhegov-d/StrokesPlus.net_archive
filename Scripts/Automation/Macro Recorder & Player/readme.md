##### Macro Recorder & Player



https://github.com/user-attachments/assets/368c93a7-173c-4db2-a995-dd17ba8245b4


This is a temporary macro (it will be deleted upon exiting the program).  

var menu = true; // If the menu is set to false, it runs once. 

0 - Play now once (for testing)  
1 - Specify periodicity (e.g., every 10m or 1h25m) - (If you want to disable it, you need to reload StrokePlus)  
2+ - Repeat a specific number of times sequentially (without breaks).  


By default, it is set to F2 (stop recording) - To make it work, you need to press it twice.  
StrokesPlus.Configuration.Settings.CustomMacroStopKey = 0x71; // F2  
If you want to change it, make sure to also update the Hot Keys (macro record stop to the same key).  
(https://learn.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes)
