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
A mutable indexed data structure for an array of data entries.  
e.g. `list = ['x', 'b', 'c', 'd']`  
Mutable means entries can be edited.  
Given our list defined above, we can    
**Append:**
```
>>> list.append('e', 'f', 'g')
>>> list
['x', 'b', 'c', 'd', 'e', 'f', 'g']
```
**Update:**
```
>>> list[0] = 'a'
>>> list
['a', 'b', 'c', 'd', 'e', 'f', 'g']
```
**Delete:**
```
>>> del list[3]
>>> list
['a', 'b', 'c', 'e', 'f', 'g']
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

## For Loops
---
A loop used for iterating over items within a specific list.  
e.g. 
```
>>> list = ['a', 'b', 'c', 'd']
>>> for item in list:
*** 	print(item)
***
a
b
c
d
```
*Note: for loops can also be used with a range function to iterate through a range of integers.*  
e.g. 
```
>>> for i in range(0,5)
*** 	print(i)
***
0
1
2
3
4
```
*Note: for loops can be **nested** meaning a for loop can contain another for loop for iterating through multi-dimensional data structures.*

## While Loops
---
A type of loop that continue to run until the stated condition evaluates as false.  
e.g. 
```
>>> i = 0
>>> while i < 5:
***     print(i)
***     i = i + 1
***
0
1
2
3
4
```

## Control statements
---
Used within loops to control how they function.  
- `break` - terminates the loop when executed
    ```
        >>> i = 0
        >>> while i < 5:
        ***     print(i)
        ***     if i == 3:
        *** 		break
        ***     i = i + 1
        ***
        0
        1
        2
        3
        ```
- `continue` - continue iteration without executing remaining code
	```
        >>> i = 0
        >>> while i < 5:
        ***     i = i + 1
        ***     if i == 3:
        *** 		continue
        ***     print(c)
        ***
        1
        2
        4
		5
	```
- `pass` - acts as a placeholder for future code and does nothing
	```
        >>> i = 0
        >>> while i < 5:
        ***     i = i + 1
        ***     if i == 3:
        *** 		pass
        ***     print(c)
        ***
        1
        2
		3
        4
		5
	```

## Try & Except
---
Tries first part of code, and if failed, goes to the exception case.  
e.g.
```
>>> try:
*** 	if 1 > 3:
*** 		print("success")
*** except:
*** 	print("failure")
***
failure
```

## Commenting
---
For single-line commenting, use `#`  
For multi-line commenting, use `"""`  
```
# this is a single-line comment
"""
this is a multi-
line comment
"""
```
*Note: in the above code block, there are no `>>>` or `***` indicating a script environment and not a console environment*

## Functions
---
A block of functional code that can be called back and reused within the script.   
Synatax: `def function_name(parameters):`  
e.g.   
```
def greeting(name):
	print("Hello " + name + "!")
```
*Note: the above code is only the function **definiton** and will not be executed without being a funtion **call***  
To call a function, just enter the function name and pass in the necessary parameters as in `greeting("John")`. When the code is run, the function will evaluate and print `Hello John!`.  

### Return statement
The return statement allows the output of a function to be assigned to a variable.  
e.g.
```
def add(a, b):
	return(a + b)

sum = add(2, 3)
```
The `sum` variable will now use the output of the `add` function as its stored value and can be used in subsequent code.  

*Note: return statements must always be at the end of the function because it functions as a break and will not evaluate any code in the rest of the function.*

## Built-in Functions
---
Just a few examples of some functions built-in to python.  
- `abs()` = absolute value
- `bool()` = false if zero (or equivalent), true if nonzero
- `dir()` = prints a list of all possible functions that can be used with the given parameter
- `help()` = prints help documentation on given function parameter
- `eval()` = runs string parameter as python code
- `exec()` = same as `eval()` but for complex, multi-line code
- `string()` = converts parameter to a string
- `float()` = converts parameter to a float (decimal)
- `int()` = converts parameter to an integer

## Classes & Objects
---
A **class** is broad category of **objects**. An **object** is a specific instance of a **class**.  
e.g.
```
>>> class Person:   # this is the class
***     pass
***
>>> p = Person()    # this is the object
```
*Note: `pass` is used here as a filler. Classes can be filled with various function definitions called **methods**.*  
e.g.
```
>>> class Person:
***     def getName(self):
***         print("John")
***     getAge(self):
***         print("24")
***
>>> p = Person()
>>> p.getName()
John
>>> p.getAge()
24
```
*Note: the class methods are always passed the `self` argument which refers the function to the current object.*  

In the above example, the `p` object is hard-coded with the name John and the age 24. To create unique objects, use the `init` method, which is called right when an object is created. The `init` method takes in the parameters passed in and assigns them to the variables in the class.  
e.g.
```
>>> class Person:
***     def __init__(self, name, age):
***         self.name = name
***         self.age = age
***     def getName(self):
***         print("Your name is " + self.name)
***     def getAge(self):
***         print("Your age is " + self.age)
***
>>> p = Person("Bob", "22")
>>> p.getName()
Your name is Bob
>>> p.getAge()
You age is 22
```

## Inheritance
---
Classes can have subclasses within them. Child classes *inherit* methods from their parents. When the child subclass is to inherit the methods of the parent class, it is initialized as `class Child(Parent):`.  
e.g.
```
>>> class Parent:
***     def __init__(self):
*** 		print("This is the parent class")
*** 	def parentFunction(self):
***			print("This is the parent function")
***
>>> class Child(Parent):
*** 	def __init__(self):
*** 		print("This is the child class")
*** 	def childFunction(self):
*** 		print("This is the child function")
***
>>> c = Child()
This is the child class
>>> c.childFunction()
This is the child function
>>> c.parentFunction()
This is the parent function
```
*Note: the line `c.parentFunction()` is allowed because the object `c` from child class `Child` has inherited all the methods from the parent class `Parent`.*

If a parent and child class both have the same method, you have to use **overriding methods** to tell Python which to use.  
e.g. 
```
>>> class Parent:
*** 	def test(self):
***			print("This is the parent function")
***
>>> class Child(Parent):
*** 	def test(self):
*** 		print("This is the child function")
*** 
>>> c = Child()
>>> c.test()
This is the child function
```
*Note: The most recently defined function will override the previously defined one(s). THis is called **overriding methods**.*