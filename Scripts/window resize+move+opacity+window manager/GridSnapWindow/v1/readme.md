### GridSnapWindow


https://github.com/user-attachments/assets/4bf13867-0b11-4b9a-b2c9-7b564c8b1580


#### Global Actions > Mouse Events > Left Click:

//If the click event is not the Down event (so on left button up) and the grid snap is active  
if(!click.Down && sp.GetStoredBool("GridSnapActive")) {  
// Disables GridSnapWindow: removes the timer and related variables  
    sp.DeleteTimer("GridSnap");  
    sp.DeleteStoredHandle("GridSnapWindow");  
    sp.DeleteStoredBool("GridSnapActive");  
}  
