# mySQL notes
## Table of Contents
1. [Datatypes](#datatypes)
	1. [String data types](#stringdt)
	2. [Number data types](#numberdt)
	3. [Date data types](#datedt)
	4. [Other data types ](#otherdt)

<a name="datatypes"></a>
## Data types

<a name="stringdt"></a>
### String data types
| Data type      | Description                                    | Max size             | Storage                  |
|----------------|------------------------------------------------|----------------------|--------------------------|
| char(n)        | Fixed width chracter string. Default *n* is 1. | 8,000 characters     | Defined width            |
| varchar(n)     | Variable width character string.               | 8,000 characters     | 2 bytes + number of char |
| varchar(max)   | Variable width character string.               | 1.073 bil characters | 2 bytes + number of char |
| text           | Variable width character string.               | 2GB of text data     | 4 bytes + number of char |
| nchar(n)       | Fixed width unicode string. Default *n* is 1.  | 4,000 characters     | Defined width x 2        |
| nvarchar(n)    | Variable width unicode string.                 | 4,000 characters     |                          |
| nvarchar(max)  | Variable width unicode string.                 | 536 mil characters   |                          |
| ntext          | Variable width unicode string.                 | 2GB of text data     |                          |
| binary(n)      | Fixed width binary string.                     | 8,000 bytes          |                          |
| varbinary(n)   | Variable width binary string.                  | 8,000 bytes          |                          |
| varbinary(max) | Variable width binary string.                  | 2GB                  |                          |
| image          | Variable width binary string.                  | 2GB                  |                          |

<a name="numberdt"></a>
### Number data types
| Data type     | Description                                 | Storage    |
|---------------|---------------------------------------------|------------|
| bit           | Integer that can be 0, 1, or NULL.          |            |
| tinyint       | Whole Number 0 -to 255.                     | 1 byte     |
| smallint      | Whole Number -/+32,767.                     | 2 bytes    |
| int           | Whole Number -/+2.1 bil.                    | 4 bytes    |
| bigint        | Reall big whole number                      | 8 bytes    |
| decimal(p, s) | Fixed precision and scale numbers.          | 5-17 bytes |
| numeric(p, s) | Fixed precision and scale numbers.          | 5-17 bytes |
| smallmoney    | Monetary data -/+214,748.3647               |            |
| money         | Really big Monetary data                    |            |
| float(n)      | Really really big floating precision number |            |
| real          | Really really big floating precision number |            |

<a name="datedt"></a>
### Date data types
| Data type      | Description                                                                                                                                                                                                                         | Storage    |
|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------|
| datetime       | From January 1, 1753 to December 31, 9999 with an accuracy of 3.33   milliseconds                                                                                                                                                   | 8 bytes    |
| datetime2      | From January 1, 0001 to December 31, 9999 with an accuracy of 100   nanoseconds                                                                                                                                                     | 6-8 bytes  |
| smalldatetime  | From January 1, 1900 to June 6, 2079 with an accuracy of 1 minute                                                                                                                                                                   | 4 bytes    |
| date           | From January 1, 1900 to June 6, 2079 with an accuracy of 1 minute                                                                                                                                                                   | 3 bytes    |
| time           | Store a time only to an accuracy of 100 nanoseconds                                                                                                                                                                                 | 3-5 bytes  |
| datetimeoffset | The same as datetime2 with the addition of a time zone offset                                                                                                                                                                       | 8-10 bytes |
| timestamp      | Stores a unique number that gets   updated every time a row gets created or modified. The timestamp value is   based upon an internal clock and does not correspond to real time. Each table   may have only one timestamp variable |            |

<a name="otherdt"></a>
### Other data types
| Data type        | Description                                                                                 |
|------------------|---------------------------------------------------------------------------------------------|
| sql_variant      | Stores up to 8,000 bytes of data of various data types, except text,   ntext, and timestamp |
| uniqueidentifier | Stores a globally unique identifier (GUID)                                                  |
| xml              | Stores XML formatted data. Maximum 2GB                                                      |
| cursor           | Stores a reference to a cursor used for database operations                                 |
| table            | Stores a result-set for later processing                                                    |