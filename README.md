# Coding Demonstration - Contact Management Application
================================================

# Build steps

1. Review ContactManagementApplication-CreateDatabase.sql
   If satisfied, execute in SQL.  This will create the app's db, table, and proc.

2. Review ContactManagementApplication-CreateLogin.sql
   If satisfied, execute in SQL.  This will create the user for the web.config file.

3. Open CodingDemonstration-ContactManagementApplication.sln in Visual Studio.

4. Build the solution by selecting Build from the menu bar, then selecting the 
   Build Solution menu item.  Alternatively, you may press Ctrl+Shift+B.

5. Observe the Output window to verify the solution has built.  If you do not see 
   anything, double check that the dropdown is focused on Build.

6. You may give a trial run of the application by clicking Debug, Start Debugging.  
   Alternatively, press F5 to start this process.

7. If satisfied, Publish the application by selecting the Project header in 
   Solution Explorer.  Right clicking this area will present the Publish option.  
   I prefer to deploy to the local filesystem to a folder, do a little manual tweaking, 
   such as remove large static files, then zip the folder and move to the next region.

8. On the remote server, it would be wise to archive the existing project in place, 
   and unzip this directory into the new location.  Troubleshooting tip, sometimes 
   it is necessary to configure IIS with a virtual directory to point to this 
   new folder if this is an initial deployment.


## Integration testing:

You should be able to log in to this site using any credentials.  Notice the list of 
contacts is empty.  Add a contact and save.  The contact should show up in the list.  
Click on the contact's name to edit the contact.  Modify data, then save again and 
return to the list of contacts.  Edit the contact again, then select the Delete contact 
to toggle the IsActive flag.