
<a id="toc"></a>
# Appframe
<div style="position:fixed;top:0;width:100%;text-align:center;z-index:1;pointer-events:none">
    <a href="#toc" style="position:relative;z-index:1;pointer-events:auto">Back to Top ↑</a>
</div>

4.7 Questions to answer
=====
1.  What are the technologies Appframe is based on?
	> Microsoft SQL Server, .NET, WinForms, AJAX
	
2.  How is Appframe security implemented?
	> Database (User permissions)  
	> Web (HTTPS & SSL)  
	> Form Validation

5.6	Questions to answer
=====
1.  How to name stored procedure according to the Appframe naming convention?
	>[TableNAme]_I/U/DTrig

2.  If we should create a Contacts table and a view for it in Sales module, what would be correct names for these?
	>atbl_PC_Sales_Contacts

3.  Where and how should the business logic of the applications be saved?
	>In the database using triggers/views/functions/stored procedures

4.  How should you ensure the data integrity in the database?
	> FK relations wheever possible  
	> Rows as a unique entity in tables  
	> Set Valid values for particular columns.

5.  What are CUT and CDL table fields used for?
	> CUT: Cancels assosciated triggers. Security check still runs.  
	> CDL: Cancels Data logging

6.  What sstp_Database_... stored procedures do you think should be run periodically?
	> sstp_Database_Maintenance_RefreshAllViews  
	> sstp_Database_Maintenance_ApplyPermissions

6.6 Questions to answer
=====
1.  What permissions does a member of af_user role have?
	> Ability to execute stored procedures
	> S/I/U/D on views

2.  What is normally sviw_System_MyPermissions_CurrentDomain used for?
	> Returns all the tables the curent user has acces to in the current domain

3.  What is the role of table triggers in Appframe security?
	> Do a permissions check on the stored procedures.

6.7	T-SQL exercises
=====
1.	Create a new table using Appframe then write a T-SQL code to copy/add all missing Appframe roles with the permissions from an existing table to the new one.

    ```sql
    BEGIN TRAN
    UPDATE dbo.sviw_System_MyPermissions_CurrentDomain
        SET GrantDelete = t2.GrantDelete,
            GrantInsert = t2.GrantInsert,
            GrantUpdate = t2.GrantUpdate
        FROM
            (
            SELECT RoleID, GrantUpdate, GrantInsert, GrantDelete
                FROM dbo.sviw_System_MyPermissions_CurrentDomain
                WHERE TableName = 'atbl_Sales_Contacts'
            ) t2
        WHERE
            TableName = 'atbl_Sales_NewTable'
            AND RoleID = t2.RoleID
    COMMIT TRAN
    ```

2.	Return a list of Appframe roles, which allow a particular user to select data from a selected table using T-SQL.
    ```sql
    SELECT r.Title
        FROM stbl_System_RolesTables rt
        JOIN stbl_System_Roles r
            ON rt.RoleID = r.RoleID
        JOIN stbl_System_RolesMembers rm
            ON rt.RoleID = rm.RoleID
        WHERE
            TableName = 'atbl_Sales_NewTable' --[SELECTED TABLE]
            AND Login = 'developer@omega.no' --[PARTICLAR USER]
    ```    

# Questions I have

#### What is does A/S stand for in these naming conventions...?  
atbl	?Table  
stbl 	?Table  
ttbl	TableType  
atbv	?Current Domain Table View  
atbx	?Cross Domain Table View  
aviw	?Custom View  
arpt	?Report-Specific View  
astp	?Stored Procedure  
sstp	?Stored Procedure  
af	    Appframe  

#### What does PC stand for here?  
PC in atbl_PC_Projbaseline_WorkPacks  

## MISC NOTES/TL;DR
- Naming Conventions/Best Practices USE EM
- Use CDL field if you updating a buncha stuff to skip all the data logging
- DON'T use FLOATS (duh) Use Decimals instead. THANKS!
- USE NVARCHAR(w/ unicode) instea of VARCHAR unless you worried about size.
- dd-MMM-yyyy is the DATETIME format to go with UTC zone indication