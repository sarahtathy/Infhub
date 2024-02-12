Class {
	#name : 'ICCardVersion',
	#superclass : 'Notification',
	#category : 'ICal-VCard-Parser',
	#package : 'ICal-VCard',
	#tag : 'Parser'
}

{ #category : 'as yet unclassified' }
ICCardVersion class >> defaultValue [
	^ 3.0
]

{ #category : 'as yet unclassified' }
ICCardVersion class >> use: anObject during: aBlock [
	^ aBlock
		on: self
		do: [ :notification | notification resume: anObject]
]

{ #category : 'as yet unclassified' }
ICCardVersion class >> value [
	^ self raiseSignal
]

{ #category : 'as yet unclassified' }
ICCardVersion >> defaultAction [
	self resume: self class defaultValue
]
