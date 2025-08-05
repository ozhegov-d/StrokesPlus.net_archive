
The issue arises when, for example, you need to remap Shift+1 to Shift+4.

If you simply write:
```
sp.SendModifiedVKeys([vk.LSHIFT], [vk.VK_4]);
```
you end up with “$1111” (if you don’t release Shift).  
  
    
Solution
```
var arr = v => Array.isArray(v) ? v : [v];

function sendKeys(modsOrKey, keys){
    const mods = keys === undefined ? []            : arr(modsOrKey);
    const btns = keys === undefined ? arr(modsOrKey): arr(keys);

    const pressed = mods.filter(vk => !sp.IsKeyDown(vk));
    pressed.forEach(vk => sp.SendVKeyDown(vk));      // ↓

    btns.forEach(vk => sp.SendVKey(vk));             // ↓↑

    pressed.slice().reverse()
            .forEach(vk => sp.SendVKeyUp(vk));       // ↑
}

sendKeys( [vk.LSHIFT], [vk.VK_4] );
```
