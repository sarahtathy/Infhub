Extension { #name : 'Dictionary' }

{ #category : '*ICal' }
Dictionary >> includesKey: aKey withValue: aValue [
	^(self includesKey: aKey)
		and: [ (self at: aKey) = aValue ]
]
