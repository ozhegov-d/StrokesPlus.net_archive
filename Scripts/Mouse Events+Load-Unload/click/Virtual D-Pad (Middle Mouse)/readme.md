#### Virtual D-Pad (Middle Mouse)

https://github.com/user-attachments/assets/9af5c3f3-5077-4854-8490-122b249dc07d


✅ Consume Click Event (but the middle click will still work)  

default made to MouseButtons.Middle  
```js
} else if (!click.Down) {   
        sp.MouseClick(click.Point, MouseButtons.Middle, true, true);  // MouseButtons.XButton1 , MouseButtons.XButton2  
    }
```
