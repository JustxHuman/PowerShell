# Iron-Scripter-Challenges

# Challenge #1
https://ironscripter.us/powershell-beginners-have-to-start-somewhere/

Get all files in a given folder including subfolders and display a result that shows the total number of files, the total size of all files, the average file size, the computer name, and the date when you ran the command.

This should not be written as a script or function. It should be one or two lines of PowerShell that you would type at the console to generate the desired result.

# Challenge #2
https://ironscripter.us/a-powershell-scripting-challenge-for-everyone/

- Beginner
Using your solution from the previous beginner challenge, turn this into a simple PowerShell function that will allow the user to specify the path. Your function should write the same result to the pipeline.

- Intermediate
Create a similar function as the beginner level but accept piping in a directory name. Your function only needs to process a single path. You should also include parameter validation and error handling. The output must include the path. Include comment-based help.

- Advanced
Create an advanced function that meets the Intermediate requirements. Your function should also accept parameters for remote computernames with credentials, it should accept mulitple paths, and an option to run as a background job. It would be nice if the user could specify the job name.

# Challenge #3
https://ironscripter.us/building-more-powershell/

- Beginner
Modify your function to include hidden files in your totals. You probably will need to revise your function.
Add an alias for your command. (Complete)
Format your total size value as KB. (Complete)
Add as many intermediate features as you can. (Complete)

- Intermediate
In addition to all of the beginner challenges, add the following features to your solution.

Verify that the path belongs to the file system. (Complete??)
Display a progress bar while analyzing each folder. (Come back too)
Display hidden file results in the same object but as separate properties, i.e. count and total size (Complete)
Format the average size to 2 decimal places. (Complete)
Add as many advanced features as you think you can. (Complete)

- Advanced
In addition to all the above requirements, add the following features to your function. You may decide to begin creating a module.

Add a parameter to exclude more than one file extension. (Complete)
Add a custom type extension to show total size and average in KB. (Come back too)
If you create a module, include a MAML-based external help file. (Come back too)
Create a custom formatting view that displays these properties as a table: (Used format table)
Computername
Path
Total files
Total file size in KB
Date