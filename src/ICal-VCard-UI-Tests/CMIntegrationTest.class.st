Class {
	#name : 'CMIntegrationTest',
	#superclass : 'TestCase',
	#instVars : [
		'contactManager',
		'app',
		'nameContact1',
		'nameContact2',
		'vcard1',
		'vcard2',
		'presenter',
		'vcardManager',
		'fileSystem'
	],
	#category : 'ICal-VCard-UI-Tests',
	#package : 'ICal-VCard-UI-Tests'
}

{ #category : 'running' }
CMIntegrationTest >> setUp [

	super setUp.
	contactManager := ICVCardManager new.
	fileSystem := FileSystem memory.
	contactManager contactFile: fileSystem workingDirectory  / 'contact.ston'.
	app := ICVCardApp new.
	presenter := app newPresenter: ICVCardMainPresenter.
	vcardManager := presenter contactList vcardManager.

	nameContact1 := ICName new
		                givenName: 'Julie';
		                familyName: 'Mangui'.

	nameContact2 := ICName new
		                givenName: 'Fafa';
		                familyName: 'Poitier'.

	vcard1 := ICVCard new.
	vcard1
		name: nameContact1;
		addPhoneNumber: (ICPhoneNumber new number: '0514887520');
		addAddress: (ICAddress new
				 street: '18 rue Volet';
				 postalcode: '54510';
				 region: 'Charmont').

	vcard2 := ICVCard new.
	vcard2
		name: nameContact2;
		addPhoneNumber: (ICPhoneNumber new number: '0310225863')
]

{ #category : 'running' }
CMIntegrationTest >> tearDown [

	super tearDown
]

{ #category : 'tests' }
CMIntegrationTest >> testAddContact [

	| tmp1 tmp3 |
	tmp3 := ICName new.
	tmp3 familyName: 'claire'.
	tmp1 := tmp3 givenName: 'lune'.
	contactManager
		addContactName: tmp1
		phoneNumber1: '05664'
		address: '50 rue pont, 78000 bg'
		email: 'lune@gmail.com'
		birthday: '08-01-2000'
		phoneNumber2: ''
		photo: 'inria.png'.
	self assert: contactManager contacts size equals: 1
]

{ #category : 'tests' }
CMIntegrationTest >> testAddContact2 [

	| tmp1 tmp3 |
	tmp3 := ICName new.
	tmp3 familyName: 'claire'.
	tmp1 := tmp3 givenName: 'lune'.
	contactManager addContact: vcard1.
	self assert: contactManager contacts size equals: 1
]

{ #category : 'tests' }
CMIntegrationTest >> testContactDeletion [

	
]

{ #category : 'tests' }
CMIntegrationTest >> testContactExport [

	| tmp1 tmp2 |
	contactManager addContact: vcard1.
	tmp1 := contactManager readContactSton: fileSystem / 'contact.ston'.
	tmp2 := tmp1 asOrderedCollection last.
	self assert: tmp2 equals: vcard1
]

{ #category : 'tests' }
CMIntegrationTest >> testContactGrouping [

	
]

{ #category : 'tests' }
CMIntegrationTest >> testContactHistory [

	
]

{ #category : 'tests' }
CMIntegrationTest >> testContactImport [

	
]

{ #category : 'tests' }
CMIntegrationTest >> testContactMerge [

	
]

{ #category : 'tests' }
CMIntegrationTest >> testContactNotifications [

	
]

{ #category : 'tests' }
CMIntegrationTest >> testContactOwnership [

	
]

{ #category : 'tests' }
CMIntegrationTest >> testContactPermissions [

	
]

{ #category : 'tests' }
CMIntegrationTest >> testContactSearch [

	| tmp1 tmp2 tmp3 tmp4 |
	tmp3 := presenter contactsToolbar.
	tmp1 := 'Sarah'.
	tmp4 := tmp3 filteredContactFor: tmp1.
	self assert: tmp4 size equals: 0.
	tmp2 := 'jjj'.
	tmp4 := tmp3 filteredContactFor: tmp2.
	self assert: tmp4 size equals: 0
]

{ #category : 'tests' }
CMIntegrationTest >> testContactSharing [

	
]

{ #category : 'tests' }
CMIntegrationTest >> testContactSorting [

	
]

{ #category : 'tests' }
CMIntegrationTest >> testContactValidation [

	
]

{ #category : 'tests' }
CMIntegrationTest >> testDuplicateContactPrevention [

	
]

{ #category : 'tests' }
CMIntegrationTest >> testListContacts [

	
]

{ #category : 'tests' }
CMIntegrationTest >> testRemoveContact [

	contactManager
		addContact: vcard1;
		removeContact: (contactManager contacts at: 1).
	self assert: contactManager contacts isEmpty
]

{ #category : 'tests' }
CMIntegrationTest >> testRetrieveContact [

	
]

{ #category : 'tests' }
CMIntegrationTest >> testUpdateContact [

	
]
