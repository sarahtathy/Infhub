Class {
	#name : 'ICTimebasedUUIDStrategy',
	#superclass : 'ICStrategy',
	#category : 'ICal-Strategy',
	#package : 'ICal-Strategy'
}

{ #category : 'generating' }
ICTimebasedUUIDStrategy >> generateUid [
	^(PipeableOSProcess command: 'uuidgen -t') output
]
