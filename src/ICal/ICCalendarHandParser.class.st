"
This is a recursively descending parser written by hand because I couldn't get the smacc one working.
"
Class {
	#name : 'ICCalendarHandParser',
	#superclass : 'Object',
	#instVars : [
		'stream',
		'generator',
		'name',
		'parameters',
		'value'
	],
	#category : 'ICal-Parser',
	#package : 'ICal',
	#tag : 'Parser'
}

{ #category : 'instance creation' }
ICCalendarHandParser class >> on: aStream [
	^self new
		stream: aStream;
		yourself
]

{ #category : 'instance creation' }
ICCalendarHandParser class >> parseCalendarFile: aPath [
	^self parseCalendarString: (FileStream readOnlyFileNamed: aPath) contentsOfEntireFile
]

{ #category : 'instance creation' }
ICCalendarHandParser class >> parseCalendarStream: aStream [
	"don't ask it's Squeak"
	| string |
	string := String streamContents: [ :stream |
			[ aStream atEnd ]
				whileFalse: [ stream nextPut: aStream next ] ].
	aStream close.
	^self parseCalendarString: string
]

{ #category : 'instance creation' }
ICCalendarHandParser class >> parseCalendarString: aString [
	| parser |
	parser := self on: (ReadStream on: aString).
	parser generator: ICCalendarGenerator new.
	parser parse.
	^parser product
]

{ #category : 'parsing' }
ICCalendarHandParser >> addParameter: paramName value: paramValue [
	self parameters add: paramName -> paramValue
]

{ #category : 'parsing' }
ICCalendarHandParser >> contentline [
	self generator
		contentline: self name
		parameters: self parameters
		value: self value
]

{ #category : 'accessing' }
ICCalendarHandParser >> generator [
	^generator
]

{ #category : 'accessing' }
ICCalendarHandParser >> generator: anObject [
	generator := anObject
]

{ #category : 'accessing' }
ICCalendarHandParser >> name [
	^name
]

{ #category : 'accessing' }
ICCalendarHandParser >> name: anObject [
	name := anObject
]

{ #category : 'accessing' }
ICCalendarHandParser >> parameters [
	^parameters
]

{ #category : 'accessing' }
ICCalendarHandParser >> parameters: anObject [
	parameters := anObject
]

{ #category : 'parsing' }
ICCalendarHandParser >> parse [	
	[ self stream atEnd ]
		whileFalse: [ self parseLine ]
]

{ #category : 'parsing' }
ICCalendarHandParser >> parseLine [
	self parseName.
	self parseParameters.
	self parseValue.
	
	self contentline
]

{ #category : 'parsing' }
ICCalendarHandParser >> parseName [
	self name: 
		(self unfold: 
			(self stream upToAny: #($; $:)) asUppercase).
	self stream position: self stream position - 1.
]

{ #category : 'parsing' }
ICCalendarHandParser >> parseParameter [
	"redefined for compatibility with ApplesAddress book"
	| paramName paramValue parameter |
	self stream next. "ignore $;"
	parameter := self stream upToAny: #($; $:).
	paramName := parameter copyUpTo: $=. 
	paramValue := parameter copyAfter: $=.
	paramName := (self unfold: paramName) asUppercase. "case insensitive"
	paramValue := (self unfold: paramValue) asUppercase. "case insensitive"
	self addParameter: paramName value: paramValue.
	self stream position: self stream position - 1.
]

{ #category : 'parsing' }
ICCalendarHandParser >> parseParameters [	
	self parameters: Dictionary new.
	[ self stream peek = $: ]
		whileFalse: [ 
			self parseParameter ].
	
]

{ #category : 'parsing' }
ICCalendarHandParser >> parseValue [
	| crlf |
	crlf := (Array with: Character cr with: Character lf).
	self stream next. "ignore $:"
		
	self value: (String streamContents: [ :strm |
		strm nextPutAll: (self stream upToAll: crlf). "no unfolding needed"
		[ self whitespaces includes: self stream peek ]
			whileTrue: [ 
				self stream next. "ignore whitespace"
				strm nextPutAll: (self stream upToAll: crlf) ] ]). "no unfolding needed"
	
]

{ #category : 'accessing' }
ICCalendarHandParser >> product [
	^self generator product
]

{ #category : 'accessing' }
ICCalendarHandParser >> stream [
	^stream
]

{ #category : 'accessing' }
ICCalendarHandParser >> stream: anObject [
	stream := anObject
]

{ #category : 'utilities' }
ICCalendarHandParser >> unfold: aString [
	"remove any sequence of CR LF WSP"
	| pattern whiteSpaces |
	whiteSpaces := Array
		with: Character space
		with: Character tab
		with: (Character value: 9)
		with: (Character value: 32).
	pattern := Array new: 3.
	pattern at: 1 put: Character cr.
	pattern at: 2 put: Character lf.
	^whiteSpaces
		inject: (self unfoldEquals
			ifTrue: [ self unfoldEquals: aString ]
			ifFalse: [ aString ])
		into: [ :string :each |
			pattern at: 3 put: each.
			(string includesSubstring: pattern)
				ifFalse: [ string ]
				ifTrue: [ string copyReplaceAll: pattern with: ''  ] ]
]

{ #category : 'testing' }
ICCalendarHandParser >> unfoldEquals [
	^ICCalendarVersion value < 2.0
]

{ #category : 'utilities' }
ICCalendarHandParser >> unfoldEquals: aString [
	"remove any sequence of = CR LF WSP"
	| pattern whiteSpaces |
	whiteSpaces := Array
		with: Character space
		with: Character tab
		with: (Character value: 9)
		with: (Character value: 32).
	pattern := Array new: 4.
	pattern at: 1 put: $=.
	pattern at: 2 put: Character cr.
	pattern at: 3 put: Character lf.
	^whiteSpaces inject: aString into: [ :string :each |
		pattern at: 4 put: each.
		(string includesSubstring: pattern)
			ifFalse: [ string ]
			ifTrue: [ string copyReplaceAll: pattern with: ''  ] ]
]

{ #category : 'accessing' }
ICCalendarHandParser >> value [
	^value
]

{ #category : 'accessing' }
ICCalendarHandParser >> value: anObject [
	value := anObject
]

{ #category : 'parsing' }
ICCalendarHandParser >> whitespaces [
	^Array
		with: Character space
		with: Character tab
		with: (Character value: 9)
		with: (Character value: 32).
]
