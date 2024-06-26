Class {
	#name : 'ICTrigger',
	#superclass : 'Object',
	#instVars : [
		'related',
		'value'
	],
	#category : 'ICal-Model',
	#package : 'ICal',
	#tag : 'Model'
}

{ #category : 'instance creation' }
ICTrigger class >> fromICalString: aString parameters: aDictionary [
	| related valueType value |
	related := aDictionary at: 'RELATED' ifAbsent: [ self relatedToStart ].
	valueType := aDictionary at: 'VALUE' ifAbsent: [ Duration iCalType ].
	value := (ICConversion propertyClassFor: valueType) fromICalString: aString.
	^self new
		related: related;
		value: value;
		yourself
]

{ #category : 'accessing' }
ICTrigger class >> iCalType [
	^Duration iCalType
]

{ #category : 'accessing-related' }
ICTrigger class >> relatedToEnd [
	^'END'
]

{ #category : 'accessing-related' }
ICTrigger class >> relatedToStart [
	^'START'
]

{ #category : 'converting' }
ICTrigger >> asICalString [
	^self value asICalString
]

{ #category : 'testing' }
ICTrigger >> beRelatedToEnd [
	self related: self class relatedToEnd
]

{ #category : 'testing' }
ICTrigger >> beRelatedToStart [
	self related: self class relatedToStart
]

{ #category : 'exporting' }
ICTrigger >> exportICalParametersOn: anExpoter [
	super exportICalParametersOn: anExpoter.
	self related ifNotNil: [
		anExpoter exportParameter: 'RELATED' value: self related ]
]

{ #category : 'accessing' }
ICTrigger >> iCalType [

	^ self value
		  ifNil: [ self class iCalType ]
		  ifNotNil: [ self value iCalType ]
]

{ #category : 'testing' }
ICTrigger >> isRelatedToEnd [
	^self related = self class relatedToEnd
]

{ #category : 'testing' }
ICTrigger >> isRelatedToStart [
	^self related = self class relatedToStart
		or: [ self related isNil ]
]

{ #category : 'accessing' }
ICTrigger >> related [
	^related
]

{ #category : 'accessing' }
ICTrigger >> related: aString [ 
	related := aString
]

{ #category : 'accessing' }
ICTrigger >> value [
	^value
]

{ #category : 'accessing' }
ICTrigger >> value: aDurationOrDateAndTime [ 
	value := aDurationOrDateAndTime
]
