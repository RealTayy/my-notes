<a id="toc"></a>
# Appframe
<div style="position:fixed;top:0;width:100%;text-align:center;z-index:1;pointer-events:none">
    <a href="#toc" style="position:relative;z-index:1;pointer-events:auto">Back to Top ↑</a>
</div>

1. [Namespaces](#namespace)
    1. [DB Objects](#namespacedb)
    2. [Win Projects](#namespacewin)
2. [Building Reports](#report)
    1. [Subreport](#subreport)
    2. [Deployment](#report-deployment)
3. [Tables](#table)
    1. [Creation](#tablecreation)

<a id="namespace"></a>

## Namespaces

<a i="namespacedb"></a>

### DB Objects

1. `Appframe > Database Objects > DB Object > Manage Namespaces`
Naming Convention:

<a i="namespacewin"></a>

### Win Projects

`Appframe > Win Projects > Tools > Manage Namespaces`  
Naming Convention: `App.[APPNAME]`

<a id="report"></a>

## Building Reports
1. \**Home Screen*\* | GOTO: `Appframe > Reports > Create New Report`  
2. \**Record Source Builder*\* | Naming Convention: `arpt_[Module](_[SubModule])_Name > OK/Create Report`
3. \**arpt_...*\* | GOTO: `Sql Datasource`
4. \**Record Source Builder*\* | SELECT: `View Name (> Unique Table Name) > check fields > OK`
5. \**arpt_...*\* | GOTO: `Tools > Insert Header & Footer`
6. \**arpt_...*\* | GOTO: `Tools > Insert Databound Table`
7. \**Insert databo...*\* | SELECT: `Select Col > OK`
8. \**arpt_...*\* | To align text in cells do this
```vbnet
Private Sub detailBand1_BeforePrint(ByVal sender As Object, ByVal e As System.Drawing.Printing.PrintEventArgs)
    cOrderIDTableCell.TextAlignment = TextAlignment.TopCenter
    cCustomerIDTableCell.TextAlignment = TextAlignment.TopCenter
    cEmployeeIDTableCell.TextAlignment = TextAlignment.TopCenter
End Sub
```
<strong style="color:red">IF YOU TRY TO EDIT THINGS VIA A DROPDOWN YOU'RE GOING TO HAVE A BAD TIME</strong>

<a id="subreport"></a>

### Subreport

1. \**Home Screen*\* | GOTO: `Appframe > Reports > Create New Report`  
2. \**Record Source Builder*\* | Naming Convention: `[name_of_parent_report]Sub`
3. \**arpt_...*\* | GOTO: `Sql Datasource`
4. Build just like you would a regular [report]()
5. \**arpt_...*\* | GOTO: `Sql Datasource`
6. \**Record Source Builder*\* | FILL: `Initial Filter: ChildField='<%ParentField%>'`
7. Save and publish Child Report
8. Go to Parent Report
9. \**artp_...*\* | ADD: `Tool Box(on the left) > Sub-Report`
10. \**artp_...*\* | RENAME: `Sub-report -> Whatever you did in step 2`

<a id="report-deployment"></a>

### Deployment

1. \**Home Screen*\* GOTO: `Appframe > Reports > arpt_... > Menu-Items`
2. Add in role domains
3. Fill out `Title, Product, Module`

### Opening up a report on VBNET
```vbnet
CR3.OpenReport("arpt_Sales_Orders", "")
'First arg is the name of report. Second arg is a filter string.
```

### Opening up a report on Web App
```vbnet
CR3.OpenReport("arpt_Sales_Orders", "")
```

<a id="table"></a>

## Tables
Tables should be created using the R4 Database Objects form, or using the stored procedure sstp_Database_CreateTable from SQL Server Management Studio.

<a id="tablecreation"></a>

### Creation
`Appframe > Database Objects > DB Object > Create New > Table...`
Do the rest in your SSMS