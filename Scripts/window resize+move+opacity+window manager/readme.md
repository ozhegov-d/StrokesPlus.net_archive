### MoveWindowByClick

Move the window by clicking anywhere.

https://github.com/user-attachments/assets/dd1d079b-fc66-40f5-a6bd-f831fc215be3

#### Global Actions > Mouse Events > Click

###### <mark>ver. AnyButton</mark>  
**Dragging starts instantly** when any mouse button (`Left`/`Right`/`Middle`/`XButton1`/`XButton2`)  
is pressed anywhere on the window.

###### <mark>ver. special for LeftButton</mark> 
**Dragging is bound** to the left mouse button anywhere on the window,  
but only starts after:
- Holding for **≥ `DELAY_MS`** (default `60 ms`)
- Cursor movement ≤ **± `STILL_PX`** (e.g. `1 px`)

---------------------------------------------------------------------------------------------------------
### GridSnapWindow 
v3  
+Long gesture (>240px) → teleport to the next monitor with proportional resizing  
+Zone 5 expanded to make it easier to hit  

https://github.com/user-attachments/assets/cafbb0de-561b-4a8e-a077-465ebd22baf2

![example](https://github.com/user-attachments/assets/890e46e3-103a-4b83-ad4d-290f2ff749ba)

Zones can be manually assigned (size and position).

---------------------------------------------------------------------------------------------------------
### QuickSwapWindows
Swap the current window with the previously active window, preserving their positions and sizes.

v1: via sp.LastApplication(); – Activates the last active, non-minimized window (similar to Alt+Tab; doesn't work with some apps like Telegram).  
v2: via left click (last two windows) – Works for both minimized and maximized windows (works with Telegram).  


https://github.com/user-attachments/assets/1b2083f0-0cd7-448d-bec8-f01c008cfea5

---------------------------------------------------------------------------------------------------------
### window resize+move+opacity+always on top+remove window title

>v3 Allows moving maximized window , optimization  
 v2 it doesn't work on the taskbar

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

