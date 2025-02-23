#### sp.RunProgram

//var program = 'cmd';  
var program = 'notepad';  
//var program = 'C:\\Windows\\System32\\notepad.exe';  
var programArgs = ""; // Additional command-line arguments  
var openInSingleInstance = false; // Set to false if you want to open files in separate instances  
var admin = false; // Set to true to run the program as administrator  
var openFiles = false;   
var filePaths = [  
    'C:\\test1.txt',  
    'C:\\test2.txt',  
    'C:\\test3.txt',  

