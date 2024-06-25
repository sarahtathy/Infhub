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
		'vcardGenerator'
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
ICVCardManager >> addContact [

	self contacts add: vcard.
	vcard := nil.
]

{ #category : 'initialization' }
ICVCardManager >> addContact: aContact [

	self contacts add: aContact.
	
]

{ #category : 'adding' }
ICVCardManager >> addContactAddress: anAddress [ 

	vcard addAddress: anAddress
]

{ #category : 'adding' }
ICVCardManager >> addContactBirthday: aBirthday [

	vcard birthday: aBirthday
]

{ #category : 'adding' }
ICVCardManager >> addContactEmail: anEmail [

	vcard addEmailAddress: anEmail 
]

{ #category : 'adding' }
ICVCardManager >> addContactFromFile: aContactName [

	| stream listOfInformation |
	stream := aContactName asFileReference readStream.
	listOfInformation := STON fromStream: stream.
	listOfInformation traceCr
]

{ #category : 'adding' }
ICVCardManager >> addContactName: aString lastname: aLastName [

	vcard fullname: aString , ' ' , aLastName
]

{ #category : 'adding' }
ICVCardManager >> addContactName: aString lastname: aString2 phoneNumber1: aString3 address: aString4 email: aString5 birthday: aString6 phoneNumber2: aString7 [
	"self addContact: (
		ICVCard new
			fullname: aString , ' ', aString2;
			name: (ICName new familyName: aString2; givenName: aString);
			addPhoneNumber: (ICPhoneNumber new number: aString3);
			addAddress: (ICAddress fromVCardString: aString4 parameters: Dictionary new) ;
			addEmailAddress: (ICEmailAddress new address: aString5);
			birthday: aString6;   
			yourself)"

	self addContact: (ICVCard new
			 fullname: aString , ' ' , aString2;
			 addPhoneNumber: aString3;
			 addPhoneNumber: aString7;
			 addAddress: aString4;
			 addEmailAddress: aString5;
			 birthday: aString6;
			 yourself)
]

{ #category : 'adding' }
ICVCardManager >> addContactName: icName phoneNumber1: aString3 address: aString4 email: aString5 birthday: aString6 phoneNumber2: aString7 [

	self addContact: (ICVCard new
			 name: icName;
			 addPhoneNumber: aString3;
			 addPhoneNumber: aString7;
			 addAddress: aString4;
			 addEmailAddress: aString5;
			 birthday: aString6;
			 yourself)
]

{ #category : 'adding' }
ICVCardManager >> addContactPhoneNumber1: phone1 [

	vcard addPhoneNumber: phone1 
]

{ #category : 'adding' }
ICVCardManager >> addContactPhoneNumber2: phone2 [

	vcard addPhoneNumber: phone2
]

{ #category : 'accessing' }
ICVCardManager >> contacts [
	^ contacts 
		ifNil: [ contacts := OrderedCollection new ]
]

{ #category : 'writing' }
ICVCardManager >> readContactSton: aContactSton [

	
	^ STON reader
		  on: aContactSton readStream;
		  next
]

{ #category : 'accessing' }
ICVCardManager >> removeContact: anICVCard [
	
	self contacts remove: anICVCard 
]

{ #category : 'initialization' }
ICVCardManager >> reset [

	UniqueInstance := nil.
]

{ #category : 'accessing' }
ICVCardManager >> vcard [

	^ vcard ifNil: [ vcard := ICVCard new ]
]

{ #category : 'writing' }
ICVCardManager >> writeInSton [

	'contacts.ston' asFileReference writeStreamDo: [ :stream |
		STON writer
			on: stream;
			nextPut: (self contacts do: [ :each | each writeInSton ]) ] 
]
