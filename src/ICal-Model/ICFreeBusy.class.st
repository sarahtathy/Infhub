Class {
	#name : 'ICFreeBusy',
	#superclass : 'ICCalendarEntry',
	#instVars : [
		'end',
		'start',
		'duration'
	],
	#category : 'ICal-Model',
	#package : 'ICal-Model'
}

{ #category : 'accessing' }
ICFreeBusy class >> iCalType [
	^'VFREEBUSY'
]

{ #category : 'double-dispatch' }
ICFreeBusy >> addToCalendar: aCalendar [
	aCalendar addFreeBusy: self
]

{ #category : 'accessing' }
ICFreeBusy >> duration [
	^duration
]

{ #category : 'accessing' }
ICFreeBusy >> duration: aDuration [ 
	duration := aDuration
]

{ #category : 'accessing' }
ICFreeBusy >> end [
	^end
]

{ #category : 'accessing' }
ICFreeBusy >> end: aDateAndTime [ 
	end := aDateAndTime
]

{ #category : 'exporting' }
ICFreeBusy >> exportOn: anExporter [
	super exportOn: anExporter.
	anExporter exportStart: self start.
	anExporter exportEnd: self end.	
	anExporter exportDuration: self duration
]

{ #category : 'accessing' }
ICFreeBusy >> start [
	^start
]

{ #category : 'accessing' }
ICFreeBusy >> start: aDateAndTime [ 
	start := aDateAndTime
]
