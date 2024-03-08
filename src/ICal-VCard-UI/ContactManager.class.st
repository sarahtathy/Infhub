Class {
	#name : 'ContactManager',
	#superclass : 'Object',
	#instVars : [
		'contacts'
	],
	#classVars : [
		'UniqueInstace'
	],
	#classInstVars : [
		'contacts'
	],
	#category : 'ICal-VCard-UI-Core',
	#package : 'ICal-VCard-UI',
	#tag : 'Core'
}

{ #category : 'as yet unclassified' }
ContactManager class >> initialize [

	self uniqueInstance reset
]

{ #category : 'instance creation' }
ContactManager class >> uniqueInstance [

	^ UniqueInstace ifNil: [ UniqueInstace := self basicNew ]
]

{ #category : 'accessing' }
ContactManager >> addContact: aContact [

	self contacts add: aContact 
]

{ #category : 'adding' }
ContactManager >> addContactName: aString phoneNumber: aString2 email: aString3 [ 

	self addContact: (
		ICVCard new
			name: aString;
			addPhoneNumber: aString2;
			addEmailAddress: aString3;
			yourself)
		
]

{ #category : 'accessing' }
ContactManager >> contacts [
	^ contacts 
		ifNil: [ contacts := OrderedCollection new ]
]

{ #category : 'accessing' }
ContactManager >> removeContact: anICVCard [
	
	self contacts remove: anICVCard 
]
