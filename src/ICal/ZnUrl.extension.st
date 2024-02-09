Extension { #name : 'ZnUrl' }

{ #category : '*ICal' }
ZnUrl >> asICalString [
	^self asString
		replaceStrings: (Array
			with: '%2D' -> '-'
			with: '%2E' -> '.'
			with: '%5F' -> '_'
			with: '%7E' -> '~')
]

{ #category : '*ICal' }
ZnUrl class >> fromICalString: aString [
	^"self absoluteFromText:" aString
]

{ #category : '*ICal' }
ZnUrl class >> iCalType [
	^'URI'
]
