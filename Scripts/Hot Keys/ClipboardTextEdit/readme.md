ctrl-c

Automatically edits clipboard text:  
replaces, adds, removes words or characters — with optional case sensitivity and space cleanup.

var findText = "123";                    // What to search for / var findText = '""'; (search for quotes)  
var addText = "456";                     // What to add  
var replaceFindText = "";                // What to replace findText with  
var removeText = "";                     // What to remove  

var addAtBeginning = false;      // Add to beginning or end of the replaced text  
var removeInsideWords = true;    // Remove parts of words?  
var removeFirstOnly = false;     // Remove only the first match?  
var ignoreCase = false;          // Ignore case when searching  
var autoRemoveSpaces = false;    // Automatically remove extra spaces after processing?456  
