"
`ICContactManager` is a class responsible for managing contacts. It allows for the addition, removal, and retrieval of contacts. Contacts are represented as instances of `ICVCard` class. This class provides methods to add contacts either individually or by providing a name, phone number, and email address.

## Usage examples

Adding a contact:
```
ICContactManager uniqueInstance 
	addContactName: 'John Doe' 
	phoneNumber: '1234567890' 
	email: 'john@example.com'.
```

Accessing contacts:
```
ICContactManager uniqueInstance contacts.
```

Removing a contact:
```
ICContactManager uniqueInstance removeContact: aContact
```
"
Class {
	#name : 'ICContactManager',
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
ICContactManager class >> initialize [

	self uniqueInstance reset
]

{ #category : 'instance creation' }
ICContactManager class >> uniqueInstance [

	^ UniqueInstace ifNil: [ UniqueInstace := self basicNew ]
]

{ #category : 'accessing' }
ICContactManager >> addContact: aContact [

	self contacts add: aContact 
]

{ #category : 'adding' }
ICContactManager >> addContactName: aString phoneNumber: aString2 email: aString3 [ 

	self addContact: (
		ICVCard new
			name: aString;
			addPhoneNumber: aString2;
			addEmailAddress: aString3;
			yourself)
		
]

{ #category : 'accessing' }
ICContactManager >> contacts [
	^ contacts 
		ifNil: [ contacts := OrderedCollection new ]
]

{ #category : 'accessing' }
ICContactManager >> removeContact: anICVCard [
	
	self contacts remove: anICVCard 
]

{ #category : 'initialization' }
ICContactManager >> reset [

	UniqueInstace := nil.
]
