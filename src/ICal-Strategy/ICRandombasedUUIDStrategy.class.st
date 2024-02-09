Class {
	#name : 'ICRandombasedUUIDStrategy',
	#superclass : 'ICStrategy',
	#category : 'ICal-Strategy',
	#package : 'ICal-Strategy'
}

{ #category : 'generating' }
ICRandombasedUUIDStrategy >> generateUid [
	^(PipeableOSProcess command: 'uuidgen -r') output
]
