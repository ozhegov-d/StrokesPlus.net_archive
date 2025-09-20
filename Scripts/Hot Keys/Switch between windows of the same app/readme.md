### Switch between windows of the same app

var DIR = +1;                 // +1 = next, -1 = prev  
var SORT_BY_HANDLE = true; /*  
'false' — iterate in the same order as returned by sp.AllApplications().  
Typically closer to the current z-order (the “natural” focus-switching order).  
'true'  — sort by numeric HWND. Stable and deterministic, but may not match visual order/focus.  
*/  
var ONLY_VISIBLE = true;      // true = cycle only visible windows  
var INCLUDE_MINIMIZED = false;// true = include minimized windows  
var SHOW_TOASTS = true;       // show toasts (“No other windows”, etc.)  
