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
	#name : 'ICVCardManager',
	#superclass : 'Object',
	#instVars : [
		'contacts',
		'vcard',
		'contactFile'
	],
	#classVars : [
		'UniqueInstance'
	],
	#classInstVars : [
		'contacts'
	],
	#category : 'ICal-VCard-UI-Core',
	#package : 'ICal-VCard-UI',
	#tag : 'Core'
}

{ #category : 'class initialization' }
ICVCardManager class >> initialize [

	self uniqueInstance reset
]

{ #category : 'instance creation' }
ICVCardManager class >> reset [
	<script>
	
	UniqueInstance := nil
]

{ #category : 'instance creation' }
ICVCardManager class >> uniqueInstance [

	^ UniqueInstance ifNil: [ UniqueInstance := self basicNew ]
]

{ #category : 'initialization' }
ICVCardManager >> addContact: arg1 [

	self contacts add: arg1.
	self saveContactInSton
]

{ #category : 'adding' }
ICVCardManager >> addContactName: arg1 phoneNumber1: arg2 address: arg3 email: arg4 birthday: arg5 phoneNumber2: arg6 photo: arg7 [

	| tmp1 |
	tmp1 := ICVCard new.
	tmp1
		name: arg1;
		addPhoneNumber: arg2;
		addPhoneNumber: arg6;
		addAddress: arg3;
		addEmailAddress: arg4;
		birthday: arg5;
		photo: arg7.
	self
		addContact: tmp1 yourself;
		saveContactInSton
]

{ #category : 'actions' }
ICVCardManager >> contactFile [

	^ contactFile ifNil: [ contactFile :=  'contact.ston' asFileReference ]
]

{ #category : 'actions' }
ICVCardManager >> contactFile: arg1 [

	contactFile := arg1
]

{ #category : 'accessing' }
ICVCardManager >> contacts [
	^ contacts 
		ifNil: [ contacts := OrderedCollection new ]
]

{ #category : 'accessing' }
ICVCardManager >> contacts: arg1 [

	contacts := arg1
]

{ #category : 'actions' }
ICVCardManager >> importContact [

	| contactsImported file |
	file := self selectFile.
	contactsImported := OrderedCollection new.
	(file extension = 'ston' ) ifTrue: [ contactsImported := self readContactSton:
		                    (file asFileReference )].
	

	contactsImported do: [ :contact | self addContact: contact ]
]

{ #category : 'initialization' }
ICVCardManager >> initialize [

	super initialize.
	contactFile := 'contact.ston' asFileReference.
]

{ #category : 'writing' }
ICVCardManager >> readContactSton: aContactSton [

	
	^ STON reader
		  on: aContactSton readStream;
		  next
]

{ #category : 'accessing' }
ICVCardManager >> removeContact: anICVCard [

	self contacts remove: anICVCard.
	self saveContactInSton 
]

{ #category : 'initialization' }
ICVCardManager >> reset [

	UniqueInstance := nil.
]

{ #category : 'writing' }
ICVCardManager >> saveContactInSton [

	self contactFile asFileReference writeStreamDo: [ :arg1 |
		| tmp1 |
		tmp1 := STON writer.
		tmp1
			on: arg1;
			nextPut: (self contacts do: [ :arg2 | arg2 saveContactInSton ]) ]
]

{ #category : 'accessing' }
ICVCardManager >> selectFile [ 

	| selectedFile |
	((selectedFile := StOpenFilePresenter new openModal) notNil and: [
		 selectedFile isFile ])
	ifTrue: [ ^ selectedFile ]
]

{ #category : 'accessing' }
ICVCardManager >> vcard [

	^ vcard ifNil: [ vcard := ICVCard new ]
]
