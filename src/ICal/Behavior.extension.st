Extension { #name : 'Behavior' }

{ #category : '*ICal' }
Behavior >> fromICalString: aString parameters: aDictionary [
	^self fromICalString: aString
]

{ #category : '*ICal' }
Behavior >> fromVCardString: aString [
	^self fromICalString: aString
]

{ #category : '*ICal' }
Behavior >> fromVCardString: aString parameters: aDictionary [
	^self fromVCardString: aString
]
