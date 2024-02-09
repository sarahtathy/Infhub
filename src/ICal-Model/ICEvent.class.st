"
An Appointment is a normal event which has a start- and an endtime.
It can also be a fulltime event which means that this event lasts the whole day.
On the class side, some static information about appointments is stored, for instance which stati an appointment can have. The two different types mentioned above, fullday or normal event, are also stored on the class side.
"
Class {
	#name : 'ICEvent',
	#superclass : 'ICJob',
	#instVars : [
		'end',
		'transparency'
	],
	#category : 'ICal-Model',
	#package : 'ICal-Model'
}

{ #category : 'accessing' }
ICEvent class >> iCalType [
	^'VEVENT'
]

{ #category : 'accessing-stati' }
ICEvent class >> possibleStati [
	^super possibleStati
		add: self statusConfirmed;
		add: self statusTentative;
		yourself
]

{ #category : 'accessing-transparencies' }
ICEvent class >> possibleTransparencies [
	^Array
		with: self transparencyOpaque
		with: self transparencyTranparent 
]

{ #category : 'accessing-stati' }
ICEvent class >> statusConfirmed [
	^'CONFIRMED'
]

{ #category : 'accessing-stati' }
ICEvent class >> statusTentative [
	^'TENTATIVE'
]

{ #category : 'accessing-transparencies' }
ICEvent class >> transparencyOpaque [
	^'OPAQUE'
]

{ #category : 'accessing-transparencies' }
ICEvent class >> transparencyTranparent [
	^'TRANSPARENT'
]

{ #category : 'double-dispatch' }
ICEvent >> addToCalendar: aCalendar [
	aCalendar addEvent: self
]

{ #category : 'status' }
ICEvent >> beConfirmed [
	self status: self class statusConfirmed
]

{ #category : 'actions' }
ICEvent >> beFullDay [
	self start ifNotNil: [
		self start: self start asDate ].
	self end isNil
		ifTrue: [ self end: self start + (self durationClass days: 1) ]
		ifFalse: [ self end: self end asDate ]	
]

{ #category : 'transparency' }
ICEvent >> beOpaque [
	self transparency: self class transparencyOpaque 
]

{ #category : 'status' }
ICEvent >> beTentative [
	self status: self class statusTentative
]

{ #category : 'transparency' }
ICEvent >> beTransparent [
	self transparency: self class transparencyTranparent
]

{ #category : 'accessing' }
ICEvent >> end [
	^end
]

{ #category : 'accessing' }
ICEvent >> end: aDateAndTime [ 
	end := aDateAndTime
]

{ #category : 'exporting' }
ICEvent >> exportOn: anExporter [ 
	super exportOn: anExporter.
	anExporter exportEnd: self end.
	anExporter exportTransparency: self transparency
]

{ #category : 'status' }
ICEvent >> isConfirmed [
	^self status = self class statusConfirmed
]

{ #category : 'testing' }
ICEvent >> isFullDayEvent [
	^(self start isDateOrNil)
		and: [ self end isDateOrNil ]
]

{ #category : 'transparency' }
ICEvent >> isOpaque [
	^self isTransparent not
]

{ #category : 'status' }
ICEvent >> isTentative [
	^self status = self class statusTentative
]

{ #category : 'transparency' }
ICEvent >> isTransparent [
	^self transparency = self class transparencyTranparent
		or: [ self end isNil ]
]

{ #category : 'testing' }
ICEvent >> isValidForDate: aDate [
	^self start asDate <= aDate and: [self end asDate >= aDate].
]

{ #category : 'testing' }
ICEvent >> startsInHour: aDateAndTime [ 
	^aDateAndTime <= self start
		and: [(aDateAndTime + (self durationClass seconds: 3600)) >= self start ]
]

{ #category : 'transparency' }
ICEvent >> transparency [
	^transparency
]

{ #category : 'transparency' }
ICEvent >> transparency: aString [ 
	transparency := aString
]

{ #category : 'actions' }
ICEvent >> updateEventWith: anEventOrCommand [ 
	super updateEventWith: anEventOrCommand.

	self start: anEventOrCommand start.
	self end: anEventOrCommand end.
	self location: anEventOrCommand location.
]
