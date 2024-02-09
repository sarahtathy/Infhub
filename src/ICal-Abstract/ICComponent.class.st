Class {
	#name : 'ICComponent',
	#superclass : 'Object',
	#instVars : [
		'unknownProperties'
	],
	#category : 'ICal-Abstract',
	#package : 'ICal-Abstract'
}

{ #category : 'accessing' }
ICComponent class >> iCalType [
	self subclassResponsibility 
]

{ #category : 'accessing' }
ICComponent >> addUnknownProperty: anUnkownProperty [
	^self unknownProperties add: anUnkownProperty
]

{ #category : 'private-classes' }
ICComponent >> dateAndTimeClass [
	^ICConversion dateAndTimeClass
]

{ #category : 'private-classes' }
ICComponent >> dateClass [
	^ICConversion dateClass
]

{ #category : 'private-classes' }
ICComponent >> durationClass [
	^ICConversion durationClass
]

{ #category : 'exporting' }
ICComponent >> exportOn: anExporter [
	self subclassResponsibility 
]

{ #category : 'initialization' }
ICComponent >> initialize [
	super initialize.
	self unknownProperties: OrderedCollection new.
]

{ #category : 'private-classes' }
ICComponent >> timeClass [
	^ICConversion timeClass
]

{ #category : 'accessing' }
ICComponent >> unknownProperties [
	^unknownProperties
]

{ #category : 'accessing' }
ICComponent >> unknownProperties: aCollection [ 
	unknownProperties := aCollection
]
