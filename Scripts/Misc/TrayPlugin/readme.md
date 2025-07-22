
#### minimize/restore
###### minimize the active window to the tray
```js
MinToTray.SendToTray(sp.ForegroundWindow().HWnd);
```
###### restore all windows from the tray
```js
MinToTray.ShowAllTrayWindows();
```
---
#### save/restore tray icons order 

```js
TrayIcon.SaveOrder("C:\\1\\tray_order.txt");
TrayIcon.RestoreOrderFast("C:\\1\\tray_order.txt");
```
###### SaveOrder (StrokesPlus folder)
```js
var base = System.Windows.Forms.Application.StartupPath; // S+.net root
var path = System.IO.Path.Combine(base, "tray_order.txt");
var saved = TrayIcon.SaveOrder(path);
```
###### RestoreOrderFast
```js
var base = System.Windows.Forms.Application.StartupPath; 
var path = System.IO.Path.Combine(base, "tray_order.txt");
var moved = TrayIcon.RestoreOrderFast(path);
```

###### Load/Unload
```js
 sp.CreateTimer("TrayRestore", 10000, 0, String.raw`   // delay 10 seconds
     var p = System.IO.Path.Combine(System.Windows.Forms.Application.StartupPath, "tray_order.txt");  
     if (System.IO.File.Exists(p)){  
        var moved = TrayIcon.RestoreOrderFast(p);  
        sp.ConsoleLog("[TrayIcon] restored: " + moved);  
    }  
    sp.DeleteTimer("TrayRestore");  
 `);
```
---

#### click icon
```js
TrayIcon.Click("StrokesPlus.net.exe", MouseBtn.Left,   false, 1);    
TrayIcon.Click("StrokesPlus.net.exe", MouseBtn.Right,  false, 1);    
TrayIcon.Click("StrokesPlus.net.exe", MouseBtn.Middle, false, 1);
``` 
```js
TrayIcon.Click("StrokesPlus.net.exe", MouseBtn.Left, true, 1); // double LMB  
```
###### click + hotkeys
```js
TrayIcon.Click("StrokesPlus.net.exe", MouseBtn.Right, false, 1); // right click  
sp.Sleep(5);  
sp.SendVKey(vk.UP);  
sp.SendVKey(vk.UP);  
sp.SendVKey(vk.UP);  
sp.Sleep(5);  
sp.SendVKey(vk.RETURN); // enter
```
---
#### hide/show icon (TB_HIDEBUTTON)
```js
TrayIcon.Hide("StrokesPlus.net.exe", true);   // hide
TrayIcon.Hide("StrokesPlus.net.exe", false);  // show
```
###### Delete button from toolbar (TB_DELETEBUTTON)  
> This removes the button-icon from the ToolbarWindow32.  
The app stays alive, but the button will disappear until Explorer/app redraws/restarts.  
```js
TrayIcon.Delete("StrokesPlus.net.exe");
```
###### Completely remove via Shell_NotifyIcon (NIM_DELETE)
```js
var li = TrayIcon.GetInfo("StrokesPlus.net.exe");
if (li.Count) TrayIcon.Remove(li[0].hWnd, li[0].uID);
```
----
#### replace icon
```js
TrayIcon.SetIcon("StrokesPlus.net.exe", "C:\\Icons\\my.ico");
```
---
#### change icon tooltip 
```js
TrayIcon.SetTip("StrokesPlus.net.exe", "My new tooltip");

TrayIcon.SetTip("StrokesPlus.net.exe",
    "hello?\r\hello!\r\hello1\r\hello2\r\hello3\r\hello4");
```
---

#### move within tray (absolute index)
```js
TrayIcon.Move("StrokesPlus.net.exe", 0);   // to the far left edge
TrayIcon.Move("StrokesPlus.net.exe", 10);  // to index 10 (if exists)

function pad(s,w){ s=\"\"+s; while(s.length<w) s+=\" \"; return s; }
var list = TrayIcon.GetInfo();
for (var i=0;i<list.Count;i++){
    var it = list[i];
    sp.ConsoleLog(
        pad(it.Process,35) +
        " idx:" + pad(it.idx,3) +
        " pid:" + pad(it.pID,6) +
        " uID:" + it.uID
    );
}
```
---
#### notification from program
```js
TrayIcon.ShowBalloon("StrokesPlus.net.exe", "Hi!", "It works!");
```
