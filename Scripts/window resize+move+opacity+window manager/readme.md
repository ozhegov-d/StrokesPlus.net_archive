### GridSnapWindow v2


https://github.com/user-attachments/assets/cafbb0de-561b-4a8e-a077-465ebd22baf2

![example](https://github.com/user-attachments/assets/890e46e3-103a-4b83-ad4d-290f2ff749ba)

Zones can be manually assigned (size and position).

---------------------------------------------------------------------------------------------------------
### MoveWindowByCenter

Dragging the window by its center area with just a mouse click.

https://github.com/user-attachments/assets/dd1d079b-fc66-40f5-a6bd-f831fc215be3

#### Global Actions > Mouse Events > Click

To change the mouse button
if (!sp.IsButtonDown(MouseButtons.Left)) { // | Left | Right | Middle | XButton1 | XButton2 | Note: Case-sensitive

> Keep in mind that if the window you're clicking on is running as administrator, an error will occur if StrokesPlus is not run as administrator.

v2  
If part of the window extends beyond the screen, the 'center' area shifts to the visible part of the window.

---------------------------------------------------------------------------------------------------------
### QuickSwapWindows
Swap the current window with the previously active window, preserving their positions and sizes.

https://github.com/user-attachments/assets/1b2083f0-0cd7-448d-bec8-f01c008cfea5

v2  
implemented via click-based saving of recent windows (now all windows swap positions correctly)

---------------------------------------------------------------------------------------------------------
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

> v2 it doesn't work on the taskbar

---------------------------------------------------------------------------------------------------------
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

---------------------------------------------------------------------------------------------------------
### WindowSplitter


https://github.com/user-attachments/assets/ebba4d73-0182-416b-b7b8-81719e420e6b


Works for both hotkeys and gestures  
First, activate the window with a mouse click, then use the hotkey (you can change the location of the windows using which window was last activated)  
You can also choose how the windows will be positioned (vertically, horizontally, etc.)  
