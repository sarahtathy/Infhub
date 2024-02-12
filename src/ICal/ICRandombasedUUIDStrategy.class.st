Class {
	#name : 'ICRandombasedUUIDStrategy',
	#superclass : 'ICStrategy',
	#category : 'ICal-Strategy',
	#package : 'ICal',
	#tag : 'Strategy'
}

{ #category : 'generating' }
ICRandombasedUUIDStrategy >> generateUid [

	^ (LibC resultOfCommand: 'uuidgen -r') trimBoth
]
