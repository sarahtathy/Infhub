Extension { #name : 'Time' }

{ #category : '*ICal' }
Time >> asICalString [
	^ICChronologySerializer asICalStringTime: self
]

{ #category : '*ICal' }
Time >> asICalUtcString [
	^self asICalString , 'Z'
]

{ #category : '*ICal' }
Time >> asVCardString [
	^self nanoSecond isZero
		ifTrue: [ self print24 ]
		ifFalse: [ self print24 , '.' , (ICChronologySerializer fractionString: self nanoSecond) ]
]

{ #category : '*ICal' }
Time >> asVCardUtcString [
	^self asVCardString, 'Z'
]

{ #category : '*ICal' }
Time class >> fromICalString: aString [
	^ICChronologyParser fromICalTimeString: aString class: self
]

{ #category : '*ICal' }
Time class >> fromVCardString: aString [
	^ICChronologyParser fromVCardStringTime: aString class: self
]

{ #category : '*ICal' }
Time class >> hour: hour minute: minute second: second  nanosecond: nanosecondsSinceSecond [
	^self hour: hour minute: minute second: second  nanoSecond: nanosecondsSinceSecond
]

{ #category : '*ICal' }
Time class >> iCalType [
	^'TIME'
]
