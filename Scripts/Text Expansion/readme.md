
#### Today date

```
var d = new Date();
sp.SendString(`${d.getFullYear()}-${("0"+(d.getMonth()+1)).slice(-2)}-${("0"+d.getDate()).slice(-2)} `
                     + `${("0"+d.getHours()).slice(-2)}:${("0"+d.getMinutes()).slice(-2)}`);
```
Output:  
2023-12-03 19:14  
