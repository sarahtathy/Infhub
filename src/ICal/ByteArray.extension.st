Extension { #name : 'ByteArray' }

{ #category : '*ICal' }
ByteArray >> asICalString [
	^(Base64MimeConverter mimeEncode:
		(ReadWriteStream on: self))
			contents
]

{ #category : '*ICal' }
ByteArray >> exportICalParametersOn: anExpoter [
	super exportICalParametersOn: anExpoter.
	anExpoter isVCard ifTrue: [
		anExpoter exportParameter: 'ENCODING' value: 'b' ]
]

{ #category : '*ICal' }
ByteArray class >> fromICalString: aString [
	^(Base64MimeConverter mimeDecodeToBytes: 
		(ReadStream on: aString))
			contents
]

{ #category : '*ICal' }
ByteArray class >> iCalType [
	^'BINARY'
]
