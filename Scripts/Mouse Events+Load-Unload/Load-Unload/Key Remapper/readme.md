#### Key Remapper 
Can reassign Ctrl/Alt/Shift/Win  

Key remapping will not work for an application/window if that window is running as administrator (with elevated privileges). Run StrokesPlus as administrator.

**Options - Advanced - Enable Keyboard Hook Event Subscription**

The Keyboard Hook must run on a separate engine, isolated from the others.

Explanation:
For example, if you perform a gesture on Engine 1 (which hasn't finished yet) and then trigger another gesture on Engine 2, the system might lag.  
To prevent the engines from slowing down, you need to assign the Hook to the 3rd or 4th engine.  
(Note: If you are using sp.EngineList().Last in your code, you will need 4 engines in total, and you should assign the Hook to the 3rd engine).  

**Options - Script - Max Script Pool Size**

var ENGINE_INDEX = 2;  // 0=E0, 1=E1, 2=E2, 3=E3 (Max Script Pool Size=4 -> E3 is last)   

----
RULES format:  
 mods(Modifier keys) - ctlr/shift/alt/win  

  > { key: vk.X , to: null } , // block  
 { key: vk.X , to: vk.X } ,  
 { key: vk.X , to: [vk.X, vk.X ]  } ,  
 { key: vk.X, send:{ mods:[vk.X], key: vk.X } } ,  
 { key: vk.X, send:{ mods:[vk.X, vk.X], key: vk.X } } ,  
 { key: vk.X, sendKeys:"hello" } ,  

  > { mods:[vk.X, vk.X], to: null },  
 { mods:[vk.X, vk.X], key: vk.X, to: vk.X },   
 { mods:[vk.X],       key: vk.X, to: vk.X },   
 { mods:[vk.X],       key: vk.X, send:{ mods:[vk.X, vk.X], key: vk.X } },  
 { mods:[vk.X],       key: vk.X, send:{ mods:[vk.X],       key: vk.X } },  
 { mods:[vk.X],       key: vk.X, to: null },  // Block: mods+key -> nothing (disable)  
 { mods:[vk.X, vk.X], to: null },  // Block: mods-only -> nothing (disable)  

  > { app: "chrome", key: vk.X, to: vk.X }  
 { app: "chrome", rules: [ ... ] }  or  { app: ["chrome","msedge"], rules: [ ... ] }  
