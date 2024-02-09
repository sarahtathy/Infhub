Extension { #name : 'String' }

{ #category : '*ICal' }
String >> asICalParameterString [
	^(self includesAnyOf: #($, $; $\ $:))
		ifTrue: [ 
			'"' , self asString , '"' ]
		ifFalse: [ self asString ]
]

{ #category : '*ICal' }
String >> asICalString [
	^ICCalendarVersion value >= 2.0
		ifTrue: [ self asNewICalString ]
		ifFalse: [ self asOldICalString ]
]

{ #category : '*ICal' }
String >> asNewICalString [
	^self replaceStrings: (Array
		with: '\' -> '\\'
		with: ',' -> '\,'
		with: ';' -> '\;'
		with: (String with: Character cr) -> '\n')
]

{ #category : '*ICal' }
String >> asOldICalString [
	^self replaceStrings: (Array
		with: ',' -> '\,'
		with: ';' -> '\;'
		with: '\' -> '\\'
		with: (String with: Character cr) -> '=0D=0A')
]

{ #category : '*ICal' }
String >> asVCardString [
	^ self asNewICalString 
]

{ #category : '*ICal' }
String class >> fromICalString: aString [
	^ self fromNewString: aString 
]

{ #category : '*ICal' }
String class >> fromIParameterString: aString [
	^((aString first = $"
		and: [ aString last = $" ]
		and: [ aString size > 1 ])
			ifTrue: [ aString copyFrom: 2 to: aString size - 1 ]
			ifFalse: [ aString ]) asUppercase
]

{ #category : '*ICal' }
String class >> fromNewString: aString [
	^aString replaceStrings: (Array
		with: '\n' -> (String with: Character cr)
		with: '\N' -> (String with: Character cr)
		with: '\,' -> ','
		with: '\;' -> ';'
		with: '\\' -> '\')
]

{ #category : '*ICal' }
String class >> fromOldString: aString [
	^aString replaceStrings: (Array
				with: '=0D=0A' -> (String with: Character cr)
				with: '\\' -> '\'
				with: '=0D' -> (String with: Character cr)
				with: '=0A' -> (String with: Character cr)
				with: '\,' -> ','
				with: '\;' -> ';')
]

{ #category : '*ICal' }
String class >> fromVCardString: aString [
	^self fromNewString: aString 
]

{ #category : '*ICal' }
String class >> iCalType [
	^'TEXT'
]

{ #category : '*ICal' }
String >> replaceStrings: aCollection [
	| result |
	result := self.
	aCollection do: [ :each |
		(result includesSubstring: each key) ifTrue: [
				result := result copyReplaceAll: each key with: each value ] ].
	^result
]

{ #category : '*ICal' }
String >> splitAtCommas [
	| indices start parts |
	indices := OrderedCollection new.
	self withIndexDo: [ :each :index |
		((each = $,
			and: [ index > 1 ])
			and: [ (self at: index - 1) ~= $\ ])
			ifTrue: [ indices add: index ] ].
	start := 1.
	parts := OrderedCollection new: indices size + 1.
	indices do: [ :each |
		parts add: (self copyFrom: start to: each - 1).
		start := each + 1 ].
	parts add: (self copyFrom: start to: self size).
	^parts
]

{ #category : '*ICal' }
String >> subStringsFull: separators [ 
	"Answer an array containing the substrings in the receiver separated 
	by the elements of separators."
	| char result sourceStream subString |
	sourceStream := ReadStream on: self.
	result := OrderedCollection new.
	subString := String new.
	[sourceStream atEnd]
		whileFalse: 
			[char := sourceStream next.
			(separators includes: char)
				ifTrue: [
					result add: subString.
					subString := String new ]
				ifFalse: [subString := subString , (String with: char)]].
	result add: subString.
	^ result
]
