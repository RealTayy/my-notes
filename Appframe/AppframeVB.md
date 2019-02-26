<a id="toc"></a>
# Appframe - Visual Basic
<div style="position:fixed;top:0;width:100%;text-align:center;z-index:1;pointer-events:none">
    <a href="#toc" style="position:relative;z-index:1;pointer-events:auto">Back to Top ↑</a>
</div>

1. [afDataObject](#afDataObject)
    1. [Auto load on launch/Refresh Data](#afDataObject-auto)
2. [Creating Master-Detail view](#master-detail-view)


<div id="afDataObject"></div>

## afDataObject

<div id="afDataObject-auto"></div>

### Auto load on launch
```vbnet
atbv_Sales_Contacts.RefreshDataSource()
```

### Open Form onClick
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

    'Create Empty DataSet
    Dim vDetailDataSet As New DataSet()

    'Extract DataSource objects from afDataObjects and convert them to DataTable Objects
    Dim vContactDataTable = CType(atbv_Contact_Contacts.DataSource, DataTable)
    Dim vAddressDataTable = CType(atbv_Contact_Addresses.DataSource, DataTable)

    'Add DataTables to DataSet
    vDetailDataSet.Tables.Add(vContactDataTable)
    vDetailDataSet.Tables.Add(vAddressDataTable)

    'Set up Master-detail relationship between DataTables
    Dim vMasterKeyCol As DataColumn = vDetailDataSet.Tables("atbv_Contact_Contacts").Columns("ContactID")
    Dim vForeignKeyCol As DataColumn = vDetailDataSet.Tables("atbv_Contact_Addresses").Columns("ContactID")
    vDetailDataSet.Relations.Add("Addresses", vMasterKeyCol, vForeignKeyCol)

    'Bind afGrid to DataSet's primary/master table        
    AfGrid1.DataSource = vDetailDataSet.Tables("atbv_Contact_Contacts")

End Sub
```