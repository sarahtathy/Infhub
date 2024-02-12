Class {
	#name : 'ICCalendarVersion',
	#superclass : 'Notification',
	#category : 'ICal-Parser',
	#package : 'ICal',
	#tag : 'Parser'
}

{ #category : 'as yet unclassified' }
ICCalendarVersion class >> defaultValue [
	^ 2.0
]

{ #category : 'as yet unclassified' }
ICCalendarVersion class >> use: anObject during: aBlock [
	^ aBlock
		on: self
		do: [ :notification | notification resume: anObject]
]

{ #category : 'as yet unclassified' }
ICCalendarVersion class >> value [
	^ self raiseSignal
]

{ #category : 'as yet unclassified' }
ICCalendarVersion >> defaultAction [
	self resume: self class defaultValue
]
