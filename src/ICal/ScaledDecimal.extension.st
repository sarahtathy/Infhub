Extension { #name : 'ScaledDecimal' }

{ #category : '*ICal' }
ScaledDecimal >> asICalString [
	"copy pasted from #printOn:"
	| aFraction tmpFractionPart |

	^ String streamContents: [ :stream |
		self negative ifTrue: [ stream nextPut: $-].
		aFraction := self asFraction abs.
		stream nextPutAll: aFraction truncated printString.
		scale isZero ifFalse: [ 
			stream nextPut: $..
			tmpFractionPart := aFraction fractionPart.
			scale timesRepeat: [
				tmpFractionPart := tmpFractionPart * 10.
				stream nextPut: (Character digitValue: tmpFractionPart truncated).
				tmpFractionPart := tmpFractionPart fractionPart ] ] ]
]

{ #category : '*ICal' }
ScaledDecimal class >> fromICalString: aString [
	| beforeComma afterComma number beforeCommaScale beforeCommaNumber afterCommaNumber |
	beforeComma := aString upTo: $. .
	afterComma := aString copyAfter: $. .
	beforeCommaScale := 10 raisedTo: afterComma size.
	beforeCommaNumber := beforeComma asNumber * beforeCommaScale
			/ beforeCommaScale.
	afterCommaNumber := ((afterComma isEmpty ifFalse: [ afterComma asNumber ] ifTrue: [ 0 ])
			/  beforeCommaScale).
	number := beforeCommaNumber negative
		ifFalse: [ beforeCommaNumber + afterCommaNumber ]
		ifTrue: [ beforeCommaNumber - afterCommaNumber ].
	^self newFromNumber: number scale: afterComma size
]

{ #category : '*ICal' }
ScaledDecimal class >> iCalType [
	^'FLOAT'
]
