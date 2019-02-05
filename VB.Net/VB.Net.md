
<a id="toc"></a>
# Visual Basic .NET
<div style="position:fixed;top:0;width:100%;text-align:center;z-index:1;pointer-events:none">
    <a href="#toc" style="position:relative;z-index:1;pointer-events:auto">Back to Top ↑</a>
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
    1. [ArrayList](#arraylist)
    2. [Hashtable](#hashtable)
    3. [SortedList](#sortedlist)
    4. [Stack](#stack)
    5. [Queue](#queue)
8. [Functions](#functions)

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

<a id="array"></a>
## Array
Array
```vbnet
Dim arr(n) As [DataType] = {1, 2, ...n}
OR
Dim arr As [DataType](n) = {1, 2, ...n}

ReDim arr(n) 'Sets array length to n
```

<a id="arraylist"></a>
### ArrayList [[Methods]](https://www.tutorialspoint.com/vb.net/vb.net_arraylist.htm)
```vbnet
Dim myList As New List(Of Integer) From {1, 2, 3}
```

<a id="hashtable"></a>
### Hashtable [[Methods]](https://www.tutorialspoint.com/vb.net/vb.net_hashtable.htm)
```vbnet
Dim myHashtable As Hastable = New Hashtable()
myHashtable.add(key, value)
myHashtable(key) 'returns the key's value
```

<a id="sortedlist"></a>
Like a hashtable but has indexes
### SortedList [[Methods]](https://www.tutorialspoint.com/vb.net/vb.net_sortedlist.htm)
```vbnet
Dim mySortedList As Hastable = New Hashtable()
mySortedList.add(key, value)
mySortedList(key) 'returns the key's value
mySortedList.GetKey(n) 'returns key at index n
mySortedList.GetByIndex(n) 'returns value at index n
```

<a id="stack"></a>
### Stack [[Methods]](https://www.tutorialspoint.com/vb.net/vb.net_stack.htm)
LIFO
```vbnet
Dim myStack As Stack = New Stack()
myStack.Push(value) 'adds value to end of collection
myStack.Pop() 'remove and return value at end of collection
```

<a id="queue"></a>
### Queue [[Methods]](https://www.tutorialspoint.com/vb.net/vb.net_queue.htm)
FIFO
```vbnet
Dim myQueue As Queue = New Queue()
myQueue.Enqueue(value) 'adds value to end of collection
myQueue.Dequeue() 'remove and return value at beginning of collection
```

<a id="functions"></a>
## Functions
```vbnet
Function functionName(arg_one, ParamArray arg_arr As [DATATYPE]()) As [RETURNTYPE]
    Return [RETURNVALUE]
End Function
```


### DO NOT UNDERSTAND PLS HALP:
1. Directives? How it works and why would I use it.
2. Why do you sometimes put the counter after the Next in For loops

```vbnet
Public Class Form1
    'Form Variables
    Dim curInput As String = ""
    Dim curSign As Char = "+"
    Dim curOperation As Char = ""
    Dim leftOperand As String = ""
    Dim rightOperand As String = ""
    Dim curEquation As Stack = New Stack()

    Private Sub formLoad(sender As Object, e As EventArgs) Handles MyBase.Load
    End Sub

    'Event Listeners
    ''Mouse events
    Private Sub inputClick(sender As Object, e As EventArgs) Handles BtnOne.Click, BtnTwo.Click, BtnZero.Click, BtnThree.Click, BtnSix.Click, BtnSign.Click, BtnSeven.Click, BtnNine.Click, BtnFour.Click, BtnFive.Click, BtnEight.Click, BtnDecimal.Click, BtnClearEntry.Click, BtnBackspace.Click
        inputHandler(sender.tag)
    End Sub

    Private Sub operationClick(sender As Object, e As EventArgs) Handles ButtonFraction.Click, BtnSquareRoot.Click, BtnPlus.Click, BtnMultiply.Click, BtnMinus.Click, BtnExponent.Click, BtnDivide.Click
        operationHandler(sender.tag)
    End Sub

    Private Sub calculateClick(sender As Object, e As EventArgs) Handles BtnEqual.Click
        calculateHandler()
    End Sub

    Private Sub onOffClick(sender As Object, e As EventArgs) Handles BtnOnOff.Click
        Console.WriteLine(sender.tag)
    End Sub

    Private Sub clearClick(sender As Object, e As EventArgs) Handles BtnClear.Click
        resetAll()
    End Sub

    ''Keyboard events


    'Event Handlers
    Private Sub inputHandler(inputCode)
        Select Case inputCode
            Case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
                curInput += inputCode
            Case "sign"
                curSign = If((curSign = "+"), "-", "+")
            Case "decimal"
                curInput += If((curInput = ""), "0.", ".")
            Case "backspace"
                If (curInput <> "") Then curInput = curInput.Substring(0, curInput.Length - 1)
            Case "ce"
                resetCurrentEntry()
                Exit Sub
            Case Else
                Throw New Exception("You have fked up bruh: Unrecognized inputCode")
        End Select
        updateDisplay()
    End Sub

    Private Sub calculateHandler()
        ' clear shit out
        Dim Result As Double = performCalculation()
        addHistory("aasdffsdfsd", "asdf")
        resetAll()

    End Sub

    Private Sub operationHandler(inputCode)
        If (curInput = "") Then 'If there is not curInput            
            'And it is a completly new start
            If (leftOperand = "" And curEquation.ToArray.Length = 0) Then
                curEquation.Push("0")
                leftOperand = "0"
            End If
            'Change the current operation
            curOperation = inputCode 'DRY ID:1        
        Else 'If there is a curInput
            'If it's the first "entry"
            If (leftOperand = "") Then
                curEquation.Push(curInput)
                leftOperand = curInput
            Else
                curEquation.Push(curOperation)
                curEquation.Push(curInput)
                leftOperand = performCalculation()
            End If
            curOperation = inputCode
            resetCurrentEntry()
        End If
        updateDisplay()
        updateEquationDisplay()
    End Sub

    Private Sub updateDisplay()
        Console.WriteLine("-----")
        Console.WriteLine($"cur: {curSign + curInput}")
        Console.WriteLine($"lef: {leftOperand}")
        Console.WriteLine($"rig: {rightOperand}")
        Console.WriteLine($"ope: {curOperation}")
        Console.WriteLine($"cha: {curEquation}")
        CurrentInput.Text = If((curInput = ""),
            If(leftOperand = "", "0", leftOperand),
            If(curSign = "-", "-", "") + curInput)
    End Sub

    Private Function performCalculation()
        Select Case curOperation
            Case "+"
                Return CStr(CDbl(leftOperand) + CDbl(curInput))
            Case "-"
                Return CStr(CDbl(leftOperand) - CDbl(curInput))
            Case "*"
                Return CStr(CDbl(leftOperand) * CDbl(curInput))
            Case "/"
                Return CStr(CDbl(leftOperand) / CDbl(curInput))
            Case Else
                Throw New Exception("You have fked up bruh: Unrecognized inputCode")
        End Select
    End Function

    Private Sub updateEquationDisplay()
        Dim displayStr = ""
        For Each el In curEquation.ToArray()
            Console.WriteLine(el)
            displayStr = el + " " + displayStr
        Next
        CurrentEquation.Text = (displayStr + curOperation).Trim()
    End Sub

    Private Sub addHistory(equation, result)
        Dim resBox As New TextBox
        resBox.Dock = DockStyle.Top
        resBox.TextAlign = HorizontalAlignment.Right
        resBox.BackColor = HistoryDisplay.BackColor
        resBox.BorderStyle = BorderStyle.None
        resBox.Enabled = False
        resBox.Font = New Font("Sergoe UI", 18, FontStyle.Bold)
        resBox.Text = result
        HistoryDisplay.Controls.Add(resBox)
        Dim eqBox As New TextBox
        eqBox.Dock = DockStyle.Top
        eqBox.TextAlign = HorizontalAlignment.Right
        eqBox.BackColor = HistoryDisplay.BackColor
        eqBox.BorderStyle = BorderStyle.None
        eqBox.Enabled = False
        eqBox.Font = New Font("Sergoe UI", 10)
        eqBox.Text = equation + " ="
        HistoryDisplay.Controls.Add(eqBox)
    End Sub

    Private Sub resetCurrentEntry()
        curInput = ""
        curSign = "+"
        CurrentInput.Text = "0"
    End Sub

    Private Sub resetAll()
        curSign = "+"
        curInput = ""
        curEquation.Clear()
        leftOperand = ""
        rightOperand = ""
        CurrentInput.Text = "0"
        CurrentEquation.Text = ""
    End Sub

End Class

```