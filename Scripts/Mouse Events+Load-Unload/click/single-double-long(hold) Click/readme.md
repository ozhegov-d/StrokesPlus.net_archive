
#### Enabled-consume
<img width="302" height="37" alt="enabled-consume" src="https://github.com/user-attachments/assets/52bf93d4-f470-426d-be34-39b382260245" />

> var ENABLE_SINGLE = true; &nbsp;&nbsp;  // single click  
var ENABLE_DOUBLE = true;   &nbsp; // double click  
var ENABLE_HOLD   = true;  &nbsp; &nbsp;&nbsp;&nbsp; // long (hold) click  

> var SHORT_MS      = 200; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    // threshold for a "short" click  
var DOUBLE_GAP_MS = 200;     // interval between clicks for a double click  
var HOLD_MS       = 600;   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  // hold duration for the hold action (ms)  

> function SingleAction() { sp.SendVKey(vk.F5); }                          // single  
function DoubleAction() { sp.SendModifiedVKeys([vk.LCONTROL],[vk.VK_W]); } // double  
function HoldAction()   { sp.SendVKey(vk.F3); }                            // hold  

#### Enabled (button Down only)
#### If XButton1 is your stroke button, you can suppress the Back action with AHK v2.  
<img width="724" height="40" alt="enabled (button Down only)" src="https://github.com/user-attachments/assets/6016b3b1-c155-4c27-9105-0869430eb550" />  


Now you can assign any action to a single click and to a double click (or turn them off).  
By default, a single click sends F5 and a double click sends Ctrl+W.  
You can’t make a long gesture because it’s ‘button down only.  

> var ENABLE_SINGLE = true; &nbsp;  // single click  
var ENABLE_DOUBLE = true;  // double click  

> var GAP_MS   = 200;  // max interval between clicks for a double click  
var MOVE_PX  = 15;   // allowed mouse movement for a single click  
