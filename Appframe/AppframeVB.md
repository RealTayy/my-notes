<a id="toc"></a>
# Appframe - Visual Basic
<div style="position:fixed;top:0;width:100%;text-align:center;z-index:1;pointer-events:none">
    <a href="#toc" style="position:relative;z-index:1;pointer-events:auto">Back to Top ↑</a>
</div>

1. [afDataObject](#afDataObject)
    1. [Auto load on launch/Refresh Data](#afDataObject-auto)
    2. [Get Col/Row value](#afDataObject-get-val)
2. [Open New Form Tab](#open-new-tab)
2. [Creating Master-Detail view](#master-detail-view)
3. [Executing Stored Procedure](#stored-procedure)
4. [Loaders](#loaders)
5. [Dialog](#dialog)


<div id="afDataObject"></div>

## afDataObject

<div id="afDataObject-auto"></div>

### Auto load on launch
```vbnet
atbv_Sales_Contacts.RefreshDataSource()
```

<a id="afDataObject-get-val"></a>

### Get val
```vbnet
aviw_Contact_ContactsRelations.CurrentRow("FieldName")
```

<a id="a#open-new-tab"></a>

## Open new Form
```vbnet
CR3.OpenForm("App.Database.ProjectName", "FormName")
```

## Events/Eventlisteners
```vbnet
Private Sub function_name(sender As Object, e As EventArgs) Handles form_element.[EVENT]
```
### List of events
1. Click
2. ItemClick
3. EditValueChanged

# Web Stuff

## Data
```html
<span
    data-object-id="dsMain"
    data-field="SomeDate"
    data-format="MM/dd/yy"
    data-if="javascriptcode"
    data-display="Col to display"
>
</span>
```

Genreate new PrimKey
`newid()`

<a id="master-detail-view"></a>

## Creating Master-Detail view
```vbnet
Private Sub Form1_Load(sender As Object, e As EventArgs) Handles Me.Load
    'Refresh afDataObjects
    atbv_Contact_Contacts.RefreshDataSource()
    atbv_Contact_Addresses.RefreshDataSource()
    atbv_Contact_PhoneNumbers.RefreshDataSource()

    'Create Empty DataSet
    Dim vDetailDataSet As New DataSet()

    'Get DataSource objects from afDataObjects and convert them to DataTable Objects
    Dim vContactDataTable = CType(atbv_Contact_Contacts.DataSource, DataTable)
    Dim vAddressDataTable = CType(atbv_Contact_Addresses.DataSource, DataTable)
    Dim vPhoneNumsDataTable = CType(atbv_Contact_PhoneNumbers.DataSource, DataTable)

    'Add DataTables to DataSet
    vDetailDataSet.Tables.Add(vContactDataTable)
    vDetailDataSet.Tables.Add(vAddressDataTable)
    vDetailDataSet.Tables.Add(vPhoneNumsDataTable)

    'Define Key Columns in Data-Tables
    Dim vMasterKeyCol As DataColumn =
        vDetailDataSet.Tables("atbv_Contact_Contacts").Columns("ContactID")
    Dim vForeignKeyColOne As DataColumn =
        vDetailDataSet.Tables("atbv_Contact_Addresses").Columns("ContactID")
    Dim vForeignKeyColTwo As DataColumn =
        vDetailDataSet.Tables("atbv_Contact_PhoneNumbers").Columns("ContactID")

    'Set up Master-detail relationship between DataTables
    vDetailDataSet.Relations.Add("Addresses", vMasterKeyCol, vForeignKeyColOne)
    vDetailDataSet.Relations.Add("Phone Numbers", vMasterKeyCol, vForeignKeyColTwo)

    'Create new afGridViews and assign them to MasterAfGrid
    Dim vAfGridViewAddresses As New afGridView(AfGrid1)
    Dim vAfGridViewPhoneNums As New afGridView(AfGrid1)
    AfGrid1.LevelTree.Nodes.Add("Addresses", vAfGridViewAddresses)
    AfGrid1.LevelTree.Nodes.Add("Phone Numbers", vAfGridViewPhoneNums)

    'Create/Populate columns for the Detail View
    vAfGridViewAddresses.PopulateColumns(vDataSet.Tables("atbv_Contact_Addresses"))
    vAfGridViewPhoneNum.PopulateColumns(vDataSet.Tables("atbv_Contact_PhoneNumbers"))

    'Hide Columns that don't need to be seen
    vAfGridViewAddresses.Columns("ContactID").VisibleIndex = -1
    vAfGridViewPhoneNum.Columns("ContactID").VisibleIndex = -1
    vAfGridViewAddresses.Columns("PrimKey").VisibleIndex = -1
    vAfGridViewPhoneNum.Columns("PrimKey").VisibleIndex = -1
    ' https://documentation.devexpress.com/WindowsForms/732/Controls-and-Libraries/Data-Grid/Master-Detail-Relationships/Working-with-Master-Detail-Relationships-in-Code#runtime_db
End Sub
```

<a id="stored-procedure"></a>

## Executing Stored Procedure
```vbnet
'Defining a stored procedure to use
Dim vAfProcedureCall As New afProcedureCall("astp_Sales_GetNameByCustomerID")
'Defining a parameter, that will be passed to a SP
vAfProcedureCall.Parameters.Add("ParameterName", atbv_Sales_Orders.CurrentRow("CustomerID")) '2nd arg is parameter value
'Executing SP and storing result
Dim vDataSet As DataSet
vDataSet = afAccessLayer.ExecProcedure(vAfProcedureCall)
'Setting a value of Name column to cCustomerNameLabel                
cCustomerNamelbl.Text = vDataSet.Tables(0).Rows(0)("Name").ToString()
```

<a id="loaders"></a>

## Loaders
Cursor
```vbnet
Public gDefaultCursor As Cursor = Me.Cursor
Me.Cursor = Cursors.WaitCursor ' Change cursor to spinning circle
'Do stuff here
Me.Cursor = gDefaultCursor
```
Loading Window
```vbnet
CR3.SetStatus("Opening Contact Details...", True, True)
'Do stuff here
CR3.ClearStatus()
```

<a id="dialog"></a>

## Dialog
Open new dialog in main form  
`MainForm.vb`
```vbnet
'Create instance of the new dlg
Dim vNewDlg As New NewDlg
'Open the dialog
vNewDlg.ShowDialog()
'If OK result was returned
If vNewDlg.DislogResult = Window.Forms.DialogResult.OK Then    
    'Do stuff if clicked OK        
End If
```

`NewDlg.vb`
```vbnet
' On click Handler for DialogResult.OK
Private Sub CCreateBtn_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cCreateBtn.Click
    'Do stuff when clicked OK
    ' THEN Return OK result of the dialog at the end
    Me.DialogResult = Windows.Forms.DialogResult.OK
    Me.Close()
End Sub

' On click Handler for DialogResult.Cancel
Private Sub CCancelBtn_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cCancelBtn.Click
    'Do stuff when clicked Cancel
    ' THEN Return Cancel result of the dialog at the end
    Me.DialogResult = Windows.Forms.DialogResult.Cancel
    Me.Close()
End Sub
```
