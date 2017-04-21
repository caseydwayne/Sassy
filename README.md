# Sassy

Sassy eases the pain for object-oriented programmers and makes getting around in SASS a little easier.

> ##### *Sassy v1.5 will be released soon!*
> Changes: All methods and mixins will now start with `sassy-`, with aliasing optional.

###Overview

> Sassy provides some essential functionality and makes working with maps much easier.
 
> *It also includes a debugging utility for unit-testing (see notes at the bottom).*

#### Methods:

<sup>Note: *'methods and uses' must be expanded to jump to a specific function*</sup>

Mapping Tools | Essentials            | Extras                | Administrative  | Other
---           |---                    |---                    |---              |---
[get](#get)   | [compare](#compare)   | [explode](#explode)   | [thru](#thru)   | [types](#types)
[set](#set)   | [type](#type)         | [implode](#implode)   | [print](#print) | [types-same](#types-same)
[has](#has)   | [contains](#contains) | [increase](#increase) | [apply](#apply) | -
\-             | -                     | [decrease](#decrease) | -               | -



---

### Method Uses: 

All methods that use a ( map, key, ... ) signature **allow for nested maps** using a *key list!*

    ( list, of, keys )
    
---

<details>
<summary>View Sassy methods and uses.</summary>

#### get
> gets an value from a map key. for nested maps, use a list of keys

<details><summary>
Signatures and Supported Types
</summary>

Signature: 
 - get( map, key )
 - get( map, ( nested, key ) )

*Supported types: map*

[top](#sassy)

</details>

---

#### set
> sets a key:value pair in a map. for nested maps, use a key list

<details><summary>
Signatures and Supported Types
</summary>

Signature: 
 - set( map, key, value )
 - set( map, ( nested, key ), value )

@note *Remember SASS objects are immutable. Replace your map reference each time!*

*Supported types: map*

[top](#sassy)

</details>

---

#### has 
> checks if a map has a key. optionally returns the value

<details><summary>
Signatures and Supported Types
</summary>

Signature: has( map, key, [return], [default] )

Optional default value IF NO KEY (otherwise returns null).

*Supported types: map*

[top](#sassy)

</details>

---

#### compare
> compares 2 things

<details><summary>
Signatures and Supported Types
</summary>

Signature: compare( A, B )

*Supported types: any*

[top](#sassy)

</details>

---

#### type 
> gets the type of an object (optional check string to compare and return bool)

<details><summary>
Signatures and Supported Types
</summary>

Signature: type( var, [against] )

*Supported types: any*

[top](#sassy)

</details>

---

#### types
> returns the types of all args provided in a new list

<details><summary>
Signatures and Supported Types
</summary>

Signature: types ( varN... )

*Supported types: any*

[top](#sassy)

</details>

---

#### types-same
> checks that all vars provided are the same type

<details><summary>
Signatures and Supported Types
</summary>

Signature: types-same ( varN... )

*Supported types: any*

[top](#sassy)

</details>

---

#### contains
> checks if one thing contains another

<details><summary>
Signatures and Supported Types
</summary>

Signature: contains( haystack, needle )

*Supported types: map, list, string*

[top](#sassy)

</details>

---

#### explode
> breaks a string by {delimiter}, returns as list

<details><summary>
Signatures and Supported Types
</summary>

Signature: explode( string, [delimiter='-'] )

*Supported types: string*

[top](#sassy)

</details>

---

#### implode
> joins list items between glue, returning as a string

<details><summary>
Signatures and Supported Types
</summary>

Signature: implode( list, [wrap=false], [glue=', '] )

@note wrap is optional. if true, adds ( ) to string before returning

*Supported types: list*

[top](#sassy)

</details>

---

#### thru( any )
> returns the first argument straight thru (useful for testing purposes)

<details><summary>
Signatures and Supported Types
</summary>

Signature: thru( any )

*Supported types: any*

[top](#sassy)

</details>

---

#### print
> prints a map as a string representation (similar to native "inspect" function)

<details><summary>
Signatures and Supported Types
</summary>

Signature: print( map )

*Supported types: map*

[top](#sassy)

</details>

---

#### apply
> essentially 'calls' a function. values will be fed as call unless they are a list or map. if list, passed as multiple args. if you need to pass a single list, use an "argsmap" ( args: ( your, list ) ) as the arguments param. used by debugger

<details><summary>
Signatures and Supported Types
</summary>

Signature: 
  - apply( method_name,  argslist... )
  - apply( method_name,  ( list, of, args ) )
  - apply( method_name,  argsmap )

*Supported types: function*

[top](#sassy)

</details>

---

#### increase
> increases a number [in a map] by X

<details><summary>
Signatures and Supported Types
</summary>

Signature: 
  - increase( number, [x=1] )
  - increase( map, key, [x=1] )

*Supported types: number, map with number as value to a key*

[top](#sassy)

</details>

---

#### decrease
> decreases a number [in a map] by X

<details><summary>
Signatures and Supported Types
</summary>

Signature: 
  - decrease( number, [x=1] )
  - decrease( map, key, [x=1] )

*Supported types: number, map with number as value to a key*

[top](#sassy)

</details>

---

#### pluck
> pulls a shared key from multiple maps

<details><summary>
Signatures and Supported Types
</summary>

Signature: pluck( key, maps.. )

@note also accepts a list of maps

*Supported types: map*

[top](#sassy)

</details>

[top](#sassy)

</details>

---

## Sassy Debugger

I put together a SASS debug utility based loosely on my much more robust JS debugger. 

There are only 3 mixins you need (really only "test", but it's better to use all 3).

<details>
<summary>View Sassy debug mixins</summary>

---

Mixin: start
> starts a debugger

Signature: @include start(debug_name)



---

Mixin: test
> performs a unit test and echos result

<details><summary>
Signatures and Uses
</summary>

Signature:   
  - @include test( method_name, arguments, [expect=true] )
  - @include test( name, result, [expect=true] )

> *You should* ***always use a list of arguments*** *instead of a result boolean.*

> The result boolean option is there for edge cases where comparing the result isn't so easy. 

> If you need to pass a single list, use an argsmap 

>     ( args: ( your, list ) )

> *You can add a variation string as the 4th parameter. Useful if debugging similar signatures.*

[top](#sassy)

</details>

---

Mixin: complete
> reports a summary of pass | fail.

Signature: @include complete;

> **Include this after your last test.** It will tell you that all tests passed or which ones failed (and why).


[top](#sassy)

</details>

---

**That's all!** *Enjoy the software!*
