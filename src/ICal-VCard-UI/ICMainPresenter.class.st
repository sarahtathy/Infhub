"
CMMainPresenter is the main presenter class for the Contact Manager application, responsible for managing the presentation and interaction logic of the contact manager interface. It utilizes the Spec 2 library for building the user interface components.

CMMainPresenter provides functionalities for adding contacts, updating the contact list display, accessing selected contacts, and initializing the layout of the main window. It interacts with the ContactManager class to perform contact-related operations.

"
Class {
	#name : 'ICMainPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'contactList',
		'statusBar',
		'model',
		'addPresenter'
	],
	#classVars : [
		'UniqueInstace'
	],
	#category : 'ICal-VCard-UI-Spec',
	#package : 'ICal-VCard-UI',
	#tag : 'Spec'
}

{ #category : 'commands' }
ICMainPresenter class >> buildCommandsGroupWith: presenter forRoot: rootCommandGroup [

	rootCommandGroup
		register:
			((CmCommandGroup named: 'contact manager commands') asSpecGroup
				register: ICAddVCardCommand forSpec;
				register: ICRemoveVCardCommand forSpec;
				yourself)
]

{ #category : 'operations' }
ICMainPresenter >> addContact [
	
	addPresenter openModal isOk
		ifFalse: [ ^ self ].
		
	self contactManager
		addContactName: addPresenter name
		lastname: addPresenter lastname 
		phoneNumber: addPresenter phoneNumbers
		address: addPresenter address 
		email: addPresenter email
		birthday: addPresenter birthday.
	
	self updateItems.
]

{ #category : 'accessing' }
ICMainPresenter >> contactManager [
	"Answer the receiver's <ContactManager>"

	^ ICContactManager uniqueInstance 
]

{ #category : 'accessing' }
ICMainPresenter >> contacts: aCollection [

	contactList items: aCollection.
]

{ #category : 'layout' }
ICMainPresenter >> defaultLayout [ 

	^ SpBoxLayout newTopToBottom 
		add: contactList;
		add: statusBar expand: false;
		yourself
]

{ #category : 'initialization' }
ICMainPresenter >> initialize [ 

	super initialize.
	model := self contactManager contacts.
]

{ #category : 'initialization' }
ICMainPresenter >> initializeContactList [

	contactList := self newTable
		"addColumn: (SpStringTableColumn new
			title: 'Name';
			evaluated: #name;
			yourself);"
		addColumn: (SpStringTableColumn new
			title: 'Fullname';
			evaluated: #fullname;
			yourself);	
		addColumn: (SpStringTableColumn new 
			title: 'Number';
			evaluated: [ : contact | (contact phoneNumbers "collect: #phoneNumber") joinUsing: ','  ];
			yourself);
		addColumn: (SpStringTableColumn new 
			title: 'Address';
			evaluated: [ : contact | (contact addresses "collect: #phoneNumber") joinUsing: ','  ];
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'Email';
			evaluated: [ : contact | (contact emailAddresses "collect: #address") joinUsing: ',' ];
			yourself);
		addColumn: (SpStringTableColumn new 
			title: 'Birthday';
			evaluated: #birthday;
			yourself);
		contextMenu: [ (self rootCommandsGroup / 'contact manager commands') beRoot asMenuPresenter ];
		items: self contactManager contacts;
		yourself.
]

{ #category : 'initialization' }
ICMainPresenter >> initializePresenters [ 

	self initializeContactList.
	addPresenter := self instantiate: ICAddPresenter.
	statusBar := self newStatusBar.
]

{ #category : 'initialization' }
ICMainPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Contact Manager';
		initialExtent: 600 @ 400;
		toolbar: self newCMToolbar
]

{ #category : 'initialization' }
ICMainPresenter >> newCMToolbar [

	^ self newToolbar
		  add: (self newToolbarButton
				   label: 'Add';
				   icon: (self iconNamed: #smallAdd);
				   action: [ self addContact ];
				   yourself);
		  add: (self newToolbarButton
				   label: 'Remove';
				   icon: (self iconNamed: #smallDelete);
				   action: [ self removeContact ];
				   yourself);
		  add: (self newToolbarButton
				   label: 'Help';
				   icon: (self iconNamed: #smallHelp);
				   action: [ self openHelp ];
				   yourself);
		  add: (self newToolbarButton
				   label: 'Quit';
				   icon: (self iconNamed: #smallQuit);
				   action: [ self delete ];
				   yourself);
		  yourself
]

{ #category : 'operations' }
ICMainPresenter >> removeContact [
	
	self contactManager removeContact: self selectedContact.
	self updateItems.
]

{ #category : 'accessing' }
ICMainPresenter >> selectedContact [
	"Answer a <ICVCard> representing the currently selected contact"
	
	^ contactList selectedItem
	
]

{ #category : 'operations' }
ICMainPresenter >> updateItems [

	contactList items: self contactManager contacts.
	self updatePresenter
]
