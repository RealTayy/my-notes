
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
	>[TableName]_I/U/DTrig

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
GO
```    

7.6	Exercise: Creating complex view
=====
We have to create a complex aviw_Sales_OrdersLinesProducts view that will be used in the master-detail form.

This view must retrieve data both from atbv_Sales_OrdersLines and atbv_Sales_Products views. Join those views on Domain and ProductID fields. Set "TotalQuantity" as an alias for Quantity field.
```sql
CREATE OR ALTER VIEW aviw_Sales_OrdersLinesProducts AS
SELECT p.Domain, ol.ProductID, ol.Amount, p.ProductName, p.Supplier, p.Quantity TotalQuantity, ol.PrimKey, ol.Created, ol.CreatedBy, ol.Updated, ol.UpdatedBy
    FROM atbv_Sales_OrdersLines ol
    JOIN atbv_Sales_Products p
        ON ol.Domain = p.Domain
        AND ol.ProductID = p.ProductID
GO
```

7.9	Exercise: Writing a Stored Procedure
=====
For the sake of exercise we will write a SQL Server stored procedure (SP) for further use. This SP should take CustomerID as a parameter and return Name value from atbv_Sales_Contacts, where ContactID field is the same as CustomerID parameter.

```sql
/*
    Parameters:	@CustomerID - ID to match ContactID by
    Return:     Returns Customer's name (STRING)
    Updated:	02.12.2019 -- Initial creation
    Function:	Recieves a Name where @CustomerID matches ContactID
                from the atbv_Sales_Contacts table
*/
CREATE PROCEDURE astp_Sales_Contacts_GetNameFromID @CustomerID int
AS
BEGIN	
    SELECT Name
    FROM atbv_Sales_Contacts
    WHERE ContactID = @CustomerID
END
GO
```

7.11	Exercise: Finishing up the Orders form
=====
Make another label to show Employee Name near Manager control. Don't forget you need another stored procedure for that. Add the same functionality, as discussed above, for Manager field (cEmployeeID).

MSSQL Code:
```sql
/*
    Parameters:	@EmployeeID - ID to match EmployeeID by
    Return:     Returns Employee's name (STRING)
    Updated:	02.12.2019 -- Initial creation
    Function:	Recieves a Name where @EmployeeID matches
                EmployeeID from the atbv_Sales_Employees table
*/
CREATE OR ALTER PROCEDURE astp_Sales_GetNameByEmployeeID @EmployeeID nvarchar(20)
AS
BEGIN	
    SELECT Name
    FROM atbv_Sales_Employees
    WHERE EmployeeID = @EmployeeID
END
GO
```

VBNET Code:
```vbnet
Private Sub GetManagerName() Handles cEmployeeID.EditValueChanged
    'Checking if cEmployeeEmail has some value
    If Not String.IsNullOrEmpty(Me.cEmployeeID.Text) Then
        Try
            Dim vDataSet As DataSet
            'Defining a stored procedure to use
            Dim vAfProcedureCall As New afProcedureCall("astp_Sales_GetNameByEmployeeID")
            'Defining a parameter, that will be passed to a SP
            vAfProcedureCall.Parameters.Add("EmployeeID", atbv_Sales_Orders.CurrentRow("EmployeeID"))
            'Executing SP and getting result
            vDataSet = afAccessLayer.ExecProcedure(vAfProcedureCall)
            'Setting a value of Name column to cEmployeeNameLabel                
            cEmployeeNameLabel.Text = vDataSet.Tables(0).Rows(0)("Name").ToString()
        Catch ex As Exception
            'Error handling section 
            CR3.HandleException(ex)
        End Try
    Else
        'If cEmployeeID has no value, set empty label text
        cEmployeeNameLabel.Text = ""
    End If
End Sub
```
Create a stored procedure for deleting selected order and its order lines. Do not forget, that you need to delete order lines (if exist) before you are able to delete an order.
```sql
/*
    Parameters:	@OrderID -- OrderID of rows to delete from
    Return:     Returns NULL
    Updated:	02.12.2019 -- Initial creation
    Function:	Deletes rows associated where OrderID = @OrderID in
                atbl_Sales_OrdersLines & atbl_Sales_Orders tables
*/
CREATE OR ALTER PROCEDURE astp_Sales_Order_DeleteRowByOrderID @OrderID int
AS
BEGIN
    DELETE FROM atbl_Sales_OrdersLines
    WHERE OrderID = @OrderID
    DELETE FROM atbl_Sales_Orders
    WHERE OrderID = @OrderID
END
GO
```
Create a toolbar button Delete Selected Order to call a stored procedure.
```vbnet
Private Sub CDeleteOrderBtn_ItemClick(sender As Object, e As DevExpress.XtraBars.ItemClickEventArgs) Handles cDeleteOrderBtn.ItemClick
    Try
        'Defining a stored procedure to use
        Dim vAfProcedureCall As New afProcedureCall("astp_Sales_Order_DeleteRowByOrderID")
        'Defining a parameter, that will be passed to a SP
        vAfProcedureCall.Parameters.Add("OrderID", atbv_Sales_Orders.CurrentRow("OrderID"))
        'Executing SP
        afAccessLayer.ExecProcedure(vAfProcedureCall)
        'Refreshing related DataObjects
        atbv_Sales_Orders.RefreshDataSource()
        aviw_Sales_OrdersLinesProducts.RefreshDataSource()
    Catch ex As Exception
        'Error handling section 
        CR3.HandleException(ex)
    End Try
End Sub
```

Create a check constraint for order lines Amount column to not let users save negative values in Amount column.

```sql
ALTER TABLE atbl_Sales_OrdersLines
ADD CONSTRAINT CK_atbl_Sales_OrdersLines_Amount CHECK (Amount >= 0)
```
Using grid designer add a grid-footer with a sum of all the order lines for an Amount column. Also raise LayoutVersion for changes to apply in winclient when the form will be published.

![Yay](https://i.gyazo.com/704b6e0df8fedb2e96c3f65c4fa5535a.png)

Edit existing Insert and Update triggers for atbl_Sales_OrdersLines table. When you insert or update an order-line from Orders form, the trigger should check if the specified value is less or equal to the amount of the remaining items in the warehouse. If the value you are trying to save is greater than available items amount, the transaction must be rolled back and a user must get an error message. Error message must include the name of the Item, which could not be inserted.

7.14	Exercise: Managing triggers
=====
```sql
-- Custom trigger logic: ----------------------------------------------[customizable]--

    /* Create temp table to store names of Products that are understocked */
    DECLARE @UnderstockedProducts TABLE (ProductName VARCHAR(128))

    /* Insert names of Products where TotalAmount[Ordered] > Quantity[Stocked] into @UnderstockedProducts */
    INSERT INTO @UnderstockedProducts
    SELECT sp.ProductName
        FROM (
            SELECT ProductID, SUM(Amount) TotalAmount
                FROM inserted i
                GROUP BY ProductID) tbl
    JOIN atbv_Sales_Products sp
        ON tbl.ProductID = sp.ProductID
    WHERE TotalAmount > Quantity

    /* If there is Understocked products return an error and rollback transaction */
    IF EXISTS (SELECT ProductName FROM @UnderstockedProducts)
    BEGIN
        /* Create and concatinated string of all understocked products */
        DECLARE @ProductNames VARCHAR(MAX)
        SELECT @ProductNames = CONCAT_WS(', ',@ProductNames, ProductName)
            FROM @UnderstockedProducts
        DECLARE @ErrorMsg VARCHAR(MAX) = CONCAT('---- There is not enough items (', @ProductNames,') left ----')
        RAISERROR (@ErrorMsg, 9, 1) ROLLBACK TRANSACTION
        RETURN
    END
```

8.5	Exercise: Creating a new Products Register application
=====
Using Contact register app as an example, Appframe Web Documentation and online resources create a new application called Products Register. This application has to contain:  
- Editable Table Grid (with insert, update, delete functions) of all products which are not out of stock at the moment;  
- Standard search functionality;  
- Distinct Filtering on Supplier column;  

```html
<!-- Main HTML -->
<!--Padding to space from the navbar-->
<div class="pt-5"></div>
<div id="registerGridView" class="collapse show pt-1">
    <div data-object-id="dsMain">
        @Render("Block", ID: "blockGridView")
    </div>
</div>

<!--blockGridView-->
<div data-object-id='dsMain' class="row">
    
</div>
<table data-grid2 class="table table-hover" id="gridMain" data-object-id="dsMain" data-layout-version="1" data-item-info-text="Products" data-header="Products" data-resize>
    <thead>
        <tr>
            <th style="width:28px;" data-gridcolumn-chooser="#gridMain"></th>
            <th style="width:200px;" data-sort-by="ProductName" title="Product name">Product name</th>
            <th style="width:80px;" data-sort-by="Quantity" title="Quantity ">Quantity </th>
            <th style="width:200px;" data-sort-by="Supplier" title="Supplier ">Supplier </th>
            <th style="width:200px;" data-sort-by="Domain" title="Domain ">Domain </th>
            <th style="width:28px"></th>
        </tr>
        <tr>
            <td></td>
            <td data-field-filter2="ProductName"></td>
            <td data-field-filter2="Quantity"></td>
            <td data-field-filter2="Supplier"></td>
            <td data-field-filter2="Domain"></td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <tr data-repeat data-show-new>
            <td data-selection-cell></td>
            <td><input data-field="ProductName" ></td>
            <td><input data-field="Quantity" ></td>
            <td><input data-field="Supplier" ></td>
            <td><input data-field="Domain" ></td>
            <td data-action-cell></td>
        </tr>
    </tbody>
</table>
```
```javascript
/* Main Script.js */
(function(scope, undef) {
    //Strict mode makes it easier to write "secure" JavaScript, that why main initial function is written in strict mode
    "use strict";
    let w = scope.window,
        d = w.document,
        af = w.af,
        pageFirstLoad = true;

    w.pageFirstLoad = pageFirstLoad;
    
    function clickEvents(){
        //this function is for defining dom elements click events
    }
	
    function handleEvents(){
        //this function is for defining data source(s) events
    }
	
    function applyUserSettings(){
            //this function is for defining view from browser local storage and set it up
        if (getLocalStorageMetaData()) {
            if(getLocalStorageMetaData().ViewMode == "List" || af.common.isMobile()){
                changeToListView();
            } else {
                changeToGridView();
            }
        } 
    }

	function initialize() {
	//Main initialize function to load main data source and call required functions
	    applyUserSettings();
		dsMain.refreshDataSource();
	
        clickEvents();
        handleEvents();
        // Initializes Main Grid
        initMainGrid()
		
		pageFirstLoad = false;
	}
	
	// This code is for calling initialize function
	$(function(){
    	initialize();
    });

}(this));

/* functionSpecific.js */
// function for handling date format
function formatLocalDate(date) {
    if (isNaN(Date.parse(date))) {return date;}
    if (date === null) {return '';}
    return formatDateToLocalCulture(date); //
}

//function for updating browser local storage Meta Data
function updateLocalStorageMetaData(pViewMode, pLeftSideBar, pRightSideBar){
    af.common.localStorage.set(af.article.id, {ViewMode: pViewMode, LeftSideBar: pLeftSideBar, RightSideBar: pRightSideBar}, false);
}

//function for geting local storage Meta Data
function getLocalStorageMetaData(){
    return af.common.localStorage.get(af.article.id);
}

//function for adding contact-details link to dom element
function escapeHref(pRow, pElement) {
    //pRow current Data source row
    var vItem = ((pElement !== null) ? $(pElement) : $(this));
    window.requestAnimationFrame(function(){
        $(vItem).attr('href', 'contacts-details?ContactID=' + encodeURIComponent(pRow.ContactID));
    });
}
```

## MISC NOTES/TL;DR
- Naming Conventions/Best Practices USE EM
- Use CDL field if you updating a buncha stuff to skip all the data logging
- DON'T use FLOATS (duh) Use Decimals instead. THANKS!
- USE NVARCHAR(w/ unicode) instea of VARCHAR unless you worried about size.
- dd-MMM-yyyy is the DATETIME format to go with UTC zone indication