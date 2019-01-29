
<a id="toc"></a>
# Visual Basic .NET
<div style="position:fixed;top:0;width:100%;text-align:center;z-index:1">
    <a href="#toc" style="position:relative;z-index:1">Back to Top ↑</a>
</div>

1. [Data Types](#data-types)
    1. [Type Conversion](#dt-type-conversion)
2. [Variables](#variables)
3. [Enumerations](#enumerations)    
4. [Class](#class)
5. [Conditional Statements](#conditional)
    1. [If/Else](#c-if)
    2. [Select/Case](#c-select)
6. [Loops](#loops)
    1. [Do/Loop](#l-do)
    2. [For/Next](#l-for-next)
    3. [For/Each](#l-for-each)
    4. [While/End](#l-while-end)
7. [Array](#array)


<a id="data-types"></a>
## Data Types
Just use Boolean/Int/Double/Char/String bro... don't be complicated.
More info [here](https://www.tutorialspoint.com/vb.net/vb.net_data_types.htm) including things lke type conversions.

<a id="dt-type-conversion"></a>
### Type Conversion
`CBool/CChar/CDbl/CInt(val)`

<a id="variables"></a>
## Variables
```vbnet
Const varName = [VALUE]
DIM varName As [DATATYPE] = [VALUE]
DIM varOne, varTwo As [DATATYPE]
```
List of [Modifiers](https://www.tutorialspoint.com/vb.net/vb.net_modifiers.htm)

<a id="enumerations"></a>
## Enumerations
```vbnet
'Creates the Enum and assignemnts memberlist constants
Enum enumName As [DATATYPE]
    varOne = [VALUE]
    varTwo = [VALUE]
End Enum
'Using Enum variable
enumName.varOne
```
<a id="class"></a>
## Class
```vbnet
Public Class ClassName
    'Class/Instance variables/properties
    Private varOne as [DATATYPE]
    Private varTwo as [DATATYPE]

    'Public methods/subroutines
    Public Sub methodName() 'Subs are functions that don't return anything
        'method's code runs here.
    End Sub

    Public Function methodName() As [DATATYPE] 'Functions must return [DATATYPE]
        'method's code goes here.        
        methodName = [RETURNVALUE] 'This is how to return stuff *I think*
        return [RETURNVALUE] 'This is also how you would reutrn stuff *I think*
    End Function

    Shared Sub Main()
        'Shared or Static methods can be invoked without creating an object of the class.
    End Sub
End Class
```

<a id="conditional"></a>
## Conditional Statements

<a id="c-if"></a>
### If/Else
```vbnet
If ([conditional]) Then
    'Code that runs
ElseIf ([conditional])
    'More Code that runs
Else
    'More more code that runs
End If
```
Ternary
```vbnet
If([condition], returnTrue, returnFalse)
```
<a id="c-select"></a>
### Select/Case
```vbnet
Select variableName
    Case "A"
        'Stuff
    Case "B", "C"
        'More Stuff
    Case Else
        'Default Stuff
End Select
```

<a id="loops"></a>
## Loops

<a id="l-do"></a>
### Do/Loop
```vbnet
Do While|Until [conditional]    
    Continue Do 'Skips rest of code and goes to next iteration
    Exit Do 'Skips rest of code and exits loop
Loop
```

<a id="l-for-next"></a>
### For/Next
```vbnet
For i As Integer = 0 To 10 Step +1
    Continue For 'Skips rest of code and goes to next iteration
    Exit For 'Skips rest of code and exits loop
Next
```

<a id="l-for-each"></a>
### For/Each
```vbnet
For Each el In [array]
    Continue For 'Skips rest of code and goes to next iteration
    Exit For 'Skips rest of code and exits loop
Next
```

<a id="l-while-end"></a>
### While/End While
```vbnet
While [conditional]
    Continue While 'Skips rest of code and goes to next iteration
    Exit While 'Skips rest of code and exits loop
End While
```

## Array
Array
```vbnet
Dim arr(n) As [DataType] = {1, 2, ...n}
OR
Dim arr As [DataType](n) = {1, 2, ...n}

ReDim arr(n) 'Sets array length to n
```
ArrayList [[Methods]](https://www.tutorialspoint.com/vb.net/vb.net_arraylist.htm)
```vbnet
Dim myList As New List(Of Integer) From {1, 2, 3}
```


### DO NOT UNDERSTAND PLS HALP:
1. Directives? How it works and why would I use it.
2. Why do you sometimes put the counter after the Next in For loops