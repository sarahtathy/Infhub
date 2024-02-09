Extension { #name : 'Point' }

{ #category : '*ICal' }
Point >> asICalString [
	^String streamContents: [ :stream |
		stream
			nextPutAll: self x asICalString;
			nextPut: $;;
			nextPutAll: self y asICalString ]
]

{ #category : '*ICal' }
Point class >> fromICalString: aString [
	| coords |
	coords := aString subStringsFull: #($;).
	^self
		x: (Float fromICalString: coords first)
		y: (Float fromICalString: coords second)
]

{ #category : '*ICal' }
Point class >> iCalType [
	^Float iCalType
]
