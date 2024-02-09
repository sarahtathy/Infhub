Extension { #name : 'Boolean' }

{ #category : '*ICal' }
Boolean >> asICalBooleanString [
	self subclassResponsibility 
]

{ #category : '*ICal' }
Boolean >> asICalString [
	^self asICalBooleanString 
]

{ #category : '*ICal' }
Boolean class >> fromICalString: aString [
	(aString sameAs: true asICalString)
		ifTrue: [ ^true ].
	(aString sameAs: false asICalString)
		ifTrue: [ ^false ].
	self error: 'invalid argument'
]

{ #category : '*ICal' }
Boolean class >> iCalType [
	^'BOOLEAN'
]
