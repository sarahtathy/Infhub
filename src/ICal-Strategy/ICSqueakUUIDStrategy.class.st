Class {
	#name : 'ICSqueakUUIDStrategy',
	#superclass : 'ICStrategy',
	#category : 'ICal-Strategy',
	#package : 'ICal-Strategy'
}

{ #category : 'generating' }
ICSqueakUUIDStrategy >> generateUid [
	^UUID new printString
]
