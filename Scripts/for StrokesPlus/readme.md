#### Activate / do not activate the window under the gesture (for certain scripts)  

This option must be turned off:
> Options → General → Always Activate Window Where Gesture Began  
    
> Add the following code in Global Actions → Settings → Before Action.  


#### Activate the window under the gesture ONLY for these scripts (disabled for all others)
```
var ALLOW = {  // names are case-sensitive  
    "minimize v2": 1,  
    "Center": 1,  
    "copy v2": 1,  
    "paste v2": 1,  
    "Close": 1,  
    "Max or Restore+Everything": 1,  
};

if (action && action.ActionName && ALLOW[action.ActionName]) {  
    try {  
        var w = sp.WindowFromPoint(new Point(Math.round(action.Start.X), Math.round(action.Start.Y)), true);  
        if (w && w.IsValid()) w.Activate();  
    } catch (_) {}  
}  
```
or

#### Do NOT activate the window under the gesture for these scripts (enabled for all others)
```
var SKIP = {  // names are case-sensitive
    "Play/Pause": 1,
    "Mute": 1,
    "Next Track": 1,
    "Previous Track": 1,
};

if (action && action.ActionName && !SKIP[action.ActionName]) {
    try {
        var w = sp.WindowFromPoint(new Point(Math.round(action.Start.X), Math.round(action.Start.Y)), true);
        if (w && w.IsValid()) w.Activate();
    } catch (_) {}
}
```
