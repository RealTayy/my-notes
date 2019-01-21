# mySQL notes
## Table of Contents
1. [Datatypes](#datatypes)
	1. [String data types](#stringdt)
	2. [Number data types](#numberdt)
	3. [Date data types](#datedt)
	4. [Other data types ](#otherdt)
2. [Properties/Constraints](#procon)
	1. [Common Properties](#properties)
	2. [Constraints](#constraints)
3. [Select](#select)
4. [Where](#where)
   1. [Operators/Conditions](#woperators)
5. [Order By](#orderby)
6. [Modifying Records](#modify)
   1. [INSERT](#insert)
   2. [UPDATE](#update)
   3. [DELETE](#delete)

<a name="datatypes"></a>
## Data types

<a name="stringdt"></a>
### String data types
| Data type          | Description                                    | Max size             | Storage                  |
|--------------------|------------------------------------------------|----------------------|--------------------------|
| **char(n)**        | Fixed width chracter string. Default *n* is 1. | 8,000 characters     | Defined width            |
| **varchar(n)**     | Variable width character string.               | 8,000 characters     | 2 bytes + number of char |
| **varchar(max)**   | Variable width character string.               | 1.073 bil characters | 2 bytes + number of char |
| **text**           | Variable width character string.               | 2GB of text data     | 4 bytes + number of char |
| **nchar(n)**       | Fixed width unicode string. Default *n* is 1.  | 4,000 characters     | Defined width x 2        |
| **nvarchar(n)**    | Variable width unicode string.                 | 4,000 characters     |                          |
| **nvarchar(max)**  | Variable width unicode string.                 | 536 mil characters   |                          |
| **ntext**          | Variable width unicode string.                 | 2GB of text data     |                          |
| **binary(n)**      | Fixed width binary string.                     | 8,000 bytes          |                          |
| **varbinary(n)**   | Variable width binary string.                  | 8,000 bytes          |                          |
| **varbinary(max)** | Variable width binary string.                  | 2GB                  |                          |
| **image**          | Variable width binary string.                  | 2GB                  |                          |

<a name="numberdt"></a>
### Number data types
| Data type         | Description                                 | Storage    |
|-------------------|---------------------------------------------|------------|
| **bit**           | Integer that can be 0, 1, or NULL.          |            |
| **tinyint**       | Whole Number 0 -to 255.                     | 1 byte     |
| **smallint**      | Whole Number -/+32,767.                     | 2 bytes    |
| **int**           | Whole Number -/+2.1 bil.                    | 4 bytes    |
| **bigint**        | Reall big whole number                      | 8 bytes    |
| **decimal(p, s)** | Fixed precision and scale numbers.          | 5-17 bytes |
| **numeric(p, s)** | Fixed precision and scale numbers.          | 5-17 bytes |
| **smallmoney**    | Monetary data -/+214,748.3647               |            |
| **money**         | Really big Monetary data                    |            |
| **float(n)**      | Really really big floating precision number |            |
| **real**          | Really really big floating precision number |            |

<a name="datedt"></a>
### Date data types
| Data type          | Description                                                                                                                                                                                                                         | Storage    |
|--------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------|
| **datetime**       | From January 1, 1753 to December 31, 9999 with an accuracy of 3.33   milliseconds                                                                                                                                                   | 8 bytes    |
| **datetime2**      | From January 1, 0001 to December 31, 9999 with an accuracy of 100   nanoseconds                                                                                                                                                     | 6-8 bytes  |
| **smalldatetime**  | From January 1, 1900 to June 6, 2079 with an accuracy of 1 minute                                                                                                                                                                   | 4 bytes    |
| **date**           | From January 1, 1900 to June 6, 2079 with an accuracy of 1 minute                                                                                                                                                                   | 3 bytes    |
| **time**           | Store a time only to an accuracy of 100 nanoseconds                                                                                                                                                                                 | 3-5 bytes  |
| **datetimeoffset** | The same as datetime2 with the addition of a time zone offset                                                                                                                                                                       | 8-10 bytes |
| **timestamp**      | Stores a unique number that gets   updated every time a row gets created or modified. The timestamp value is   based upon an internal clock and does not correspond to real time. Each table   may have only one timestamp variable |            |

<a name="otherdt"></a>
### Other data types
| Data type            | Description                                                                                 |
|----------------------|---------------------------------------------------------------------------------------------|
| **sql_variant**      | Stores up to 8,000 bytes of data of various data types, except text,   ntext, and timestamp |
| **uniqueidentifier** | Stores a globally unique identifier (GUID)                                                  |
| **xml**              | Stores XML formatted data. Maximum 2GB                                                      |
| **cursor**           | Stores a reference to a cursor used for database operations                                 |
| **table**            | Stores a result-set for later processing                                                    |

<a name="procon"></a>
## Properties/Constraints

<a name="properties"></a>
### Common Properties
| Property Name      | Description                                                                            |
|--------------------|----------------------------------------------------------------------------------------|
| **Identity(s, i)** | Create auto incrementing column for table. *s* is the seed and *i* is the   increment. |

<a name="constraints"></a>
### Constraints
| Constraint Name     | Description                                                                                                                                          |
|---------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| **NOT NULL**        | Forces you to provide a valid NOT NULL value in INSERT and UPDATE   statements.                                                                      |
| **UNIQUE**          | Ensures no duplicate values are inserted into a column                                                                                               |
| **PRIMARY KEY**     | Cannot accept NULL value and must be UNIQUE.                                                                                                         |
| **FOREIGN KEY**     | Requires value reference to parent table. `FOREIGN KEY REFERENCES   parent_table(parent_table_column)`                                               |
| **CHECK**           | Limits range of values that can be inserted. `col_name INT CHECK   (col_name >= 0)` OR `CONSTRAINT CHK_col CHECK (col_one > 0 AND col_two   = 'ex')` |
| **DEFAULT**         | Provide default column value if no value specified. `col_name DATETIME   DEFAULT GETDATE()`                                                          |

<a name="select"></a>
## Select
The SELECT statement is used to select and returns data from a DB in a result table(result-set)

#### Single Column
```SQL
SELECT col_1 FROM table_1 -- returns all of col_1 from table_1
```
#### Multiple Columns
```SQL
SELECT col_1, col_2 FROM table_1 -- returns all of col_1 and col_2 from table_1
```
#### All Columns
```SQL
SELECT * FROM table_1 -- returns all columns from table_1
```
#### Distinct Columns
```SQL
SELECT DISTINCT col_1 FROM table_1 -- returns columns with distinct/different values from table 1
```

<a name="update"></a>
#### Update
UPDATE is used to modify the existing records in a table.

**IMPORTANT!** If you use UPDATE without using WHERE you are going to have a BAD TIME.
```SQL
UPDATE table_name
SET col1 = val1, col2 = val2, col3 = val3
WHERE condition
```

<a name="delete"></a>
#### Delete
DELETE is used to delete existing records in a table. Duh.
```
DELETE FROM table_name
WHERE condition
```

**IMPORTANT!** If you use DELETE without using WHERE you are going to have a BAD TIME.
```SQL

```
<a name="where"></a>
## Where
WHERE is used to filter and extract records the fulfilll a specified condition.
```SQL
SELECT * FROM table_name
WHERE condition;
```

<a name="woperators"></a>
#### Operators/Condition
| Operator Name | Description                                                                                        | Example                                                                                                                                                                              |
|---------------|----------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| =             | Equal                                                                                              |                                                                                                                                                                                      |
| <>            | Not Equal. Can also use `!=`                                                                       |                                                                                                                                                                                      |
| >             | Greater than                                                                                       |                                                                                                                                                                                      |
| <             | Less than                                                                                          |                                                                                                                                                                                      |
| >=            | Greater than or equal                                                                              |                                                                                                                                                                                      |
| <=            | Less than or equal                                                                                 |                                                                                                                                                                                      |
| BETWEEN       | Between a certain range                                                                            | `WHERE col_name BETWEEN val_one AND val_two`                                                                                                                                         |
| LIKE          | Search for a pattern. % and _ are wildcards. `%` is like `+` In   regex(0/1/1+).  `_` is like `.`. | `WHERE col_name LIKE 'a%' Returns all vales that start with a.`                                                                                                                      |
| IN            | To specify multiple possible values for a column                                                   | `WHERE col_name IN (val1, val2, val3)`    returns results where col_name is equal to one of the vals. You can   also pass in a `(SELECT statement)` instead of` (val1, val2, val3)`. |
| AND           | Returns record if all conditions separated by AND is true                                          | `WHERE condition1 AND condition2`                                                                                                                                                    |
| OR            | Return record if any of conditions separated by OR is true                                         | `WHERE condition1 OR condition2`                                                                                                                                                     |
| NOT           | Displays record if conditions is false                                                             | `WHERE NOT condition1`                                                                                                                                                               |

<a name="orderby"></a>
## Order By
Used to sort result-set in ascending or descending order
```SQL
SELECT col_one FROM table_name
ORDER BY col_one, col_two ASC|DESC;
```
```SQL
SELECT col_one FROM table_name
ORDER BY col_one ASC, col_two DESC;
```

<a name="insert"></a>
## Insert
Inserts records into a table. Duh.
```SQL
INSERT INTO table_name (
	col_one,
	col_two,
	col_three
)
VALUES
	(val1_1, val1_2, val1_3),
	(val2_1, val2_2, val2_3),
```

<a name="update></a>
## Update
Updates existing records in a table. Duh.
```SQL

```

#### Things to look into:
- GO/Batch termination
- Transactions
- Rollbacks
- ALTER
- UPDATE
- FOREIGN KEYS > ON UPDATE/DELETE > CASCADE/NO ACTION/SET NULL/SET DEFAULT
- Stored procedures
- Triggers
- Functions
- GETDATE()

https://www.sqlshack.com/commonly-used-sql-server-constraints-not-null-unique-primary-key/