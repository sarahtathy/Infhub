Class {
	#name : 'ICCalendarVersion',
	#superclass : 'Notification',
	#category : 'ICal-Parser',
	#package : 'ICal',
	#tag : 'Parser'
}

{ #category : 'accessing' }
ICCalendarVersion class >> defaultValue [
	^ 2.0
]

{ #category : 'accessing' }
ICCalendarVersion class >> use: anObject during: aBlock [
	^ aBlock
		on: self
		do: [ :notification | notification resume: anObject]
]

{ #category : 'accessing' }
ICCalendarVersion class >> value [
	^ self raiseSignal
]

{ #category : 'accessing' }
ICCalendarVersion >> defaultAction [
	self resume: self class defaultValue
]
