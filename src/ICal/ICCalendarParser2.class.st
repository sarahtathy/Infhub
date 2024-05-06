"
I'm the new Parser. I'm more flexible and use dynmic dispatch rather than lots of production rules (my author was lazy).
"
Class {
	#name : 'ICCalendarParser2',
	#superclass : 'SmaCCParser',
	#instVars : [
		'generator'
	],
	#category : 'ICal-Parser',
	#package : 'ICal',
	#tag : 'Parser'
}

{ #category : 'instance creation' }
ICCalendarParser2 class >> parseCalendarStream: aStream [
	| parser |
	parser := self on: aStream.
	parser generator: ICCalendarGenerator new.
	parser parse.
	^parser product
]

{ #category : 'instance creation' }
ICCalendarParser2 class >> parseCalendarString: aString [
	^self parseCalendarStream: (ReadStream on: aString).
]

{ #category : 'generated-comments' }
ICCalendarParser2 class >> parserDefinitionComment [

	"%start calendar;

calendar:
	contentline*;

contentline:
	name 'name' parameterlist 'parameterlist' "":"" value 'value' <CRLF>
		{self contentline: name parameters: parameterlist value: value};
	
parameterlist:
	("";"" param )*					{#parameterlist};
	
name:
	xname							{#name:}
|	ianatoken						{#name:};
	
param:
	paramname ""="" paramvalue		{#parameter:};
	
value:
	<value>							{#value};
	
xname:
	<xname>							{#first:};
	
ianatoken:
	<ianatoken>						{#first:};

paramname:
	ianatoken						{#parameterName:}
|	xtoken							{#parameterName:};

paramvalue:
	paramtext						{#parameterValue:}
|	quotedstring						{#parameterValue.};

quotedstring:
	<quotedstring> 					{#unquote:};


paramtext:
	<paramtext>						{#first:};

xtoken:
	<xtoken>							{#first:};
"
]

{ #category : 'generated-accessing' }
ICCalendarParser2 class >> scannerClass [
	^ICCalendarScanner2
]

{ #category : 'generated-starting states' }
ICCalendarParser2 class >> startingStateForcalendar [
	^1
]

{ #category : 'utilities' }
ICCalendarParser2 >> asSelector: aString [
	| parts |
	parts := aString substrings: #($-).
	^String streamContents: [ :stream |
		parts allButFirst do: [ :each |
			stream nextPutAll: each asLowercase ].
		stream nextPut: $: ]
]

{ #category : 'productions' }
ICCalendarParser2 >> contentline: aName parameters: aCollection value: aString [
	^self generator contentline: aName parameters: aCollection value: aString
]

{ #category : 'productions' }
ICCalendarParser2 >> contentline: aName value: aString [
	^self contentline: aName parameters: Dictionary new value: aString
]

{ #category : 'utilities' }
ICCalendarParser2 >> first: nodes [
	^nodes first
]

{ #category : 'utilities' }
ICCalendarParser2 >> firstAsUppercase: nodes [
	| string |
	string := nodes first.
	^string asUppercase
]

{ #category : 'accessing' }
ICCalendarParser2 >> generator [
	^generator
]

{ #category : 'accessing' }
ICCalendarParser2 >> generator: anObject [
	generator := anObject
]

{ #category : 'productions' }
ICCalendarParser2 >> ianatoken: nodes [
	^self tokensAsString: nodes first
]

{ #category : 'productions' }
ICCalendarParser2 >> name: nodes [
	"property names are case insensitive"
	^self firstAsUppercase: nodes
]

{ #category : 'productions' }
ICCalendarParser2 >> parameter: nodes [
	| name value |
	name := nodes first.
	"the second node is '='"
	value := nodes third.
	^name -> value
]

{ #category : 'productions' }
ICCalendarParser2 >> parameterName: nodes [
	"parameter names are case insensitive"
	^self firstAsUppercase: nodes
]

{ #category : 'productions' }
ICCalendarParser2 >> parameterValue: nodes [
	"parameter values are case insensitive"
	^self firstAsUppercase: nodes
]

{ #category : 'productions' }
ICCalendarParser2 >> parameterlist: nodes [
	| parameters |
	parameters := Dictionary new: nodes size / 2.
	nodes withIndexDo: [ :each :index |
		index even ifTrue: [ parameters add: each ] ].
	^parameters
]

{ #category : 'productions' }
ICCalendarParser2 >> paramtext: nodes [
	^self tokensAsString: nodes first
]

{ #category : 'accessing' }
ICCalendarParser2 >> product [
	^self generator product
]

{ #category : 'productions' }
ICCalendarParser2 >> quotedstring: nodes [
	| tokens |
	tokens := nodes first.
	^String streamContents: [ :stream |
		1 to: tokens size - 1 do:  [ :each | "leave out first and last, they are double quotes"
			stream nextPutAll: (tokens at: each) value ] ]
]

{ #category : 'generated-reduction actions' }
ICCalendarParser2 >> reduceActionForRepeatXXGroupXXXXXXXXXparam1: nodes [ 
	^OrderedCollection new
]

{ #category : 'generated-reduction actions' }
ICCalendarParser2 >> reduceActionForRepeatXXGroupXXXXXXXXXparam2: nodes [ 
	^(nodes at: 1) add: (nodes at: 2);
		yourself
]

{ #category : 'generated-reduction actions' }
ICCalendarParser2 >> reduceActionForRepeatXXcontentline1: nodes [ 
	^OrderedCollection new
]

{ #category : 'generated-reduction actions' }
ICCalendarParser2 >> reduceActionForRepeatXXcontentline2: nodes [ 
	^(nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : 'generated-reduction actions' }
ICCalendarParser2 >> reduceActionForcontentline1: nodes [ 
	^self 
		contentline: (nodes at: 1)
		parameters: (nodes at: 2)
		value: (nodes at: 4)
]

{ #category : 'generated-reduction actions' }
ICCalendarParser2 >> reduceActionForparameterlist1: nodes [ 
	^#parameterlist
]

{ #category : 'generated-reduction actions' }
ICCalendarParser2 >> reduceActionForparamvalue2: nodes [ 
	^#parameterValue
]

{ #category : 'generated-tables' }
ICCalendarParser2 >> reduceTable [
	^#(
#(11 1 #value)
#(12 3 #parameter:)
#(13 2 #reduceFor:)
#(14 1 #reduceActionForparameterlist1:)
#(15 1 #first:)
#(16 1 #first:)
#(17 1 #parameterName:)
#(17 1 #parameterName:)
#(18 1 #parameterValue:)
#(18 1 #reduceActionForparamvalue2:)
#(19 1 #name:)
#(19 1 #name:)
#(20 1 #reduceFor:)
#(21 0 #reduceActionForRepeatXXcontentline1:)
#(21 2 #reduceActionForRepeatXXcontentline2:)
#(22 1 #first:)
#(23 1 #first:)
#(24 1 #unquote:)
#(25 5 #reduceActionForcontentline1:)
#(26 1 #reduceFor:)
#(27 0 #reduceActionForRepeatXXGroupXXXXXXXXXparam1:)
#(27 2 #reduceActionForRepeatXXGroupXXXXXXXXXparam2:)
)
]

{ #category : 'utilities' }
ICCalendarParser2 >> tokensAsString: tokens [
	^String streamContents: [ :stream |
		tokens do: [ :each | stream nextPutAll: each value] ]
]

{ #category : 'accessing' }
ICCalendarParser2 >> transitionTable [
	^#(
#(3 58 5 58 6 13 21 17 26 58 28)
#(3 58 5 58 6 13 21 21 26 58 28)
#(3 25 5 29 6 33 15 37 16 41 19 45 25 82 28)
#(2 0 28)
#(2 0 28)
#(2 26 1 2 3)
#(2 22 1 2)
#(2 46 1 2)
#(2 50 1 2)
#(3 86 1 86 2 49 14 53 27)
#(2 62 5 6 28)
#(2 57 1)
#(3 18 1 61 2 65 13)
#(3 69 9 73 11)
#(3 25 5 77 10 81 12 85 16 89 17 93 22)
#(2 90 1 2)
#(2 6 4)
#(2 97 4)
#(2 66 3)
#(2 14 1 2)
#(2 30 3)
#(2 101 3)
#(2 34 3)
#(2 78 5 6 28)
#(3 105 7 109 8 113 18 117 23 121 24)
#(2 70 1 2)
#(2 74 1 2)
#(2 10 1 2)
#(2 38 1 2)
#(2 42 1 2)
)
]

{ #category : 'utilities' }
ICCalendarParser2 >> unfold: aString [
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
	^ whiteSpaces inject: aString into: [ :each :string |
		pattern at: 3 put: each.
		(string includesSubstring: pattern)
			ifFalse: [ aString ]
			ifTrue: [ aString copyReplaceAll: pattern with: ''  ] ]
]

{ #category : 'utilities' }
ICCalendarParser2 >> unquote: nodes [
	| string |
	string := nodes first.
	^string copyFrom: 2 to: string size
]

{ #category : 'productions' }
ICCalendarParser2 >> value: nodes [
	^self unfold: (self tokensAsString: nodes first)
]
