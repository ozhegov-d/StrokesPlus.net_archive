
### One hotkey, different clicks per program


https://github.com/user-attachments/assets/2fa5c763-aed4-426b-b26b-0c0739653515


Plug-Ins > Hotkey → Mouse Click.dll

Important Note:  
Don't forget to enable this so that when StrokesPlus is disabled, hotkeys still work:  
Options - Advanced - Keep Registered Hot Keys Active When Disabled 

------
hotkey click  
Accordingly, you need to change p1 -> p2 and vk.VK_1 -> vk.VK_2 (if Shift+2).

<img width="667" height="106" alt="hotkey click" src="https://github.com/user-attachments/assets/0c3650f5-b706-48a0-9978-b36e6179c545" />

> For hotkeys with modifiers (Shift/Alt/Ctrl): Release the modifier key after the chain completes to use it again.  
> For single clicks, everything works fine.
------

<img width="630" height="407" alt="Hotkey → Mouse Click" src="https://github.com/user-attachments/assets/654e5761-598e-40cc-a03b-ffaf4d9ebdea" />




##### Notes:  

When panels are enabled, instead of hotkey Shift+1, it becomes click p1.  
When Reload/Apply StrokesPlus, it returns to hotkey Shift+1.  

You can also create exceptions for specific exe files:  
> Settings - Ignore clicks for this exe  
---
> Global Mode:

Works independently of windows, operates for the entire screen.  

---
Click Types:  
> Click - Invisible (SendInput):

Real physical click at the specified point, then returns cursor to its previous position. Also works in games (that support it) - the game should be running in windowed mode to place panels first in the window.  
> Click - Virtual (PostMessage):

Click without any mouse movement (will only work if the program itself supports this, e.g., Chrome, Visual Studio).  

---
Titles:  
Different clicks depending on window title for the same exe.  

---

> Lock panels to the current window:

Locks panels specifically to this window (needed for chains to place panels in windows that will open). Also, Lock panels will be enabled by default if the first and last clicks in the chain differ by hwnd. The checkbox will be unchecked after closing the form.

---

> Chain - Toggle (A/B/..):

Example (1 1.1 1.2 - if it's just a chain, it will follow continuously from 1 to 1.2; if A/B, then each click will move to the next panel in the chain).  

