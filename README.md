# Sassy

Sassy eases the pain for object-oriented programmers and makes getting around in SASS a little easier.

Sassy 1.0 ships with 14 useful methods to provide some essential functionality and makes working with maps much easier.

It also includes a (separate) debugging utility for unit-testing functions. (see notes at bottom)

- 

Methods:

  has
	compare
	type
	types
	types-same
	contains
	explode
	implode
	thru
	print
	get
	set
	apply
	increase
	decrease

	
##Overview

-

Method: has 
checks if a map has a key. optional $return if return == boolean(true)

Signature: has( map, key, [return], [default] )

Optional default value IF NO KEY (otherwise returns null).

Supported types: map

-

Method: compare
compares 2 things

Signature: compare( A, B )

Supported types: any

-

Method: type 
gets the type of an object (optional check string to compare and return bool)

Signature: type( var, [against] )

Supported types: any

-

Method: types
returns the types of all args provided in a new list

Signature: types ( varN... )

Supported types: any

-

Method: types-same
checks that all vars provided are the same type

Signature: types-same ( varN... )

Supported types: any

-

Method: contains
checks if one thing contains another

Signature: contains( haystack, needle )

Supported types: map, list, string

- 

Method: explode
breaks a string by {delimiter}, returns as list

Signature: explode( string, [delimiter='-'] )

Supported types: string

-

Method: implode
joins list items between glue, returning as a string

Signature: implode( list, [wrap=false], [glue=', '] )

@note wrap is optional. if true, adds ( ) to string before returning

Supported types: list

-

Method: thru( any )
returns the first argument straight thru (useful for testing purposes)

Signature: thru( any )
Supported types: any

-

Method: print
prints a map as a string representation (similar to native "inspect" function)

Signature: print( map )

Supported types: map

- 

Method: get
gets an value from a map key. for nested maps, use a list of keys

Signature: get( map, key ), get( map, ( nested, key ) )

Supported types: map

- 

Method: set
sets a key:value pair in a map. for nested maps, use a key list
get

Signature: set( map, key, value )

Supported types: map

-

apply( method_string,  argument(s) )
essentially 'calls' a function. values will be fed as call unless they are a list or map. if list, passed as multiple args. if you need to pass a single list, use an "argsmap" ( args: ( your, list ) ) as the arguments param. used by debugger

- 

Method: increase
increases a number [in a map] by X

Signature: increase( number, [x=1] ), increase( map, key, [x=1] )

Supported types: number, map with number as value to a key

-

Method: decrease
decreases a number [in a map] by X

Signature: decrease( number, [x=1] ), decrease( map, key, [x=1] )

Supported types: number, map with number as value to a key

-

Method: pluck
pulls a shared key from multiple maps

Signature: pluck( key, maps.. )

@note also accepts a list of maps

Supported types: map

- 

Sassy Debugger

I put together a SASS debug utility based loosely on my much more robust JS debugger. There are a handful of methods and mixins.

-

Mixin: start
starts a debugger

Signature: @include start(debug_name)

-

Mixin: test
performs a unit test and echos result

Signature: test( name, result, [expect=true] ), test( method_name, arguments, expect )

@note You should always use a list of arguments instead of a result boolean. The result boolean option is there for edge cases where comparing isn't so easy. If you need to pass a single list, use an argsmap ( args: ( your, list ) )

- 

Mixin: complete
reports a summary of pass/fail

@note fire this after all of your tests. it will tell you that all tests passed or which ones failed (and why).

---

That's it! Enjoy the software!