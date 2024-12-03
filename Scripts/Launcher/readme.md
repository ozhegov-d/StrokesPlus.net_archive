https://github.com/user-attachments/assets/b803a526-ff43-4ca0-8a62-1d1ee7fa5ae0


#### Close the form - ESC/Double left mouse click

**For programs/files:**  
If the program/file has an icon it will display it, if you want some other icon, then you need to specify the path to it in ico:“” and then it will replace the run icon:

##### Examples:  
> {title:"cmd",  run:"cmd", ico:""}, **// No icon will be displayed**  
{title:"cmd2",  run:"C:\\\Windows\\\System32\\\cmd.exe", ico:""}, **// The cmd icon will be displayed**   
{title:"cmd3",  run:"C:\\\Windows\\\System32\\\cmd.exe", ico:"C:\\\123.txt"}, **// The icon of the text editor will be displayed**  
{title:"photo",  run:"C:\\\123.jpg", ico:""}, **// The image will open**  

**For websites:**  
To display website icons, move the icons folder to the program's directory: StrokesPlus.net\icons.
Alternatively, you can specify the full path to the icon or image file.  
##### Examples:  
> {title:"YouTube", run:"www.youtube.com", ico:"c:\\\youtube.png"},   
{title:"YouTube2", run:"https://www.youtube.com", ico:"icons\\\youtube.png"},  
{title:"YouTube3", run:"youtube.com", ico:"icons\\\youtube.ico"},  

**Settings for the form are stored in the same directory as the program:**  
*\StrokesPlus.net\settingsMenu.json
