Extension { #name : 'DateAndTime' }

{ #category : '*ICal' }
DateAndTime >> asICalString [
	^String streamContents: [ :stream |
		stream 
			nextPutAll: self asDate asICalString;
			nextPut: $T;
			nextPutAll: self asTime asICalString ]
]

{ #category : '*ICal' }
DateAndTime >> asICalUtcString [
	^self asUTC asICalString , 'Z'
]

{ #category : '*ICal' }
DateAndTime >> asVCardString [
	^String streamContents: [ :stream |
		stream 
			nextPutAll: self asDate asVCardString;
			nextPut: $T;
			nextPutAll: self asTime asVCardString ]
]

{ #category : '*ICal' }
DateAndTime class >> fromICalString: aString [
	^ICChronologyParser fromICalDateAndTimeString: aString class: self
]

{ #category : '*ICal' }
DateAndTime class >> fromVCardString: aString [
	^ICChronologyParser fromVCardDateAndTimeString: aString class: self
]

{ #category : '*ICal' }
DateAndTime class >> iCalType [
	^'DATE-TIME'
]
