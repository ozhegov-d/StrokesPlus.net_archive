### window resize+move+opacity+always on top+remove window title

https://github.com/user-attachments/assets/3a076e3a-e279-4084-974c-43f3ef48d699

#### Global Actions > Mouse Events > Click 

+ Ctrl + Click - Move the window
+ Alt + Click - Resize the window
+ Сtrl + Alt + Click - Remove window title
+ Ctrl + Shift + Click - Always on top

If you want it to work with Ctrl, then you need to (Options > Generals > Ignore Key > uncheck(ctrl))

#### Global Actions > Mouse Events > Mouse Wheel

+ Alt + Scroll - Change the window's opacity
  
if opacity is less than 255(maximum value) it becomes over all windows

v2 it doesn't work on the taskbar

### Window Slot Manager  
#### A script for saving and restoring window positions.

https://github.com/user-attachments/assets/c3670e79-d5fe-4840-a743-62b93f1e3525


To find uwpApps  
In PowerShell, you can use the following command to list all installed UWP applications with names containing "Microsoft.":  
Get-AppxPackage | Where-Object { $_.Name -like "Microsoft.*" } | Select-Object Name, PackageFullName  

If JSON has empty title and FilePath:  
"Title": "",  
"ProcessName": "mpc-hc64",  
"FilePath": "",  
and MPC is already running, it won't launch again. The script will find the first available instance of the mpc-hc64 process and will activate it.  

If JSON includes an argument:  
"Title": "windows.json - Everything (1.5a)",  
"ProcessName": "Everything64",  
"Arguments": "-help",  
then the title will be ignored, and the script will find the first available instance of the Everything64 process and will activate it.  

### GridSnapWindow


https://github.com/user-attachments/assets/4bf13867-0b11-4b9a-b2c9-7b564c8b1580


#### Global Actions > Mouse Events > Left Click:

//If the click event is not the Down event (so on left button up) and the grid snap is active  
if(!click.Down && sp.GetStoredBool("GridSnapActive")) {  
// Disables GridSnapWindow: removes the timer and related variables  
    sp.DeleteTimer("GridSnap");  
    sp.DeleteStoredHandle("GridSnapWindow");  
    sp.DeleteStoredBool("GridSnapActive");  
}  

### WindowSplitter


https://github.com/user-attachments/assets/ebba4d73-0182-416b-b7b8-81719e420e6b


Works for both hotkeys and gestures  
First, activate the window with a mouse click, then use the hotkey (you can change the location of the windows using which window was last activated)  
You can also choose how the windows will be positioned (vertically, horizontally, etc.)  
