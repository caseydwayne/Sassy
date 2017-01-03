# Sassy

Sassy eases the pain for object-oriented programmers and makes getting around in SASS a little easier.

###Overview

> Sassy provides some essential functionality and makes working with maps much easier.
 
> *It also includes a debugging utility for unit-testing (see notes at the bottom).*

#### Methods:

- get
- set
- has
- compare
- type
- types
- types-same
- contains
- explode
- implode
- thru
- print
- apply
- increase
- decrease

---

### Method Uses: 

@note All methods that use a ( map, key, ... ) signature **allow for nested maps using a key list!**

-</details>

-

<details><summary>



Method: get
> gets an value from a map key. for nested maps, use a list of keys

</summary>

Signature: 
 - get( map, key )
 - get( map, ( nested, key ) )

*Supported types: map*

</details>

-

<details><summary>



Method: set
> sets a key:value pair in a map. for nested maps, use a key list

</summary>

Signature: 
 - set( map, key, value )
 - set( map, ( nested, key ), value )

@note *Remember SASS objects are immutable. Replace your map reference each time!*

*Supported types: map*

</details>

-

<details><summary>



Method: has 
> checks if a map has a key. optionally returns the value

</summary>

Signature: has( map, key, [return], [default] )

Optional default value IF NO KEY (otherwise returns null).

*Supported types: map*

</details>

-

<details><summary>



Method: compare
> compares 2 things

</summary>

Signature: compare( A, B )

*Supported types: any*

</details>

-

<details><summary>



Method: type 
> gets the type of an object (optional check string to compare and return bool)

</summary>

Signature: type( var, [against] )

*Supported types: any*

</details>

-

<details><summary>



Method: types
> returns the types of all args provided in a new list

</summary>

Signature: types ( varN... )

*Supported types: any*

</details>

-

<details><summary>



Method: types-same
> checks that all vars provided are the same type

</summary>

Signature: types-same ( varN... )

*Supported types: any*

</details>

-

<details><summary>



Method: contains
> checks if one thing contains another

</summary>

Signature: contains( haystack, needle )

*Supported types: map, list, string*

</details>

-

<details><summary>



Method: explode
> breaks a string by {delimiter}, returns as list

</summary>

Signature: explode( string, [delimiter='-'] )

*Supported types: string*

</details>

-

<details><summary>



Method: implode
> joins list items between glue, returning as a string

</summary>

Signature: implode( list, [wrap=false], [glue=', '] )

@note wrap is optional. if true, adds ( ) to string before returning

*Supported types: list*

</details>

-

<details><summary>



Method: thru( any )
> returns the first argument straight thru (useful for testing purposes)

</summary>

Signature: thru( any )

*Supported types: any*

</details>

-

<details><summary>



Method: print
> prints a map as a string representation (similar to native "inspect" function)

</summary>

Signature: print( map )

*Supported types: map*

</details>

-

<details><summary>



Method: apply
> essentially 'calls' a function. values will be fed as call unless they are a list or map. if list, passed as multiple args. if you need to pass a single list, use an "argsmap" ( args: ( your, list ) ) as the arguments param. used by debugger

</summary>

Signature: 
  - apply( method_name,  argslist... )
  - apply( method_name,  ( list, of, args ) )
  - apply( method_name,  argsmap )

*Supported types: function*

</details>

-

<details><summary>



Method: increase
> increases a number [in a map] by X

</summary>

Signature: 
  - increase( number, [x=1] )
  - increase( map, key, [x=1] )

*Supported types: number, map with number as value to a key*

</details>

-

<details><summary>



Method: decrease
> decreases a number [in a map] by X

</summary>

Signature: 
  - decrease( number, [x=1] )
  - decrease( map, key, [x=1] )

*Supported types: number, map with number as value to a key*

</details>

-

<details><summary>



Method: pluck
> pulls a shared key from multiple maps

</summary>

Signature: pluck( key, maps.. )

@note also accepts a list of maps

*Supported types: map*

---

## Sassy Debugger

I put together a SASS debug utility based loosely on my much more robust JS debugger. 

There are only 3 mixins you need (really only "test", but it's better to use all 3).

</details>

-

<details><summary>



Mixin: start
> starts a debugger

</summary>

Signature: @include start(debug_name)

</details>

-

<details><summary>



Mixin: test
> performs a unit test and echos result

</summary>

Signature:   
  - @include test( method_name, arguments, [expect=true] )
  - @include test( name, result, [expect=true] )

> *You should* ***always use a list of arguments*** *instead of a result boolean.*

> The result boolean option is there for edge cases where comparing the result isn't so easy. 

> If you need to pass a single list, use an argsmap 

>     ( args: ( your, list ) )

> *You can add a variation string as the 4th parameter. Useful if debugging similar signatures.*

-

Mixin: complete
> reports a summary of pass/fail

@note fire this after all of your tests. it will tell you that all tests passed or which ones failed (and why).

--

**That's all!** *Enjoy the software!*
