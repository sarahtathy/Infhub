Class {
	#name : 'ICTimebasedUUIDStrategy',
	#superclass : 'ICStrategy',
	#category : 'ICal-Strategy',
	#package : 'ICal',
	#tag : 'Strategy'
}

{ #category : 'generating' }
ICTimebasedUUIDStrategy >> generateUid [
	^(PipeableOSProcess command: 'uuidgen -t') output
]
