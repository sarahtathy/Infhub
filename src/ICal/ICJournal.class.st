Class {
	#name : 'ICJournal',
	#superclass : 'ICViewableCalendarEntry',
	#instVars : [
		'textualDescriptions'
	],
	#category : 'ICal-Model',
	#package : 'ICal',
	#tag : 'Model'
}

{ #category : 'accessing' }
ICJournal class >> iCalType [
	^'VJOURNAL'
]

{ #category : 'accessing' }
ICJournal class >> possibleStati [
	^super possibleStati
		add: self statusDraft;
		add: self statusFinal;
		yourself
]

{ #category : 'accessing' }
ICJournal class >> statusDraft [
	^'DRAFT'
]

{ #category : 'accessing' }
ICJournal class >> statusFinal [
	^'FINAL'
]

{ #category : 'adding' }
ICJournal >> addTextualDescription: aString [
	^self textualDescriptions add: aString
]

{ #category : 'double-dispatch' }
ICJournal >> addToCalendar: aCalendar [
	aCalendar addJournal: self
]

{ #category : 'status' }
ICJournal >> beDraft [
	self status: self class statusDraft
]

{ #category : 'status' }
ICJournal >> beFinal [
	self status: self class statusFinal
]

{ #category : 'exporting' }
ICJournal >> exportOn: anExporter [
	super exportOn: anExporter.
	anExporter exportDescription: self textualDescriptions
]

{ #category : 'initialization' }
ICJournal >> initialize [
	super initialize.
	self textualDescriptions: OrderedCollection new
]

{ #category : 'status' }
ICJournal >> isDraft [
	^self status = self class statusDraft
]

{ #category : 'status' }
ICJournal >> isFinal [
	^self status = self class statusFinal
]

{ #category : 'accessing' }
ICJournal >> textualDescriptions [
	^textualDescriptions
]

{ #category : 'accessing' }
ICJournal >> textualDescriptions: aCollection [ 
	textualDescriptions := aCollection
]
