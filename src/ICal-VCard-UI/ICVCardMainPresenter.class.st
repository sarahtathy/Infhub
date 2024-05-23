"
CMMainPresenter is the main presenter class for the Contact Manager application, responsible for managing the presentation and interaction logic of the contact manager interface. It utilizes the Spec 2 library for building the user interface components.

CMMainPresenter provides functionalities for adding contacts, updating the contact list display, accessing selected contacts, and initializing the layout of the main window. It interacts with the ContactManager class to perform contact-related operations.

"
Class {
	#name : 'ICVCardMainPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'contactList',
		'statusBar',
		'model',
		'addPresenter',
		'detailOfContact'
	],
	#category : 'ICal-VCard-UI-Spec',
	#package : 'ICal-VCard-UI',
	#tag : 'Spec'
}

{ #category : 'commands' }
ICVCardMainPresenter class >> buildCommandsGroupWith: presenter forRoot: rootCommandGroup [

	rootCommandGroup
		register:
			((CmCommandGroup named: 'contact manager commands') asSpecGroup
				register: ICAddVCardCommand forSpec;
				register: ICRemoveVCardCommand forSpec;
				yourself)
]

{ #category : 'operations' }
ICVCardMainPresenter >> addContact [
	
	addPresenter openModal isOk
		ifFalse: [ ^ self ].
		
	self contactManager
		addContactName: addPresenter name
		lastname: addPresenter lastname 
		phoneNumber1: addPresenter phoneNumber1  
		address: addPresenter address 
		email: addPresenter email
		birthday: addPresenter birthday
		phoneNumber2: addPresenter phoneNumber2.
	
	self updateItems.
]

{ #category : 'operations' }
ICVCardMainPresenter >> clickFilmAtIndex: anIndex [

	addPresenter contactList clickAtIndex: anIndex

]

{ #category : 'operations' }
ICVCardMainPresenter >> connectPresenters [ 

contactList transmitTo: detailOfContact .
]

{ #category : 'accessing' }
ICVCardMainPresenter >> contactManager [
	"Answer the receiver's <ContactManager>"

	^ ICVCardManager uniqueInstance 
]

{ #category : 'layout' }
ICVCardMainPresenter >> defaultLayout [ 

	^ SpBoxLayout newTopToBottom 
		add: contactList;
		add: detailOfContact; 
		add: statusBar expand: false;
		yourself
]

{ #category : 'operations' }
ICVCardMainPresenter >> detailOfContact [
 
	^detailOfContact 
]

{ #category : 'initialization' }
ICVCardMainPresenter >> initialExtentForWindow [ 

 ^ (900 @ 900) scaledByDisplayScaleFactor 
]

{ #category : 'initialization' }
ICVCardMainPresenter >> initialize [ 

	super initialize.
	model := self contactManager contacts.
]

{ #category : 'initialization' }
ICVCardMainPresenter >> initializePresenters [ 

	self initializePresenters.
	addPresenter := self instantiate: ICContactPresenter.
	statusBar := self newStatusBar.
	
	detailOfContact := self instantiate: ICContactPresenter. 
	detailOfContact editable: false 
]

{ #category : 'initialization' }
ICVCardMainPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Contact Manager';
		initialExtent: self initialExtentForWindow;
		toolbar: self newCMToolbar
]

{ #category : 'initialization' }
ICVCardMainPresenter >> newCMToolbar [

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
ICVCardMainPresenter >> removeContact [
	
	self contactManager removeContact: self selectedContact.
	self updateItems.
]

{ #category : 'accessing' }
ICVCardMainPresenter >> selectedContact [
	"Answer a <ICVCard> representing the currently selected contact"
	
	^ contactList selectedItem
	
]

{ #category : 'operations' }
ICVCardMainPresenter >> updateItems [

	contactList items: self contactManager contacts.
	self updatePresenter
]
