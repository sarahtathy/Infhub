Class {
	#name : 'ICTimebasedUUIDStrategy',
	#superclass : 'ICStrategy',
	#category : 'ICal-Strategy',
	#package : 'ICal',
	#tag : 'Strategy'
}

{ #category : 'generating' }
ICTimebasedUUIDStrategy >> generateUid [

	^ (LibC resultOfCommand: 'uuidgen -t') trimBoth
]
