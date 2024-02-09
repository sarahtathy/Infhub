Extension { #name : 'Date' }

{ #category : '*ICal' }
Date >> asICalString [
	^String streamContents: [ :stream |
		stream
			nextPutAll: (self year printPaddedWith: $0 to:  4);
			nextPutAll: (self monthIndex printPaddedWith: $0 to:  2);
			nextPutAll: (self dayOfMonth printPaddedWith: $0 to:  2) ]
	
]

{ #category : '*ICal' }
Date >> asICalUtcString [
	"shouldn't be sent to a date up they are Date and DateAndTime are somewhat 	polymorphic so a Date might end up somewhere where UTC time is needed"
	^self asICalString
]

{ #category : '*ICal' }
Date >> asVCardString [
	^self yyyymmdd
]

{ #category : '*ICal' }
Date class >> fromICalString: aString [
	^ICChronologyParser fromICalDateString: aString class: self
]

{ #category : '*ICal' }
Date class >> fromVCardString: aString [
	^(aString includesSubstring: '-')
		ifFalse: [ self fromICalString: aString ]
		ifTrue:  [
			self
				year: (aString first: 4) asInteger
			     month: (aString copyFrom: 6 to: 7) asInteger
			     day: (aString copyFrom: 9 to: 10) asInteger ]
]

{ #category : '*ICal' }
Date class >> iCalType [
	^'DATE'
]

{ #category : '*ICal' }
Date >> isDateOrNil [
	^true
]
