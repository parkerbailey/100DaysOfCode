Coding Notes

# HTML5
## Anchors
Creates hyperlink between *source anchor* and *destination anchor*
e.g. `<a>an anchor</a>`
Hyperlink reference:    `href=""`
    # = dead link
Target:                 `target=""`
    _blank = opens in new window

## Unordered List
Creates a bulleted list
e.g.
```
<ul>
    <li>item 1</li>
    <li>item 2</li>
</ul>
```

## Ordered List
Creates a numbered list
e.g.
```
<ol>
    <li>item 1</li>
    <li>item 2</li>
</ol>
```

# Python
## Variables
Store data in memory for later access
e.g. `var = <data>`
supports multiple assignment
e.g. `a, b, c = 1, 2, 3`

## Operators
Addition (`+`)  
Subtraction (`-`)  
Multiplication (`*`)  
Division (`/`)  
Modulus (`%`)  

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