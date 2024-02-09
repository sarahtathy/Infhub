Extension { #name : 'Float' }

{ #category : '*ICal' }
Float >> asICalString [
	^self asString
]

{ #category : '*ICal' }
Float class >> fromICalString: aString [
	| float |
	float := aString asNumber.
	^float asICalString ~= aString
		ifFalse: [ float ]
		ifTrue: [ ScaledDecimal fromICalString: aString ]
]

{ #category : '*ICal' }
Float class >> iCalType [
	^'FLOAT'
]
