"
CMMainPresenter is the main presenter class for the Contact Manager application, responsible for managing the presentation and interaction logic of the contact manager interface. It utilizes the Spec 2 library for building the user interface components.

CMMainPresenter provides functionalities for adding contacts, updating the contact list display, accessing selected contacts, and initializing the layout of the main window. It interacts with the ContactManager class to perform contact-related operations.

"
Class {
	#name : 'ICCMMainPresenter',
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
ICCMMainPresenter class >> buildCommandsGroupWith: presenter forRoot: rootCommandGroup [

	rootCommandGroup
		register:
			((CmCommandGroup named: 'contact manager commands') asSpecGroup
				register: ICCMAddVCardCommand forSpec;
				register: ICCMRemoveVCardCommand forSpec;
				yourself)
]

{ #category : 'operations' }
ICCMMainPresenter >> addContact [
	
	addPresenter openModal isOk
		ifFalse: [ ^ self ].
		
	self contactManager
		addContactName: addPresenter name
		phoneNumber: addPresenter phoneNumbers
		email: addPresenter email.
	
	self updateItems.
]

{ #category : 'accessing' }
ICCMMainPresenter >> contactManager [
	"Answer the receiver's <ContactManager>"

	^ self application contactManager
]

{ #category : 'accessing' }
ICCMMainPresenter >> contacts: aCollection [

	contactList items: aCollection.
]

{ #category : 'layout' }
ICCMMainPresenter >> defaultLayout [ 

	^ SpBoxLayout newTopToBottom 
		add: contactList;
		add: statusBar expand: false;
		yourself
]

{ #category : 'initialization' }
ICCMMainPresenter >> initialize [ 

	super initialize.
	model := self application contacts.
]

{ #category : 'initialization' }
ICCMMainPresenter >> initializeContactList [

	contactList := self newTable
		addColumn: (SpStringTableColumn new
			title: 'Name';
			evaluated: #name;
			yourself);
		addColumn: (SpStringTableColumn new 
			title: 'Number';
			evaluated: [ : contact | (contact phoneNumbers collect: #phoneNumber) joinUsing: ','  ];
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'Email';
			evaluated: [ : contact | (contact emailAddresses collect: #address) joinUsing: ',' ];
			yourself);
		contextMenu: [ (self rootCommandsGroup / 'contact manager commands') beRoot asMenuPresenter ];
		items: self contactManager contacts;
		yourself.
]

{ #category : 'initialization' }
ICCMMainPresenter >> initializePresenters [ 

	self initializeContactList.
	addPresenter := self instantiate: ICCMAddPresenter.
	statusBar := self newStatusBar.
]

{ #category : 'initialization' }
ICCMMainPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Contact Manager';
		initialExtent: 600 @ 400;
		toolbar: self newCMToolbar
]

{ #category : 'initialization' }
ICCMMainPresenter >> newCMToolbar [

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
ICCMMainPresenter >> removeContact [
	
	self contactManager removeContact: self selectedContact.
	self updateItems.
]

{ #category : 'accessing' }
ICCMMainPresenter >> selectedContact [
	"Answer a <ICVCard> representing the currently selected contact"
	
	^ contactList selectedItem
	
]

{ #category : 'operations' }
ICCMMainPresenter >> updateItems [

	contactList items: self contactManager contacts.
	self updatePresenter
]
