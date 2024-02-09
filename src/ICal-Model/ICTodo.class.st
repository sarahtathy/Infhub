"
An Event which represents a task which has to be done util the defined deadline.
A todo has as start- and endtime the deadline stored.
"
Class {
	#name : 'ICTodo',
	#superclass : 'ICJob',
	#instVars : [
		'completed',
		'due',
		'percentComplete'
	],
	#category : 'ICal-Model',
	#package : 'ICal-Model'
}

{ #category : 'accessing' }
ICTodo class >> iCalType [
	^'VTODO'
]

{ #category : 'accessing' }
ICTodo class >> possibleStati [
	^super possibleStati
		add: self statusInProcess;
		add: self statusNeedsAction;
		add: self statusCompleted;
		yourself
]

{ #category : 'accessing' }
ICTodo class >> statusCompleted [
	^'COMPLETED'
]

{ #category : 'accessing' }
ICTodo class >> statusInProcess [
	^'IN-PROCESS'
]

{ #category : 'accessing' }
ICTodo class >> statusNeedsAction [
	^'NEEDS-ACTION'
]

{ #category : 'double-dispatch' }
ICTodo >> addToCalendar: aCalendar [
	aCalendar addTodo: self
]

{ #category : 'status' }
ICTodo >> beCompleted [
	self status: self class statusCompleted
]

{ #category : 'status' }
ICTodo >> beInProcess [
	self status: self class statusInProcess 
]

{ #category : 'status' }
ICTodo >> beNeedsAction [
	self status: self class statusNeedsAction
]

{ #category : 'accessing' }
ICTodo >> completed [
	^completed
]

{ #category : 'accessing' }
ICTodo >> completed: aDateAndTime [ 
	completed := aDateAndTime.
	aDateAndTime ifNotNil: [
		self beCompleted ]
]

{ #category : 'accessing' }
ICTodo >> due [
	^due
]

{ #category : 'accessing' }
ICTodo >> due: aDateAndTime [ 
	due := aDateAndTime
]

{ #category : 'exporting' }
ICTodo >> exportOn: anExporter [
	super exportOn: anExporter.
	anExporter exportCompleted: self completed.
	anExporter exportPercentComplete: self percentComplete.
	anExporter exportDue: self due	
	
]

{ #category : 'status' }
ICTodo >> isCompleted [
	^self status = self class statusCompleted.
	
]

{ #category : 'status' }
ICTodo >> isInProcess [
	^self status = self class statusInProcess 
]

{ #category : 'status' }
ICTodo >> isNeedsAction [
	^self status = self class statusNeedsAction
]

{ #category : 'testing' }
ICTodo >> isValidForDate: aDate [
	^self due asDate = aDate.
]

{ #category : 'accessing' }
ICTodo >> percentComplete [
	^percentComplete
]

{ #category : 'accessing' }
ICTodo >> percentComplete: anInteger [ 
	"anInteger is an integer between 0 and 100
	e.g 70 means 70% complete"

	percentComplete := anInteger
]

{ #category : 'testing' }
ICTodo >> startsInHour: aDateAndTime [ 
	^aDateAndTime <= self due
		and: [(aDateAndTime + (self durationClass seconds: 3600)) >= self due]
]

{ #category : 'actions' }
ICTodo >> updateEventWith: anEventOrCommand [ 
	super updateEventWith: anEventOrCommand.

	self due: anEventOrCommand due.

	anEventOrCommand isCompleted ifTrue: [
		self beCompleted.
		anEventOrCommand completed isNil ifTrue: [
			self completed: self dateAndTimeClass now.
		] ifFalse: [
			self completed: anEventOrCommand completed.
		].
	]
]
