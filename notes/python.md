# Python
Sources:  
[Introduction To Python Programming](https://www.udemy.com/course/pythonforbeginnersintro/)
## Variables
---
Store data in memory for later access
e.g. `var = <data>`
supports multiple assignment
e.g. `a, b, c = 1, 2, 3`

## Operators
---
`+` addition  
`-` subtraction  
`*` multiplication  
`/` division  
`%` modulus  

e.g.
```  
>>> a = 2
>>> b = 3
>>> a + b
5
>>> a - b
-1
>>> a * b
6
>>> a / b
0.66666
>>> a % b
2
```
*Note: in python console, `>>>` denotes user input line and console output is on a line without `>>>` as shown above.*

## Strings
---
Text contained within quotation marks.  
e.g. `str1 = "This is a string"`

**Concatination** is the combination of strings via addition. Concatination uses the `+` to "add" different strings together.  
e.g.
```
>>> firstname = "John"
>>> lastname = "Smith"
>>> firstname + " " + lastname
'John Smith'
```

*Note: Strings can also be multiplied by integers.*  
e.g. 
```
>>> firstname * 3
'JohnJohnJohn'
```
*Note: String characters are indexed similar to an array.*  
e.g.
```
>>> sentence = "Nice weather we are having today."
>>> sentence[0]
'N'
```
This is called string **splicing**. Index ranges are denoted with `:` as in `sentence[0:5]`. The final index does not include that character but rather indicates the left-sided end. 

**Placeholders** are placed within strings to act as a value that has yet to be defined but has a known type.  
e.g. `sentence = "My name is %s"`  
Here there `%s` is acting as a placeholder for a string. To have something inserted into the placeholder, the variable is to be called in placeholder syntax.  
e.g. 
```
>>> sentence = "My name is %s"
>>> sentence%(John)
'My name is John'
```
*Note: placeholder syntax supports multiple values seperated by commas as well as predefined variables.*

Placeholder list:  
`%s` strings  
`%d` integers

## Lists
---
A mutable indexed container for an array of data entries.  
e.g. `list = [x, b, c, d]`  
Mutable means entries can be edited.  
Given our list defined above, we can    
**Append:**
```
>>> list.append(e, f, g)
>>> list
[x, b, c, d, e, f, g]
```
**Update:**
```
>>> list[0] = a
>>> list
[a, b, c, d, e, f, g]
```
**Delete:**
```
>>> del list[3]
>>> list
[a, b, c, e, f, g]
```
**Find length:**
```
>>> len(list)
6
```
For number lists like `nums = [1, 3, 5, 7, 9]`, we can find   
**Maximum:**
```
>>> max(nums)
9
```
**Minimum:**
```
>>> min(nums)
1
```
Many other functions and operations exist for lists. 

## Dictionaries
---
Dictionaries are another type of data structure that hold keys and values for data.  
e.g. `contacts = {"Steve":4653215655, "Sarah":8446831987}`  
Accessing elements in a dictionary is similar to lists but instead of returning the value on an entered index, it will return the value on an entered key.  
e.g.
```
>>> contacts["Sarah"]
8446831987
```
*Note: Dictionaries should **not** contain duplicate keys. Python will return the value corresponding only to the last key duplicate key defined and will not recognize others.*  

## Tuples
---
Immutable lists  
e.g. `tuple = ('red', 'green', 'blue')`
Tuple values cannot be updated, or deleted once it is created and the tuple cannot be appended to. They do support certain operations, **concatenation**, and **splicing**.

## Conditional Statements
---
A statement that relies on a condition to be met in order for it to function.  
**if/else statements:**  
e.g.
```
>>> if (a > b):
***     print("a is greater than b")
*** else:
***     print("a is not greater than b")
```
*Note: `a > b` in the example above is a **conditional statement** which must evaluate to either **true** or **false** in order for the statement to function.*

**Relational operators:**  
`>` greater than  
`<` less than  
`>=` greater than or equal to  
`<=` less than or equal to
`==` equals  
`!=` does not equal  

*Note: conditional statements can support multiple conditions with the `and` and `or` operators.*

e.g.
```
>>> if (a > b and c > d):
***     print("a is greater than b AND c is greater than d)
*** elif (a > b or c > d):
***     print("a is greater than b OR c is greater than d)
*** else:
*** 	print("a is not greater than b and c is not greater than d)
```
*Note: the `elif` line above is short for else if which continues the if/else statement with another intermediate condition.*