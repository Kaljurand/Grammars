Dial
====

Introduction
------------

Voice action for dialing a phone number.
Sequence of digits prefixed by "call".

Note that the sequence must be non-empty but can have any number of digits.

Note that allowing general integers (instead of digits) would cause ambiguity
e.g.

	hundred twenty one

is ambiguous between:

	121
	100 21
	120 1
	100 20 1
