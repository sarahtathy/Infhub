Extension { #name : 'Duration' }

{ #category : '*ICal' }
Duration >> asICalString [
	^ICChronologySerializer asICalStringDuration: self
]

{ #category : '*ICal' }
Duration class >> fromICalString: aString [
	^ICChronologyParser fromICalDuractionString: aString class: self
]

{ #category : '*ICal' }
Duration class >> iCalType [
	^'DURATION'
]

{ #category : '*ICal' }
Duration >> isNegative [
	^self isPositive not
]

{ #category : '*ICal' }
Duration >> isPositive [
	^seconds > 0
	 	or: [ seconds = 0
			and: [ nanos > 0 ] ]
]

{ #category : '*ICal' }
Duration >> weeks [
	^self days quo: 7
]
