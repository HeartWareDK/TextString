# TextString
Case-INsensitive string implementation

This UNIT implements a case-INsensitive string type to Delphi with implicit conversion to and from the standard UNICODE string type.

It also implements an IN operator, so you can use

IF TextStr IN ['One','Two','Three'] THEN ...

to check if the string is one of multiple values (case-INsensitive check, of course).

To use it, simply USE HeartWare.Strings in your application and declare your case-INsensitive strings as type TextString. You can use them as ordinary strings, except for VAR parameters, ie. you can assign it to other string variables, or use it in a string expression. You cannot, however use it in functions where the string to operate on is a VAR parameter, but it should be easy to implement overloads to handle this.
