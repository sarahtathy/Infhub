Class {
	#name : 'ICUser',
	#superclass : 'Object',
	#instVars : [
		'emailAddress',
		'commonName'
	],
	#category : 'ICal-Model',
	#package : 'ICal',
	#tag : 'Model'
}

{ #category : 'accessing' }
ICUser >> commonName [
	^commonName
]

{ #category : 'accessing' }
ICUser >> commonName: aString [ 
	commonName := aString
]

{ #category : 'accessing' }
ICUser >> emailAddress [
	^emailAddress
]

{ #category : 'accessing' }
ICUser >> emailAddress: aString [ 
	emailAddress := aString
]
