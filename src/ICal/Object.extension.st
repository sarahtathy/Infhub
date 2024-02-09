Extension { #name : 'Object' }

{ #category : '*ICal' }
Object >> asVCardString [
	^self asICalString
]

{ #category : '*ICal' }
Object >> exportICalParametersOn: aExporter [
]

{ #category : '*ICal' }
Object >> iCalType [
	^self class iCalType
]

{ #category : '*ICal' }
Object >> isDateOrNil [
	^false
]
