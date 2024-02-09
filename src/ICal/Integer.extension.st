Extension { #name : 'Integer' }

{ #category : '*ICal' }
Integer >> asICalString [
	^self asString
]

{ #category : '*ICal' }
Integer class >> fromICalString: aString [
	^aString asNumber
]

{ #category : '*ICal' }
Integer class >> iCalType [
	^'INTEGER'
]
