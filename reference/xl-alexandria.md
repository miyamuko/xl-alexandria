# xl-alexandria API Reference

  * [PACKAGES](#packages)
    * [alexandria.0.dev](#package-alexandria-0-dev)
  * [Arrays](#arrays)
    * [copy-array](#function-copy-array)
    * [displace-array](#function-displace-array)
  * [Binding](#binding)
    * [if-let](#macro-if-let)
    * [when-let](#macro-when-let)
    * [when-let*](#macro-when-let-)
  * [Conditions](#conditions)
    * [ignore-some-conditions](#macro-ignore-some-conditions)
    * [required-argument](#function-required-argument)
    * [simple-parse-error](#function-simple-parse-error)
    * [simple-parse-error](#condition-simple-parse-error)
    * [simple-program-error](#function-simple-program-error)
    * [simple-program-error](#condition-simple-program-error)
    * [simple-reader-error](#function-simple-reader-error)
    * [simple-reader-error](#condition-simple-reader-error)
    * [simple-style-warning](#function-simple-style-warning)
    * [simple-style-warning](#condition-simple-style-warning)
    * [unwind-protect-case](#macro-unwind-protect-case)
  * [Control Flow](#control-flow)
    * [cswitch](#macro-cswitch)
    * [eswitch](#macro-eswitch)
    * [multiple-value-prog2](#macro-multiple-value-prog2)
    * [nth-value-or](#macro-nth-value-or)
    * [switch](#macro-switch)
    * [whichever](#macro-whichever)
    * [xor](#macro-xor)
  * [Definitions](#definitions)
    * [define-constant](#macro-define-constant)
  * [Features](#features)
    * [featurep](#function-featurep)
  * [Functions](#functions)
    * [compose](#function-compose)
    * [conjoin](#function-conjoin)
    * [curry](#function-curry)
    * [disjoin](#function-disjoin)
    * [ensure-function](#function-ensure-function)
    * [ensure-functionf](#macro-ensure-functionf)
    * [multiple-value-compose](#function-multiple-value-compose)
    * [named-lambda](#macro-named-lambda)
    * [rcurry](#function-rcurry)
  * [Hash Tables](#hash-tables)
    * [alist-hash-table](#function-alist-hash-table)
    * [copy-hash-table](#function-copy-hash-table)
    * [ensure-gethash](#macro-ensure-gethash)
    * [hash-table-alist](#function-hash-table-alist)
    * [hash-table-keys](#function-hash-table-keys)
    * [hash-table-plist](#function-hash-table-plist)
    * [hash-table-values](#function-hash-table-values)
    * [maphash-keys](#function-maphash-keys)
    * [maphash-values](#function-maphash-values)
    * [plist-hash-table](#function-plist-hash-table)
  * [IO](#io)
    * [copy-file](#function-copy-file)
    * [copy-stream](#function-copy-stream)
    * [read-file-into-byte-vector](#function-read-file-into-byte-vector)
    * [read-file-into-string](#function-read-file-into-string)
    * [with-input-from-file](#macro-with-input-from-file)
    * [with-output-to-file](#macro-with-output-to-file)
    * [write-byte-vector-into-file](#function-write-byte-vector-into-file)
    * [write-string-into-file](#function-write-string-into-file)
  * [Lists](#lists)
    * [alist-plist](#function-alist-plist)
    * [appendf](#macro-appendf)
    * [assoc-value](#function-assoc-value)
    * [circular-list](#function-circular-list)
    * [circular-list](#type-circular-list)
    * [circular-list-p](#function-circular-list-p)
    * [circular-tree-p](#function-circular-tree-p)
    * [delete-from-plist](#function-delete-from-plist)
    * [delete-from-plistf](#macro-delete-from-plistf)
    * [doplist](#macro-doplist)
    * [ensure-car](#function-ensure-car)
    * [ensure-cons](#function-ensure-cons)
    * [ensure-list](#function-ensure-list)
    * [flatten](#function-flatten)
    * [lastcar](#function-lastcar)
    * [make-circular-list](#function-make-circular-list)
    * [map-product](#function-map-product)
    * [mappend](#function-mappend)
    * [nconcf](#macro-nconcf)
    * [nreversef](#macro-nreversef)
    * [nunionf](#macro-nunionf)
    * [plist-alist](#function-plist-alist)
    * [proper-list](#type-proper-list)
    * [proper-list-length](#function-proper-list-length)
    * [proper-list-p](#function-proper-list-p)
    * [rassoc-value](#function-rassoc-value)
    * [remove-from-plist](#function-remove-from-plist)
    * [remove-from-plistf](#macro-remove-from-plistf)
    * [reversef](#macro-reversef)
    * [set-equal](#function-set-equal)
    * [setp](#function-setp)
    * [unionf](#macro-unionf)
  * [Macros](#macros)
    * [destructuring-case](#macro-destructuring-case)
    * [destructuring-ccase](#macro-destructuring-ccase)
    * [destructuring-ecase](#macro-destructuring-ecase)
    * [once-only](#macro-once-only)
    * [parse-body](#function-parse-body)
    * [parse-ordinary-lambda-list](#function-parse-ordinary-lambda-list)
    * [with-gensyms](#macro-with-gensyms)
    * [with-unique-names](#macro-with-unique-names)
  * [Numbers](#numbers)
    * [binomial-coefficient](#function-binomial-coefficient)
    * [clamp](#function-clamp)
    * [count-permutations](#function-count-permutations)
    * [factorial](#function-factorial)
    * [gaussian-random](#function-gaussian-random)
    * [iota](#function-iota)
    * [lerp](#function-lerp)
    * [map-iota](#function-map-iota)
    * [maxf](#macro-maxf)
    * [mean](#function-mean)
    * [median](#function-median)
    * [minf](#macro-minf)
    * [standard-deviation](#function-standard-deviation)
    * [subfactorial](#function-subfactorial)
    * [variance](#function-variance)
  * [Sequences](#sequences)
    * [copy-sequence](#function-copy-sequence)
    * [deletef](#macro-deletef)
    * [emptyp](#function-emptyp)
    * [ends-with](#function-ends-with)
    * [ends-with-subseq](#function-ends-with-subseq)
    * [first-elt](#function-first-elt)
    * [last-elt](#function-last-elt)
    * [length=](#function-length-)
    * [map-combinations](#function-map-combinations)
    * [map-derangements](#function-map-derangements)
    * [map-permutations](#function-map-permutations)
    * [proper-sequence](#type-proper-sequence)
    * [random-elt](#function-random-elt)
    * [removef](#macro-removef)
    * [rotate](#function-rotate)
    * [sequence-of-length-p](#function-sequence-of-length-p)
    * [shuffle](#function-shuffle)
    * [starts-with](#function-starts-with)
    * [starts-with-subseq](#function-starts-with-subseq)
  * [Strings](#strings)
    * [string-designator](#type-string-designator)
  * [Symbols](#symbols)
    * [ensure-symbol](#function-ensure-symbol)
    * [format-symbol](#function-format-symbol)
    * [make-gensym](#function-make-gensym)
    * [make-gensym-list](#function-make-gensym-list)
    * [make-keyword](#function-make-keyword)
    * [symbolicate](#function-symbolicate)
  * [Types](#types)
    * [array-index](#type-array-index)
    * [array-length](#type-array-length)
    * [coercef](#macro-coercef)
    * [of-type](#function-of-type)
    * [type=](#function-type-)
  * [UNKNOWN](#unknown)
    * [negative-double-float](#type-negative-double-float)
    * [negative-double-float-p](#function-negative-double-float-p)
    * [negative-fixnum](#type-negative-fixnum)
    * [negative-fixnum-p](#function-negative-fixnum-p)
    * [negative-float](#type-negative-float)
    * [negative-float-p](#function-negative-float-p)
    * [negative-integer](#type-negative-integer)
    * [negative-integer-p](#function-negative-integer-p)
    * [negative-long-float](#type-negative-long-float)
    * [negative-long-float-p](#function-negative-long-float-p)
    * [negative-rational](#type-negative-rational)
    * [negative-rational-p](#function-negative-rational-p)
    * [negative-real](#type-negative-real)
    * [negative-real-p](#function-negative-real-p)
    * [negative-short-float](#type-negative-short-float)
    * [negative-short-float-p](#function-negative-short-float-p)
    * [negative-single-float](#type-negative-single-float)
    * [negative-single-float-p](#function-negative-single-float-p)
    * [non-negative-double-float](#type-non-negative-double-float)
    * [non-negative-double-float-p](#function-non-negative-double-float-p)
    * [non-negative-fixnum](#type-non-negative-fixnum)
    * [non-negative-fixnum-p](#function-non-negative-fixnum-p)
    * [non-negative-float](#type-non-negative-float)
    * [non-negative-float-p](#function-non-negative-float-p)
    * [non-negative-integer](#type-non-negative-integer)
    * [non-negative-integer-p](#function-non-negative-integer-p)
    * [non-negative-long-float](#type-non-negative-long-float)
    * [non-negative-long-float-p](#function-non-negative-long-float-p)
    * [non-negative-rational](#type-non-negative-rational)
    * [non-negative-rational-p](#function-non-negative-rational-p)
    * [non-negative-real](#type-non-negative-real)
    * [non-negative-real-p](#function-non-negative-real-p)
    * [non-negative-short-float](#type-non-negative-short-float)
    * [non-negative-short-float-p](#function-non-negative-short-float-p)
    * [non-negative-single-float](#type-non-negative-single-float)
    * [non-negative-single-float-p](#function-non-negative-single-float-p)
    * [non-positive-double-float](#type-non-positive-double-float)
    * [non-positive-double-float-p](#function-non-positive-double-float-p)
    * [non-positive-fixnum](#type-non-positive-fixnum)
    * [non-positive-fixnum-p](#function-non-positive-fixnum-p)
    * [non-positive-float](#type-non-positive-float)
    * [non-positive-float-p](#function-non-positive-float-p)
    * [non-positive-integer](#type-non-positive-integer)
    * [non-positive-integer-p](#function-non-positive-integer-p)
    * [non-positive-long-float](#type-non-positive-long-float)
    * [non-positive-long-float-p](#function-non-positive-long-float-p)
    * [non-positive-rational](#type-non-positive-rational)
    * [non-positive-rational-p](#function-non-positive-rational-p)
    * [non-positive-real](#type-non-positive-real)
    * [non-positive-real-p](#function-non-positive-real-p)
    * [non-positive-short-float](#type-non-positive-short-float)
    * [non-positive-short-float-p](#function-non-positive-short-float-p)
    * [non-positive-single-float](#type-non-positive-single-float)
    * [non-positive-single-float-p](#function-non-positive-single-float-p)
    * [positive-double-float](#type-positive-double-float)
    * [positive-double-float-p](#function-positive-double-float-p)
    * [positive-fixnum](#type-positive-fixnum)
    * [positive-fixnum-p](#function-positive-fixnum-p)
    * [positive-float](#type-positive-float)
    * [positive-float-p](#function-positive-float-p)
    * [positive-integer](#type-positive-integer)
    * [positive-integer-p](#function-positive-integer-p)
    * [positive-long-float](#type-positive-long-float)
    * [positive-long-float-p](#function-positive-long-float-p)
    * [positive-rational](#type-positive-rational)
    * [positive-rational-p](#function-positive-rational-p)
    * [positive-real](#type-positive-real)
    * [positive-real-p](#function-positive-real-p)
    * [positive-short-float](#type-positive-short-float)
    * [positive-short-float-p](#function-positive-short-float-p)
    * [positive-single-float](#type-positive-single-float)
    * [positive-single-float-p](#function-positive-single-float-p)
  * [Version](#version)
    * [xl-alexandria-version](#function-xl-alexandria-version)

----

## <a name="packages">PACKAGES</a>

### Package: <a name="package-alexandria-0-dev"><em>alexandria.0.dev</em></a>

ニックネームは以下のとおりです。

  * `xl-alexandria`
  * `alexandria`


----

## <a name="arrays">ARRAYS</a>

### Function: <a name="function-copy-array"><em>copy-array</em></a> <i>`ARRAY` &key (`ELEMENT-TYPE` (array-element-type array)) (`FILL-POINTER` (and (array-has-fill-pointer-p array) (fill-pointer array))) (`ADJUSTABLE` (adjustable-array-p array))</i>

Returns an undisplaced copy of `ARRAY`, with same fill-pointer and
adjustability (if any) as the original, unless overridden by the keyword
arguments.


### Function: <a name="function-displace-array"><em>displace-array</em></a> <i>`ARRAY` &key (`OFFSET` 0) (`DIMENSIONS` (- (array-total-size array) offset))</i>

Return an array displaced to `ARRAY` with the given `OFFSET` and `DIMENSIONS`.
Default arguments displace to a vector.


----

## <a name="binding">BINDING</a>

### Macro: <a name="macro-if-let"><em>if-let</em></a> <i>`BINDINGS` &body (`THEN-FORM` &optional `ELSE-FORM`)</i>

Creates new variable bindings, and conditionally executes either
`THEN-FORM` or `ELSE-FORM`. `ELSE-FORM` defaults to `NIL`.

`BINDINGS` must be either single binding of the form:


```lisp
(variable initial-form)
```


or a list of bindings of the form:


```lisp
((variable-1 initial-form-1)
(variable-2 initial-form-2)
...
(variable-n initial-form-n))
```


All initial-forms are executed sequentially in the specified order. Then all
the variables are bound to the corresponding values.

If all variables were bound to true values, the `THEN-FORM` is executed with the
bindings in effect, otherwise the `ELSE-FORM` is executed with the bindings in
effect.


### Macro: <a name="macro-when-let"><em>when-let</em></a> <i>`BINDINGS` &body `FORMS`</i>

Creates new variable bindings, and conditionally executes `FORMS`.

`BINDINGS` must be either single binding of the form:


```lisp
(variable initial-form)
```


or a list of bindings of the form:


```lisp
((variable-1 initial-form-1)
(variable-2 initial-form-2)
...
(variable-n initial-form-n))
```


All initial-forms are executed sequentially in the specified order. Then all
the variables are bound to the corresponding values.

If all variables were bound to true values, then `FORMS` are executed as an
implicit `PROGN`.


### Macro: <a name="macro-when-let-"><em>when-let*</em></a> <i>`BINDINGS` &body `FORMS`</i>

Creates new variable bindings, and conditionally executes `FORMS`.

`BINDINGS` must be either single binding of the form:


```lisp
(variable initial-form)
```


or a list of bindings of the form:


```lisp
((variable-1 initial-form-1)
(variable-2 initial-form-2)
...
(variable-n initial-form-n))
```


Each initial-form is executed in turn, and the variable bound to the
corresponding value. Initial-form expressions can refer to variables
previously bound by the [when-let*](#macro-when-let-).

Execution of [when-let*](#macro-when-let-) stops immediately if any initial-form evaluates to `NIL`.
If all initial-forms evaluate to true, then `FORMS` are executed as an implicit
`PROGN`.


----

## <a name="conditions">CONDITIONS</a>

### Macro: <a name="macro-ignore-some-conditions"><em>ignore-some-conditions</em></a> <i>(&rest `CONDITIONS`) &body `BODY`</i>

Similar to CL:`IGNORE-ERRORS` but the (unevaluated) `CONDITIONS`
list determines which specific conditions are to be ignored.


### Function: <a name="function-required-argument"><em>required-argument</em></a> <i>&optional `NAME`</i>

Signals an error for a missing argument of `NAME`. Intended for
use as an initialization form for structure and class-slots, and
a default value for required keyword arguments.


### Function: <a name="function-simple-parse-error"><em>simple-parse-error</em></a> <i>`MESSAGE` &rest `ARGS`</i>

Not documented yet.


### Condition: <a name="condition-simple-parse-error"><em>simple-parse-error</em></a>

Not documented yet.


### Function: <a name="function-simple-program-error"><em>simple-program-error</em></a> <i>`MESSAGE` &rest `ARGS`</i>

Not documented yet.


### Condition: <a name="condition-simple-program-error"><em>simple-program-error</em></a>

Not documented yet.


### Function: <a name="function-simple-reader-error"><em>simple-reader-error</em></a> <i>`STREAM` `MESSAGE` &rest `ARGS`</i>

Not documented yet.


### Condition: <a name="condition-simple-reader-error"><em>simple-reader-error</em></a>

Not documented yet.


### Function: <a name="function-simple-style-warning"><em>simple-style-warning</em></a> <i>`MESSAGE` &rest `ARGS`</i>

Not documented yet.


### Condition: <a name="condition-simple-style-warning"><em>simple-style-warning</em></a>

Not documented yet.


### Macro: <a name="macro-unwind-protect-case"><em>unwind-protect-case</em></a> <i>(&optional `ABORT-FLAG`) `PROTECTED-FORM` &body `CLAUSES`</i>

Like CL:`UNWIND-PROTECT`, but you can specify the circumstances that
the cleanup `CLAUSES` are run.


```lisp
clauses ::= (:`NORMAL` form*)* | (:`ABORT` form*)* | (:`ALWAYS` form*)*
```


Clauses can be given in any order, and more than one clause can be
given for each circumstance. The clauses whose denoted circumstance
occured, are executed in the order the clauses appear.

`ABORT-FLAG` is the name of a variable that will be bound to T in
`CLAUSES` if the `PROTECTED-FORM` aborted preemptively, and to `NIL`
otherwise.

Examples:


```lisp
(unwind-protect-case ()
(protected-form)
(:normal (format t "This is only evaluated if `PROTECTED-FORM` executed normally.~%"))
(:abort  (format t "This is only evaluated if `PROTECTED-FORM` aborted preemptively.~%"))
(:always (format t "This is evaluated in either case.~%")))

(unwind-protect-case (aborted-p)
(protected-form)
(:always (perform-cleanup-if aborted-p)))
```


----

## <a name="control-flow">CONTROL FLOW</a>

### Macro: <a name="macro-cswitch"><em>cswitch</em></a> <i>&whole `WHOLE` (`OBJECT` &key (`TEST` 'eql) (`KEY` 'identity)) &body `CLAUSES`</i>

Like [switch](#macro-switch), but signals a continuable error if no key matches.


### Macro: <a name="macro-eswitch"><em>eswitch</em></a> <i>&whole `WHOLE` (`OBJECT` &key (`TEST` 'eql) (`KEY` 'identity)) &body `CLAUSES`</i>

Like [switch](#macro-switch), but signals an error if no key matches.


### Macro: <a name="macro-multiple-value-prog2"><em>multiple-value-prog2</em></a> <i>`FIRST-FORM` `SECOND-FORM` &body `FORMS`</i>

Evaluates `FIRST-FORM`, then `SECOND-FORM`, and then `FORMS`. Yields as its value
all the value returned by `SECOND-FORM`.


### Macro: <a name="macro-nth-value-or"><em>nth-value-or</em></a> <i>`NTH-VALUE` &body `FORMS`</i>

Evaluates `FORM` arguments one at a time, until the `NTH-VALUE` returned by one
of the forms is true. It then returns all the values returned by evaluating
that form. If none of the forms return a true nth value, this form returns
`NIL`.


### Macro: <a name="macro-switch"><em>switch</em></a> <i>&whole `WHOLE` (`OBJECT` &key (`TEST` 'eql) (`KEY` 'identity)) &body `CLAUSES`</i>

Evaluates first matching clause, returning its values, or evaluates and
returns the values of `DEFAULT` if no keys match.


### Macro: <a name="macro-whichever"><em>whichever</em></a> <i>&rest `POSSIBILITIES` &environment `ENV`</i>

Evaluates exactly one of `POSSIBILITIES`, chosen at random.


### Macro: <a name="macro-xor"><em>xor</em></a> <i>&rest `DATUMS`</i>

Evaluates its arguments one at a time, from left to right. If more then one
argument evaluates to a true value no further `DATUMS` are evaluated, and `NIL` is
returned as both primary and secondary value. If exactly one argument
evaluates to true, its value is returned as the primary value after all the
arguments have been evaluated, and T is returned as the secondary value. If no
arguments evaluate to true `NIL` is retuned as primary, and T as secondary
value.


----

## <a name="definitions">DEFINITIONS</a>

### Macro: <a name="macro-define-constant"><em>define-constant</em></a> <i>`NAME` `INITIAL-VALUE` &key (`TEST` ''eql) `DOCUMENTATION`</i>

Ensures that the global variable named by `NAME` is a constant with a value
that is equal under `TEST` to the result of evaluating `INITIAL-VALUE`. `TEST` is a
/function designator/ that defaults to `EQL`. If `DOCUMENTATION` is given, it
becomes the documentation string of the constant.

Signals an error if `NAME` is already a bound non-constant variable.

Signals an error if `NAME` is already a constant variable whose value is not
equal under `TEST` to result of evaluating `INITIAL-VALUE`.


----

## <a name="features">FEATURES</a>

### Function: <a name="function-featurep"><em>featurep</em></a> <i>`FEATURE-EXPRESSION`</i>

Returns T if the argument matches the state of the *`FEATURES*`
list and `NIL` if it does not. `FEATURE-EXPRESSION` can be any atom
or list acceptable to the reader macros #+ and #-.


----

## <a name="functions">FUNCTIONS</a>

### Function: <a name="function-compose"><em>compose</em></a> <i>`FUNCTION` &rest `MORE-FUNCTIONS`</i>

Returns a function composed of `FUNCTION` and `MORE-FUNCTIONS` that applies its
arguments to to each in turn, starting from the rightmost of `MORE-FUNCTIONS`,
and then calling the next one with the primary value of the last.


### Function: <a name="function-conjoin"><em>conjoin</em></a> <i>`PREDICATE` &rest `MORE-PREDICATES`</i>

Returns a function that applies each of `PREDICATE` and `MORE-PREDICATE`
functions in turn to its arguments, returning `NIL` if any of the predicates
returns false, without calling the remaining predicates. If none of the
predicates returns false, returns the primary value of the last predicate.


### Function: <a name="function-curry"><em>curry</em></a> <i>`FUNCTION` &rest `ARGUMENTS`</i>

Returns a function that applies `ARGUMENTS` and the arguments
it is called with to `FUNCTION`.


### Function: <a name="function-disjoin"><em>disjoin</em></a> <i>`PREDICATE` &rest `MORE-PREDICATES`</i>

Returns a function that applies each of `PREDICATE` and `MORE-PREDICATE`
functions in turn to its arguments, returning the primary value of the first
predicate that returns true, without calling the remaining predicates.
If none of the predicates returns true, `NIL` is returned.


### Function: <a name="function-ensure-function"><em>ensure-function</em></a> <i>`FUNCTION-DESIGNATOR`</i>

Returns the function designated by `FUNCTION-DESIGNATOR`:
if `FUNCTION-DESIGNATOR` is a function, it is returned, otherwise
it must be a function name and its `FDEFINITION` is returned.


### Macro: <a name="macro-ensure-functionf"><em>ensure-functionf</em></a> <i>&rest `PLACES`</i>

Multiple-place modify macro for [ensure-function](#function-ensure-function): ensures that each of
`PLACES` contains a function.


### Function: <a name="function-multiple-value-compose"><em>multiple-value-compose</em></a> <i>`FUNCTION` &rest `MORE-FUNCTIONS`</i>

Returns a function composed of `FUNCTION` and `MORE-FUNCTIONS` that applies
its arguments to each in turn, starting from the rightmost of
`MORE-FUNCTIONS`, and then calling the next one with all the return values of
the last.


### Macro: <a name="macro-named-lambda"><em>named-lambda</em></a> <i>`NAME` `LAMBDA-LIST` &body `BODY`</i>

Expands into a lambda-expression within whose `BODY` `NAME` denotes the
corresponding function.


### Function: <a name="function-rcurry"><em>rcurry</em></a> <i>`FUNCTION` &rest `ARGUMENTS`</i>

Returns a function that applies the arguments it is called
with and `ARGUMENTS` to `FUNCTION`.


----

## <a name="hash-tables">HASH TABLES</a>

### Function: <a name="function-alist-hash-table"><em>alist-hash-table</em></a> <i>`ALIST` &rest `HASH-TABLE-INITARGS`</i>

Returns a hash table containing the keys and values of the association list
`ALIST`. Hash table is initialized using the `HASH-TABLE-INITARGS`.


### Function: <a name="function-copy-hash-table"><em>copy-hash-table</em></a> <i>`TABLE` &key `KEY` `TEST` `SIZE` `REHASH-SIZE` `REHASH-THRESHOLD`</i>

Returns a copy of hash table `TABLE`, with the same keys and values
as the `TABLE`. The copy has the same properties as the original, unless
overridden by the keyword arguments.

Before each of the original values is set into the new hash-table, `KEY`
is invoked on the value. As `KEY` defaults to CL:`IDENTITY`, a shallow
copy is returned by default.


### Macro: <a name="macro-ensure-gethash"><em>ensure-gethash</em></a> <i>`KEY` `HASH-TABLE` &optional `DEFAULT`</i>

Like `GETHASH`, but if `KEY` is not found in the `HASH-TABLE` saves the `DEFAULT`
under key before returning it. Secondary return value is true if key was
already in the table.


### Function: <a name="function-hash-table-alist"><em>hash-table-alist</em></a> <i>`TABLE`</i>

Returns an association list containing the keys and values of hash table
`TABLE`.


### Function: <a name="function-hash-table-keys"><em>hash-table-keys</em></a> <i>`TABLE`</i>

Returns a list containing the keys of hash table `TABLE`.


### Function: <a name="function-hash-table-plist"><em>hash-table-plist</em></a> <i>`TABLE`</i>

Returns a property list containing the keys and values of hash table
`TABLE`.


### Function: <a name="function-hash-table-values"><em>hash-table-values</em></a> <i>`TABLE`</i>

Returns a list containing the values of hash table `TABLE`.


### Function: <a name="function-maphash-keys"><em>maphash-keys</em></a> <i>`FUNCTION` `TABLE`</i>

Like `MAPHASH`, but calls `FUNCTION` with each key in the hash table `TABLE`.


### Function: <a name="function-maphash-values"><em>maphash-values</em></a> <i>`FUNCTION` `TABLE`</i>

Like `MAPHASH`, but calls `FUNCTION` with each value in the hash table `TABLE`.


### Function: <a name="function-plist-hash-table"><em>plist-hash-table</em></a> <i>`PLIST` &rest `HASH-TABLE-INITARGS`</i>

Returns a hash table containing the keys and values of the property list
`PLIST`. Hash table is initialized using the `HASH-TABLE-INITARGS`.


----

## <a name="io">IO</a>

### Function: <a name="function-copy-file"><em>copy-file</em></a> <i>`FROM` `TO` &key (`IF-TO-EXISTS` :supersede) (`ELEMENT-TYPE` '(unsigned-byte 8)) `FINISH-OUTPUT`</i>

Not documented yet.


### Function: <a name="function-copy-stream"><em>copy-stream</em></a> <i>`INPUT` `OUTPUT` &key `ELEMENT-TYPE` (`BUFFER-SIZE` 4096) (`BUFFER` (make-vector buffer-size element-type 'character fill-pointer 0)) (`START` 0) `END` `FINISH-OUTPUT`</i>

Reads data from `INPUT` and writes it to `OUTPUT`. Both `INPUT` and `OUTPUT` must
be streams, they will be passed to `READ-SEQUENCE` and `WRITE-SEQUENCE` and must have
compatible element-types.


### Function: <a name="function-read-file-into-byte-vector"><em>read-file-into-byte-vector</em></a> <i>`PATHNAME`</i>

Read `PATHNAME` into a freshly allocated (unsigned-byte 8) vector.


### Function: <a name="function-read-file-into-string"><em>read-file-into-string</em></a> <i>`PATHNAME` &key (`BUFFER-SIZE` 4096) `EXTERNAL-FORMAT`</i>

Return the contents of the file denoted by `PATHNAME` as a fresh string.

The `EXTERNAL-FORMAT` parameter will be passed directly to `WITH-OPEN-FILE`
unless it's `NIL`, which means the system default.


### Macro: <a name="macro-with-input-from-file"><em>with-input-from-file</em></a> <i>(`STREAM-NAME` `FILE-NAME` &rest `ARGS` &key (`DIRECTION` nil `DIRECTION-P`) &allow-other-keys) &body `BODY`</i>

Evaluate `BODY` with `STREAM-NAME` to an input stream on the file
`FILE-NAME`. `ARGS` is sent as is to the call to `OPEN` except `EXTERNAL-FORMAT`,
which is only sent to `WITH-OPEN-FILE` when it's not `NIL`.


### Macro: <a name="macro-with-output-to-file"><em>with-output-to-file</em></a> <i>(`STREAM-NAME` `FILE-NAME` &rest `ARGS` &key (`DIRECTION` nil `DIRECTION-P`) &allow-other-keys) &body `BODY`</i>

Evaluate `BODY` with `STREAM-NAME` to an output stream on the file
`FILE-NAME`. `ARGS` is sent as is to the call to `OPEN` except `EXTERNAL-FORMAT`,
which is only sent to `WITH-OPEN-FILE` when it's not `NIL`.


### Function: <a name="function-write-byte-vector-into-file"><em>write-byte-vector-into-file</em></a> <i>`BYTES` `PATHNAME` &key (`IF-EXISTS` :error) `IF-DOES-NOT-EXIST`</i>

Write `BYTES` to `PATHNAME`.


### Function: <a name="function-write-string-into-file"><em>write-string-into-file</em></a> <i>`STRING` `PATHNAME` &key (`IF-EXISTS` :error) `IF-DOES-NOT-EXIST` `EXTERNAL-FORMAT`</i>

Write `STRING` to `PATHNAME`.

The `EXTERNAL-FORMAT` parameter will be passed directly to `WITH-OPEN-FILE`
unless it's `NIL`, which means the system default.


----

## <a name="lists">LISTS</a>

### Function: <a name="function-alist-plist"><em>alist-plist</em></a> <i>`ALIST`</i>

Returns a property list containing the same keys and values as the
association list `ALIST` in the same order.


### Macro: <a name="macro-appendf"><em>appendf</em></a> <i>&environment `%ENV` `%REFERENCE` &rest `LISTS`</i>

Modify-macro for `APPEND`. Appends `LISTS` to the place designated by the first
argument.


### Function: <a name="function-assoc-value"><em>assoc-value</em></a> <i>`ALIST` `KEY` &key (`TEST` 'eql)</i>

[assoc-value](#function-assoc-value) is an alist accessor very much like `ASSOC`, but it can
be used with `SETF`.


### Function: <a name="function-circular-list"><em>circular-list</em></a> <i>&rest `ELEMENTS`</i>

Creates a circular list of `ELEMENTS`.


### Type: <a name="type-circular-list"><em>circular-list</em></a>

Type designator for circular lists. Implemented as a `SATISFIES` type, so not
recommended for performance intensive use. Main usefullness as the
expected-type designator of a `TYPE-ERROR`.


### Function: <a name="function-circular-list-p"><em>circular-list-p</em></a> <i>`OBJECT`</i>

Returns true if `OBJECT` is a circular list, `NIL` otherwise.


### Function: <a name="function-circular-tree-p"><em>circular-tree-p</em></a> <i>`OBJECT`</i>

Returns true if `OBJECT` is a circular tree, `NIL` otherwise.


### Function: <a name="function-delete-from-plist"><em>delete-from-plist</em></a> <i>`PLIST` &rest `KEYS`</i>

Just like [remove-from-plist](#function-remove-from-plist), but this version may destructively modify the
provided plist.


### Macro: <a name="macro-delete-from-plistf"><em>delete-from-plistf</em></a> <i>&environment `%ENV` `%REFERENCE` &rest `KEYS`</i>

Modify macro for [delete-from-plist](#function-delete-from-plist).


### Macro: <a name="macro-doplist"><em>doplist</em></a> <i>(`KEY` `VAL` `PLIST` &optional `VALUES`) &body `BODY`</i>

Iterates over elements of `PLIST`. `BODY` can be preceded by
declarations, and is like a `TAGBODY`. `RETURN` may be used to terminate
the iteration early. If `RETURN` is not used, returns `VALUES`.


### Function: <a name="function-ensure-car"><em>ensure-car</em></a> <i>`THING`</i>

If `THING` is a `CONS`, its `CAR` is returned. Otherwise `THING` is returned.


### Function: <a name="function-ensure-cons"><em>ensure-cons</em></a> <i>`CONS`</i>

If `CONS` is a cons, it is returned. Otherwise returns a fresh cons with `CONS`
in the car, and `NIL` in the cdr.


### Function: <a name="function-ensure-list"><em>ensure-list</em></a> <i>`LIST`</i>

If `LIST` is a list, it is returned. Otherwise returns the list designated by `LIST`.


### Function: <a name="function-flatten"><em>flatten</em></a> <i>`TREE`</i>

Traverses the tree in order, collecting non-null leaves into a list.


### Function: <a name="function-lastcar"><em>lastcar</em></a> <i>`LIST`</i>

Returns the last element of `LIST`. Signals a type-error if `LIST` is not a
proper list.


### Function: <a name="function-make-circular-list"><em>make-circular-list</em></a> <i>`LENGTH` &key `INITIAL-ELEMENT`</i>

Creates a circular list of `LENGTH` with the given `INITIAL-ELEMENT`.


### Function: <a name="function-map-product"><em>map-product</em></a> <i>`FUNCTION` `LIST` &rest `MORE-LISTS`</i>

Returns a list containing the results of calling `FUNCTION` with one argument
from `LIST`, and one from each of `MORE-LISTS` for each combination of arguments.
In other words, returns the product of `LIST` and `MORE-LISTS` using `FUNCTION`.

Example:


```lisp
(map-product 'list '(1 2) '(3 4) '(5 6))
=> ((1 3 5) (1 3 6) (1 4 5) (1 4 6)
(2 3 5) (2 3 6) (2 4 5) (2 4 6))
```


### Function: <a name="function-mappend"><em>mappend</em></a> <i>`FUNCTION` &rest `LISTS`</i>

Applies `FUNCTION` to respective element(s) of each `LIST`, appending all the
all the result list to a single list. `FUNCTION` must return a list.


### Macro: <a name="macro-nconcf"><em>nconcf</em></a> <i>&environment `%ENV` `%REFERENCE` &rest `LISTS`</i>

Modify-macro for `NCONC`. Concatenates `LISTS` to place designated by the first
argument.


### Macro: <a name="macro-nreversef"><em>nreversef</em></a> <i>&environment `%ENV` `%REFERENCE`</i>

Modify-macro for `NREVERSE`. Reverses the list stored in the given place by
destructively modifying it and saves back the result into the place.


### Macro: <a name="macro-nunionf"><em>nunionf</em></a> <i>&environment `%ENV` `%REFERENCE` `LIST` &rest `ARGS`</i>

Modify-macro for `NUNION`. Saves the union of `LIST` and the contents of the
place designated by the first argument to the designated place. May modify
either argument.


### Function: <a name="function-plist-alist"><em>plist-alist</em></a> <i>`PLIST`</i>

Returns an association list containing the same keys and values as the
property list `PLIST` in the same order.


### Type: <a name="type-proper-list"><em>proper-list</em></a>

Type designator for proper lists. Implemented as a `SATISFIES` type, hence
not recommended for performance intensive use. Main usefullness as a type
designator of the expected type in a `TYPE-ERROR`.


### Function: <a name="function-proper-list-length"><em>proper-list-length</em></a> <i>`LIST`</i>

Returns length of `LIST`, signalling an error if it is not a proper list.


### Function: <a name="function-proper-list-p"><em>proper-list-p</em></a> <i>`OBJECT`</i>

Returns true if `OBJECT` is a proper list.


### Function: <a name="function-rassoc-value"><em>rassoc-value</em></a> <i>`ALIST` `KEY` &key (`TEST` 'eql)</i>

[rassoc-value](#function-rassoc-value) is an alist accessor very much like `RASSOC`, but it can
be used with `SETF`.


### Function: <a name="function-remove-from-plist"><em>remove-from-plist</em></a> <i>`PLIST` &rest `KEYS`</i>

Returns a propery-list with same keys and values as `PLIST`, except that keys
in the list designated by `KEYS` and values corresponding to them are removed.
The returned property-list may share structure with the `PLIST`, but `PLIST` is
not destructively modified. Keys are compared using EQ.


### Macro: <a name="macro-remove-from-plistf"><em>remove-from-plistf</em></a> <i>&environment `%ENV` `%REFERENCE` &rest `KEYS`</i>

Modify macro for [remove-from-plist](#function-remove-from-plist).


### Macro: <a name="macro-reversef"><em>reversef</em></a> <i>&environment `%ENV` `%REFERENCE`</i>

Modify-macro for `REVERSE`. Copies and reverses the list stored in the given
place and saves back the result into the place.


### Function: <a name="function-set-equal"><em>set-equal</em></a> <i>`LIST1` `LIST2` &key (`TEST` #'eql) (`KEY` nil `KEYP`)</i>

Returns true if every element of `LIST`1 matches some element of `LIST`2 and
every element of `LIST`2 matches some element of `LIST`1. Otherwise returns false.


### Function: <a name="function-setp"><em>setp</em></a> <i>`OBJECT` &key (`TEST` #'eql) (`KEY` #'identity)</i>

Returns true if `OBJECT` is a list that denotes a set, `NIL` otherwise. A list
denotes a set if each element of the list is unique under `KEY` and `TEST`.


### Macro: <a name="macro-unionf"><em>unionf</em></a> <i>&environment `%ENV` `%REFERENCE` `LIST` &rest `ARGS`</i>

Modify-macro for `UNION`. Saves the union of `LIST` and the contents of the
place designated by the first argument to the designated place.


----

## <a name="macros">MACROS</a>

### Macro: <a name="macro-destructuring-case"><em>destructuring-case</em></a> <i>`KEYFORM` &body `CLAUSES`</i>

[destructuring-case](#macro-destructuring-case), -`CCASE`, and -`ECASE` are a combination of `CASE` and `DESTRUCTURING-BIND`.
`KEYFORM` must evaluate to a `CONS`.

Clauses are of the form:


```lisp
((`CASE-KEYS` . `DESTRUCTURING-LAMBDA-LIST`) `FORM*`)
```


The clause whose `CASE-KEYS` matches `CAR` of `KEY`, as if by `CASE`, `CCASE`, or `ECASE`,
is selected, and `FORM`s are then executed with `CDR` of `KEY` is destructured and
bound by the `DESTRUCTURING-LAMBDA-LIST`.

Example:


```lisp
(defun dcase (x)
(destructuring-case x
((:foo a b)
(format nil "foo: ~S, ~S" a b))
((:bar &key a b)
(format nil "bar, ~S, ~S" a b))
(((:alt1 :alt2) a)
(format nil "alt: ~S" a))
((t &rest rest)
(format nil "unknown: ~S" rest))))

(dcase (list :foo 1 2))        ; => "foo: 1, 2"
(dcase (list :bar :a 1 :b 2))  ; => "bar: 1, 2"
(dcase (list :alt1 1))         ; => "alt: 1"
(dcase (list :alt2 2))         ; => "alt: 2"
(dcase (list :quux 1 2 3))     ; => "unknown: 1, 2, 3"

(defun decase (x)
(destructuring-case x
((:foo a b)
(format nil "foo: ~S, ~S" a b))
((:bar &key a b)
(format nil "bar, ~S, ~S" a b))
(((:alt1 :alt2) a)
(format nil "alt: ~S" a))))

(decase (list :foo 1 2))        ; => "foo: 1, 2"
(decase (list :bar :a 1 :b 2))  ; => "bar: 1, 2"
(decase (list :alt1 1))         ; => "alt: 1"
(decase (list :alt2 2))         ; => "alt: 2"
(decase (list :quux 1 2 3))     ; =| error
```


### Macro: <a name="macro-destructuring-ccase"><em>destructuring-ccase</em></a> <i>`KEYFORM` &body `CLAUSES`</i>

[destructuring-case](#macro-destructuring-case), -`CCASE`, and -`ECASE` are a combination of `CASE` and `DESTRUCTURING-BIND`.
`KEYFORM` must evaluate to a `CONS`.

Clauses are of the form:


```lisp
((`CASE-KEYS` . `DESTRUCTURING-LAMBDA-LIST`) `FORM*`)
```


The clause whose `CASE-KEYS` matches `CAR` of `KEY`, as if by `CASE`, `CCASE`, or `ECASE`,
is selected, and `FORM`s are then executed with `CDR` of `KEY` is destructured and
bound by the `DESTRUCTURING-LAMBDA-LIST`.

Example:


```lisp
(defun dcase (x)
(destructuring-case x
((:foo a b)
(format nil "foo: ~S, ~S" a b))
((:bar &key a b)
(format nil "bar, ~S, ~S" a b))
(((:alt1 :alt2) a)
(format nil "alt: ~S" a))
((t &rest rest)
(format nil "unknown: ~S" rest))))

(dcase (list :foo 1 2))        ; => "foo: 1, 2"
(dcase (list :bar :a 1 :b 2))  ; => "bar: 1, 2"
(dcase (list :alt1 1))         ; => "alt: 1"
(dcase (list :alt2 2))         ; => "alt: 2"
(dcase (list :quux 1 2 3))     ; => "unknown: 1, 2, 3"

(defun decase (x)
(destructuring-case x
((:foo a b)
(format nil "foo: ~S, ~S" a b))
((:bar &key a b)
(format nil "bar, ~S, ~S" a b))
(((:alt1 :alt2) a)
(format nil "alt: ~S" a))))

(decase (list :foo 1 2))        ; => "foo: 1, 2"
(decase (list :bar :a 1 :b 2))  ; => "bar: 1, 2"
(decase (list :alt1 1))         ; => "alt: 1"
(decase (list :alt2 2))         ; => "alt: 2"
(decase (list :quux 1 2 3))     ; =| error
```


### Macro: <a name="macro-destructuring-ecase"><em>destructuring-ecase</em></a> <i>`KEYFORM` &body `CLAUSES`</i>

[destructuring-case](#macro-destructuring-case), -`CCASE`, and -`ECASE` are a combination of `CASE` and `DESTRUCTURING-BIND`.
`KEYFORM` must evaluate to a `CONS`.

Clauses are of the form:


```lisp
((`CASE-KEYS` . `DESTRUCTURING-LAMBDA-LIST`) `FORM*`)
```


The clause whose `CASE-KEYS` matches `CAR` of `KEY`, as if by `CASE`, `CCASE`, or `ECASE`,
is selected, and `FORM`s are then executed with `CDR` of `KEY` is destructured and
bound by the `DESTRUCTURING-LAMBDA-LIST`.

Example:


```lisp
(defun dcase (x)
(destructuring-case x
((:foo a b)
(format nil "foo: ~S, ~S" a b))
((:bar &key a b)
(format nil "bar, ~S, ~S" a b))
(((:alt1 :alt2) a)
(format nil "alt: ~S" a))
((t &rest rest)
(format nil "unknown: ~S" rest))))

(dcase (list :foo 1 2))        ; => "foo: 1, 2"
(dcase (list :bar :a 1 :b 2))  ; => "bar: 1, 2"
(dcase (list :alt1 1))         ; => "alt: 1"
(dcase (list :alt2 2))         ; => "alt: 2"
(dcase (list :quux 1 2 3))     ; => "unknown: 1, 2, 3"

(defun decase (x)
(destructuring-case x
((:foo a b)
(format nil "foo: ~S, ~S" a b))
((:bar &key a b)
(format nil "bar, ~S, ~S" a b))
(((:alt1 :alt2) a)
(format nil "alt: ~S" a))))

(decase (list :foo 1 2))        ; => "foo: 1, 2"
(decase (list :bar :a 1 :b 2))  ; => "bar: 1, 2"
(decase (list :alt1 1))         ; => "alt: 1"
(decase (list :alt2 2))         ; => "alt: 2"
(decase (list :quux 1 2 3))     ; =| error
```


### Macro: <a name="macro-once-only"><em>once-only</em></a> <i>`SPECS` &body `FORMS`</i>

Evaluates `FORMS` with symbols specified in `SPECS` rebound to temporary
variables, ensuring that each initform is evaluated only once.

Each of `SPECS` must either be a symbol naming the variable to be rebound, or of
the form:


```lisp
(symbol initform)
```


Bare symbols in `SPECS` are equivalent to


```lisp
(symbol symbol)
```


Example:


```lisp
(defmacro cons1 (x) (once-only (x) `(cons ,x ,x)))
(let ((y 0)) (cons1 (incf y))) => (1 . 1)
```


### Function: <a name="function-parse-body"><em>parse-body</em></a> <i>`BODY` &key `DOCUMENTATION` `INTERACTIVE` `WHOLE`</i>

Parses `BODY` into (values remaining-forms declarations doc-string interactive).
Documentation strings are recognized only if `DOCUMENTATION` is true.
Interactive expressions are recognized only if `INTERACTIVE` is true.
Syntax errors in body are signalled and `WHOLE` is used in the signal
arguments when given.


### Function: <a name="function-parse-ordinary-lambda-list"><em>parse-ordinary-lambda-list</em></a> <i>`LAMBDA-LIST` &key (`NORMALIZE` t) `ALLOW-SPECIALIZERS` (`NORMALIZE-OPTIONAL` normalize) (`NORMALIZE-KEYWORD` normalize) (`NORMALIZE-AUXILARY` normalize)</i>

Parses an ordinary lambda-list, returning as multiple values:

1. Required parameters.

2. Optional parameter specifications, normalized into form:

    (name init suppliedp)

3. Name of the rest parameter, or `NIL`.

4. Keyword parameter specifications, normalized into form:

    ((keyword-name name) init suppliedp)

5. Boolean indicating &`ALLOW-OTHER-KEYS` presence.

6. &`AUX` parameter specifications, normalized into form

    (name init).

Signals a `PROGRAM-ERROR` is the lambda-list is malformed.


### Macro: <a name="macro-with-gensyms"><em>with-gensyms</em></a> <i>`NAMES` &body `FORMS`</i>

Binds each variable named by a symbol in `NAMES` to a unique symbol around
`FORMS`. Each of `NAMES` must either be either a symbol, or of the form:


```lisp
(symbol string-designator)
```


Bare symbols appearing in `NAMES` are equivalent to:


```lisp
(symbol symbol)
```


The string-designator is used as the argument to `GENSYM` when constructing the
unique symbol the named variable will be bound to.


### Macro: <a name="macro-with-unique-names"><em>with-unique-names</em></a> <i>`NAMES` &body `FORMS`</i>

Alias for [with-gensyms](#macro-with-gensyms).


----

## <a name="numbers">NUMBERS</a>

### Function: <a name="function-binomial-coefficient"><em>binomial-coefficient</em></a> <i>`N` `K`</i>

Binomial coefficient of N and K, also expressed as N choose K. This is the
number of K element combinations given N choises. N must be equal to or
greater then K.


### Function: <a name="function-clamp"><em>clamp</em></a> <i>`NUMBER` `MIN` `MAX`</i>

Clamps the `NUMBER` into [min, max] range. Returns `MIN` if `NUMBER` is lesser then
`MIN` and `MAX` if `NUMBER` is greater then `MAX`, otherwise returns `NUMBER`.


### Function: <a name="function-count-permutations"><em>count-permutations</em></a> <i>`N` &optional (`K` n)</i>

Number of K element permutations for a sequence of N objects.
K defaults to N


### Function: <a name="function-factorial"><em>factorial</em></a> <i>`N`</i>

Factorial of non-negative integer N.


### Function: <a name="function-gaussian-random"><em>gaussian-random</em></a> <i>&optional `MIN` `MAX`</i>

Returns two gaussian random double floats as the primary and secondary value,
optionally constrained by `MIN` and `MAX`. Gaussian random numbers form a standard
normal distribution around 0.0d0.


### Function: <a name="function-iota"><em>iota</em></a> <i>`N` &key (`START` 0) (`STEP` 1)</i>

Return a list of n numbers, starting from `START` (with numeric contagion
from `STEP` applied), each consequtive number being the sum of the previous one
and `STEP`. `START` defaults to 0 and `STEP` to 1.

Examples:


```lisp
(iota 4)                      => (0 1 2 3 4)
(iota 3 :start 1 :step 1.0)   => (1.0 2.0 3.0)
(iota 3 :start -1 :step -1/2) => (-1 -3/2 -2)
```


### Function: <a name="function-lerp"><em>lerp</em></a> <i>`V` `A` `B`</i>

Returns the result of linear interpolation between A and B, using the
interpolation coefficient V.


### Function: <a name="function-map-iota"><em>map-iota</em></a> <i>`FUNCTION` `N` &key (`START` 0) (`STEP` 1)</i>

Calls `FUNCTION` with N numbers, starting from `START` (with numeric contagion
from `STEP` applied), each consequtive number being the sum of the previous one
and `STEP`. `START` defaults to 0 and `STEP` to 1. Returns N.

Examples:


```lisp
(map-iota #'print 3 :start 1 :step 1.0) => 3
;;; 1.0
;;; 2.0
;;; 3.0
```


### Macro: <a name="macro-maxf"><em>maxf</em></a> <i>&environment `%ENV` `%REFERENCE` &rest `NUMBERS`</i>

Modify-macro for `MAX`. Sets place designated by the first argument to the
maximum of its original value and `NUMBERS`.


### Function: <a name="function-mean"><em>mean</em></a> <i>`OBJECT`</i>

Returns the mean of `OBJECT`.
Predefined methods work on sequences and arrays of numbers. Users can
define new methods.


### Function: <a name="function-median"><em>median</em></a> <i>`OBJECT`</i>

Returns median of `OBJECT`.
Predefined methods work on sequences and arrays of numbers. Users can
define new methods.


### Macro: <a name="macro-minf"><em>minf</em></a> <i>&environment `%ENV` `%REFERENCE` &rest `NUMBERS`</i>

Modify-macro for `MIN`. Sets place designated by the first argument to the
minimum of its original value and `NUMBERS`.


### Function: <a name="function-standard-deviation"><em>standard-deviation</em></a> <i>`SAMPLE` &key (`BIASED` t)</i>

Standard deviation of `SAMPLE`. Returns the biased standard deviation if
`BIASED` is true (the default), and the square root of the unbiased estimator
for variance if `BIASED` is false (which is not the same as the unbiased
estimator for standard deviation). `SAMPLE` must be a sequence of numbers.


### Function: <a name="function-subfactorial"><em>subfactorial</em></a> <i>`N`</i>

Subfactorial of the non-negative integer N.


### Function: <a name="function-variance"><em>variance</em></a> <i>`SAMPLE` &key (`BIASED` t)</i>

Variance of `SAMPLE`. Returns the biased variance if `BIASED` is true (the default),
and the unbiased estimator of variance if `BIASED` is false. `SAMPLE` must be a
sequence of numbers.


----

## <a name="sequences">SEQUENCES</a>

### Function: <a name="function-copy-sequence"><em>copy-sequence</em></a> <i>`TYPE` `SEQUENCE`</i>

Returns a fresh sequence of `TYPE`, which has the same elements as
`SEQUENCE`.


### Macro: <a name="macro-deletef"><em>deletef</em></a> <i>&environment `%ENV` `%REFERENCE` `ITEM` &rest `REMOVE-KEYWORDS`</i>

Modify-macro for `DELETE`. Sets place designated by the first argument to
the result of calling `DELETE` with `ITEM`, place, and the `REMOVE-KEYWORDS`.


### Function: <a name="function-emptyp"><em>emptyp</em></a> <i>`SEQUENCE`</i>

Returns true if `SEQUENCE` is an empty sequence. Signals an error if `SEQUENCE`
is not a sequence.


### Function: <a name="function-ends-with"><em>ends-with</em></a> <i>`OBJECT` `SEQUENCE` &key (`TEST` #'eql) (`KEY` #'identity)</i>

Returns true if `SEQUENCE` is a sequence whose last element is `EQL` to `OBJECT`.
Returns `NIL` if the `SEQUENCE` is not a sequence or is an empty sequence. Signals
an error if `SEQUENCE` is an improper list.


### Function: <a name="function-ends-with-subseq"><em>ends-with-subseq</em></a> <i>`SUFFIX` `SEQUENCE` &key (`TEST` #'eql)</i>

Test whether `SEQUENCE` ends with `SUFFIX`. In other words: return true if
the last (length `SUFFIX`) elements of `SEQUENCE` are equal to `SUFFIX`.


### Function: <a name="function-first-elt"><em>first-elt</em></a> <i>`SEQUENCE`</i>

Returns the first element of `SEQUENCE`. Signals a type-error if `SEQUENCE` is
not a sequence, or is an empty sequence.


### Function: <a name="function-last-elt"><em>last-elt</em></a> <i>`SEQUENCE`</i>

Returns the last element of `SEQUENCE`. Signals a type-error if `SEQUENCE` is
not a proper sequence, or is an empty sequence.


### Function: <a name="function-length-"><em>length=</em></a> <i>&rest `SEQUENCES`</i>

Takes any number of sequences or integers in any order. Returns true iff
the length of all the sequences and the integers are equal. Hint: there's a
compiler macro that expands into more efficient code if the first argument
is a literal integer.


### Function: <a name="function-map-combinations"><em>map-combinations</em></a> <i>`FUNCTION` `SEQUENCE` &key (`START` 0) `END` `LENGTH` (`COPY` t)</i>

Calls `FUNCTION` with each combination of `LENGTH` constructable from the
elements of the subsequence of `SEQUENCE` delimited by `START` and `END`. `START`
defaults to 0, `END` to length of `SEQUENCE`, and `LENGTH` to the length of the
delimited subsequence. (So unless `LENGTH` is specified there is only a single
combination, which has the same elements as the delimited subsequence.) If
`COPY` is true (the default) each combination is freshly allocated. If `COPY` is
false all combinations are EQ to each other, in which case consequences are
specified if a combination is modified by `FUNCTION`.


### Function: <a name="function-map-derangements"><em>map-derangements</em></a> <i>`FUNCTION` `SEQUENCE` &key (`START` 0) `END` (`COPY` t)</i>

Calls `FUNCTION` with each derangement of the subsequence of `SEQUENCE` denoted
by the bounding index designators `START` and `END`. Derangement is a permutation
of the sequence where no element remains in place. `SEQUENCE` is not modified,
but individual derangements are EQ to each other. Consequences are unspecified
if calling `FUNCTION` modifies either the derangement or `SEQUENCE`.


### Function: <a name="function-map-permutations"><em>map-permutations</em></a> <i>`FUNCTION` `SEQUENCE` &key (`START` 0) `END` `LENGTH` (`COPY` t)</i>

Calls function with each permutation of `LENGTH` constructable
from the subsequence of `SEQUENCE` delimited by `START` and `END`. `START`
defaults to 0, `END` to length of the sequence, and `LENGTH` to the
length of the delimited subsequence.


### Type: <a name="type-proper-sequence"><em>proper-sequence</em></a>

Type designator for proper sequences, that is proper lists and sequences
that are not lists.


### Function: <a name="function-random-elt"><em>random-elt</em></a> <i>`SEQUENCE` &key (`START` 0) `END`</i>

Returns a random element from `SEQUENCE` bounded by `START` and `END`. Signals an
error if the `SEQUENCE` is not a proper non-empty sequence, or if `END` and `START`
are not proper bounding index designators for `SEQUENCE`.


### Macro: <a name="macro-removef"><em>removef</em></a> <i>&environment `%ENV` `%REFERENCE` `ITEM` &rest `REMOVE-KEYWORDS`</i>

Modify-macro for `REMOVE`. Sets place designated by the first argument to
the result of calling `REMOVE` with `ITEM`, place, and the `REMOVE-KEYWORDS`.


### Function: <a name="function-rotate"><em>rotate</em></a> <i>`SEQUENCE` &optional (`N` 1)</i>

Returns a sequence of the same type as `SEQUENCE`, with the elements of
`SEQUENCE` rotated by N: N elements are moved from the end of the sequence to
the front if N is positive, and -N elements moved from the front to the end if
N is negative. `SEQUENCE` must be a proper sequence. N must be an integer,
defaulting to 1.

If absolute value of N is greater then the length of the sequence, the results
are identical to calling [rotate](#function-rotate) with


```lisp
(* (signum n) (mod n (length sequence))).
```


Note: the original sequence may be destructively altered, and result sequence may
share structure with it.


### Function: <a name="function-sequence-of-length-p"><em>sequence-of-length-p</em></a> <i>`SEQUENCE` `LENGTH`</i>

Return true if `SEQUENCE` is a sequence of length `LENGTH`. Signals an error if
`SEQUENCE` is not a sequence. Returns `FALSE` for circular lists.


### Function: <a name="function-shuffle"><em>shuffle</em></a> <i>`SEQUENCE` &key (`START` 0) `END`</i>

Returns a random permutation of `SEQUENCE` bounded by `START` and `END`.
Permuted sequence may share storage with the original one. Signals an
error if `SEQUENCE` is not a proper sequence.


### Function: <a name="function-starts-with"><em>starts-with</em></a> <i>`OBJECT` `SEQUENCE` &key (`TEST` #'eql) (`KEY` #'identity)</i>

Returns true if `SEQUENCE` is a sequence whose first element is `EQL` to `OBJECT`.
Returns `NIL` if the `SEQUENCE` is not a sequence or is an empty sequence.


### Function: <a name="function-starts-with-subseq"><em>starts-with-subseq</em></a> <i>`PREFIX` `SEQUENCE` &rest `ARGS` &key (`RETURN-SUFFIX` nil) &allow-other-keys</i>

Test whether the first elements of `SEQUENCE` are the same (as per `TEST`) as the elements of `PREFIX`.

If `RETURN-SUFFIX` is T the functions returns, as a second value, a
displaced array pointing to the sequence after `PREFIX`.


----

## <a name="strings">STRINGS</a>

### Type: <a name="type-string-designator"><em>string-designator</em></a>

A string designator type. A string designator is either a string, a symbol,
or a character.


----

## <a name="symbols">SYMBOLS</a>

### Function: <a name="function-ensure-symbol"><em>ensure-symbol</em></a> <i>`NAME` &optional (`PACKAGE` *package*)</i>

Returns a symbol with name designated by `NAME`, accessible in package
designated by `PACKAGE`. If symbol is not already accessible in `PACKAGE`, it is
interned there. Returns a secondary value reflecting the status of the symbol
in the package, which matches the secondary return value of `INTERN`.

Example:


```lisp
(ensure-symbol :cons :cl) => cl:cons, :external
```


### Function: <a name="function-format-symbol"><em>format-symbol</em></a> <i>`PACKAGE` `CONTROL` &rest `ARGUMENTS`</i>

Constructs a string by applying `ARGUMENTS` to string designator
`CONTROL` as if by `FORMAT`, and then creates a symbol named by that
string. If `PACKAGE` is `NIL`, returns an uninterned symbol, if package is
T, returns a symbol interned in the current package, and otherwise
returns a symbol interned in the package designated by `PACKAGE`.


### Function: <a name="function-make-gensym"><em>make-gensym</em></a> <i>`NAME`</i>

If `NAME` is a non-negative integer, calls `GENSYM` using it. Otherwise `NAME`
must be a string designator, in which case calls `GENSYM` using the designated
string as the argument.


### Function: <a name="function-make-gensym-list"><em>make-gensym-list</em></a> <i>`LENGTH` &optional (`X` G)</i>

Returns a list of `LENGTH` gensyms, each generated as if with a call to [make-gensym](#function-make-gensym),
using the second (optional, defaulting to "G") argument.


### Function: <a name="function-make-keyword"><em>make-keyword</em></a> <i>`NAME`</i>

Interns the string designated by `NAME` in the `KEYWORD` package.


### Function: <a name="function-symbolicate"><em>symbolicate</em></a> <i>&rest `THINGS`</i>

Concatenate together the names of some strings and symbols,
producing a symbol in the current package.


----

## <a name="types">TYPES</a>

### Type: <a name="type-array-index"><em>array-index</em></a> <i>&optional (`LENGTH` array-dimension-limit)</i>

Type designator for an index into array of `LENGTH`: an integer between
0 (inclusive) and `LENGTH` (exclusive). `LENGTH` defaults to
`ARRAY-DIMENSION-LIMIT`.


### Type: <a name="type-array-length"><em>array-length</em></a> <i>&optional (`LENGTH` array-dimension-limit)</i>

Type designator for a dimension of an array of `LENGTH`: an integer between
0 (inclusive) and `LENGTH` (inclusive). `LENGTH` defaults to
`ARRAY-DIMENSION-LIMIT`.


### Macro: <a name="macro-coercef"><em>coercef</em></a> <i>&environment `%ENV` `%REFERENCE` `TYPE-SPEC`</i>

Modify-macro for `COERCE`.


### Function: <a name="function-of-type"><em>of-type</em></a> <i>`TYPE`</i>

Returns a function of one argument, which returns true when its argument is
of `TYPE`.


### Function: <a name="function-type-"><em>type=</em></a> <i>`TYPE1` `TYPE2`</i>

Returns a primary value of T is `TYPE`1 and `TYPE`2 are the same type,
and a secondary value that is true is the type equality could be reliably
determined: primary value of `NIL` and secondary value of T indicates that the
types are not equivalent.


----

## <a name="unknown">UNKNOWN</a>

### Type: <a name="type-negative-double-float"><em>negative-double-float</em></a>

Type specifier denoting the double-float range from -inf to 0.0d0.


### Function: <a name="function-negative-double-float-p"><em>negative-double-float-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-negative-fixnum"><em>negative-fixnum</em></a>

Type specifier denoting the fixnum range from most-negative-fixnum to -1.


### Function: <a name="function-negative-fixnum-p"><em>negative-fixnum-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-negative-float"><em>negative-float</em></a>

Type specifier denoting the float range from -inf to 0.0.


### Function: <a name="function-negative-float-p"><em>negative-float-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-negative-integer"><em>negative-integer</em></a>

Type specifier denoting the integer range from -inf to -1.


### Function: <a name="function-negative-integer-p"><em>negative-integer-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-negative-long-float"><em>negative-long-float</em></a>

Type specifier denoting the long-float range from -inf to 0.0d0.


### Function: <a name="function-negative-long-float-p"><em>negative-long-float-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-negative-rational"><em>negative-rational</em></a>

Type specifier denoting the rational range from -inf to 0.


### Function: <a name="function-negative-rational-p"><em>negative-rational-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-negative-real"><em>negative-real</em></a>

Type specifier denoting the real range from -inf to 0.


### Function: <a name="function-negative-real-p"><em>negative-real-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-negative-short-float"><em>negative-short-float</em></a>

Type specifier denoting the short-float range from -inf to 0.0.


### Function: <a name="function-negative-short-float-p"><em>negative-short-float-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-negative-single-float"><em>negative-single-float</em></a>

Type specifier denoting the single-float range from -inf to 0.0.


### Function: <a name="function-negative-single-float-p"><em>negative-single-float-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-non-negative-double-float"><em>non-negative-double-float</em></a>

Type specifier denoting the double-float range from 0.0d0 to +inf.


### Function: <a name="function-non-negative-double-float-p"><em>non-negative-double-float-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-non-negative-fixnum"><em>non-negative-fixnum</em></a>

Type specifier denoting the fixnum range from 0 to most-positive-fixnum.


### Function: <a name="function-non-negative-fixnum-p"><em>non-negative-fixnum-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-non-negative-float"><em>non-negative-float</em></a>

Type specifier denoting the float range from 0.0 to +inf.


### Function: <a name="function-non-negative-float-p"><em>non-negative-float-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-non-negative-integer"><em>non-negative-integer</em></a>

Type specifier denoting the integer range from 0 to +inf.


### Function: <a name="function-non-negative-integer-p"><em>non-negative-integer-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-non-negative-long-float"><em>non-negative-long-float</em></a>

Type specifier denoting the long-float range from 0.0d0 to +inf.


### Function: <a name="function-non-negative-long-float-p"><em>non-negative-long-float-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-non-negative-rational"><em>non-negative-rational</em></a>

Type specifier denoting the rational range from 0 to +inf.


### Function: <a name="function-non-negative-rational-p"><em>non-negative-rational-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-non-negative-real"><em>non-negative-real</em></a>

Type specifier denoting the real range from 0 to +inf.


### Function: <a name="function-non-negative-real-p"><em>non-negative-real-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-non-negative-short-float"><em>non-negative-short-float</em></a>

Type specifier denoting the short-float range from 0.0 to +inf.


### Function: <a name="function-non-negative-short-float-p"><em>non-negative-short-float-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-non-negative-single-float"><em>non-negative-single-float</em></a>

Type specifier denoting the single-float range from 0.0 to +inf.


### Function: <a name="function-non-negative-single-float-p"><em>non-negative-single-float-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-non-positive-double-float"><em>non-positive-double-float</em></a>

Type specifier denoting the double-float range from -inf to 0.0d0.


### Function: <a name="function-non-positive-double-float-p"><em>non-positive-double-float-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-non-positive-fixnum"><em>non-positive-fixnum</em></a>

Type specifier denoting the fixnum range from most-negative-fixnum to 0.


### Function: <a name="function-non-positive-fixnum-p"><em>non-positive-fixnum-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-non-positive-float"><em>non-positive-float</em></a>

Type specifier denoting the float range from -inf to 0.0.


### Function: <a name="function-non-positive-float-p"><em>non-positive-float-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-non-positive-integer"><em>non-positive-integer</em></a>

Type specifier denoting the integer range from -inf to 0.


### Function: <a name="function-non-positive-integer-p"><em>non-positive-integer-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-non-positive-long-float"><em>non-positive-long-float</em></a>

Type specifier denoting the long-float range from -inf to 0.0d0.


### Function: <a name="function-non-positive-long-float-p"><em>non-positive-long-float-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-non-positive-rational"><em>non-positive-rational</em></a>

Type specifier denoting the rational range from -inf to 0.


### Function: <a name="function-non-positive-rational-p"><em>non-positive-rational-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-non-positive-real"><em>non-positive-real</em></a>

Type specifier denoting the real range from -inf to 0.


### Function: <a name="function-non-positive-real-p"><em>non-positive-real-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-non-positive-short-float"><em>non-positive-short-float</em></a>

Type specifier denoting the short-float range from -inf to 0.0.


### Function: <a name="function-non-positive-short-float-p"><em>non-positive-short-float-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-non-positive-single-float"><em>non-positive-single-float</em></a>

Type specifier denoting the single-float range from -inf to 0.0.


### Function: <a name="function-non-positive-single-float-p"><em>non-positive-single-float-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-positive-double-float"><em>positive-double-float</em></a>

Type specifier denoting the double-float range from 0.0d0 to +inf.


### Function: <a name="function-positive-double-float-p"><em>positive-double-float-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-positive-fixnum"><em>positive-fixnum</em></a>

Type specifier denoting the fixnum range from 1 to most-positive-fixnum.


### Function: <a name="function-positive-fixnum-p"><em>positive-fixnum-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-positive-float"><em>positive-float</em></a>

Type specifier denoting the float range from 0.0 to +inf.


### Function: <a name="function-positive-float-p"><em>positive-float-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-positive-integer"><em>positive-integer</em></a>

Type specifier denoting the integer range from 1 to +inf.


### Function: <a name="function-positive-integer-p"><em>positive-integer-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-positive-long-float"><em>positive-long-float</em></a>

Type specifier denoting the long-float range from 0.0d0 to +inf.


### Function: <a name="function-positive-long-float-p"><em>positive-long-float-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-positive-rational"><em>positive-rational</em></a>

Type specifier denoting the rational range from 0 to +inf.


### Function: <a name="function-positive-rational-p"><em>positive-rational-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-positive-real"><em>positive-real</em></a>

Type specifier denoting the real range from 0 to +inf.


### Function: <a name="function-positive-real-p"><em>positive-real-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-positive-short-float"><em>positive-short-float</em></a>

Type specifier denoting the short-float range from 0.0 to +inf.


### Function: <a name="function-positive-short-float-p"><em>positive-short-float-p</em></a> <i>`N`</i>

Not documented yet.


### Type: <a name="type-positive-single-float"><em>positive-single-float</em></a>

Type specifier denoting the single-float range from 0.0 to +inf.


### Function: <a name="function-positive-single-float-p"><em>positive-single-float-p</em></a> <i>`N`</i>

Not documented yet.


----

## <a name="version">VERSION</a>

### Function: <a name="function-xl-alexandria-version"><em>xl-alexandria-version</em></a>

Not documented yet.
