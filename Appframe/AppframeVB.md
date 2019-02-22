<a id="toc"></a>
# Appframe - Visual Basic
<div style="position:fixed;top:0;width:100%;text-align:center;z-index:1;pointer-events:none">
    <a href="#toc" style="position:relative;z-index:1;pointer-events:auto">Back to Top ↑</a>
</div>

1. [afDataObject](#afDataObject)
    1. [Auto load on launch/Refresh Data](#afDataObject-auto)


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

## Permissions
### User Table Permissions
