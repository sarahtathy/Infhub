"
CMMainPresenter is the main presenter class for the Contact Manager application, responsible for managing the presentation and interaction logic of the contact manager interface. It utilizes the Spec 2 library for building the user interface components.

CMMainPresenter provides functionalities for adding contacts, updating the contact list display, accessing selected contacts, and initializing the layout of the main window. It interacts with the ContactManager class to perform contact-related operations.

"
Class {
	#name : 'ICVCardMainPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'statusBar',
		'model',
		'detailOfContactPresenter',
		'contactPresenter',
		'contactListPresenter',
		'contactsToolbarPresenter'
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
ICVCardMainPresenter >> clickFilmAtIndex: anIndex [

	contactPresenter clickAtIndex: anIndex

]

{ #category : 'operations' }
ICVCardMainPresenter >> contactList [

	^ contactListPresenter 
]

{ #category : 'initialization' }
ICVCardMainPresenter >> contactsToolbar [
	"This is a search and creator toolbar"

	^ contactsToolbarPresenter
]

{ #category : 'layout' }
ICVCardMainPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: contactsToolbarPresenter height: self toolbarHeight;
		  add: contactListPresenter; 
		  add: detailOfContactPresenter;
		  add: statusBar expand: false;
		  yourself
]

{ #category : 'operations' }
ICVCardMainPresenter >> detailOfContact [

	^ detailOfContactPresenter 
]

{ #category : 'initialization' }
ICVCardMainPresenter >> initialExtentForWindow [

	^ (840 @ 730) scaledByDisplayScaleFactor
]

{ #category : 'initialization' }
ICVCardMainPresenter >> initialize [

	super initialize.
	model := self vcardManager contacts.
]

{ #category : 'initialization' }
ICVCardMainPresenter >> initializeContactList [

	contactListPresenter := self instantiate: ICContactListPresenter
]

{ #category : 'initialization' }
ICVCardMainPresenter >> initializeContactsToolbar [
	"This is a search and creator toolbar"

	contactsToolbarPresenter := self
		                         instantiate: ICSearchCreatePresenter 
		                         on: self model
]

{ #category : 'initialization' }
ICVCardMainPresenter >> initializeDetailOfContact [

	detailOfContactPresenter := self instantiate: ICContactPresenter
]

{ #category : 'initialization' }
ICVCardMainPresenter >> initializePresenters [

	self initializeContactList.
	self initializeDetailOfContact.
	self initializeContactsToolbar.
	statusBar := self newStatusBar
]

{ #category : 'initialization' }
ICVCardMainPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Contact Manager';
		initialExtent: self initialExtentForWindow;
		toolbar: self newCMToolbar
]

{ #category : 'initialization' }
ICVCardMainPresenter >> model [

	^ self application vcardManager
]

{ #category : 'initialization' }
ICVCardMainPresenter >> newCMToolbar [

	^ self newToolbar
		  add: (self newToolbarButton
				   label: 'Add';
				   icon: (self iconNamed: #smallAdd);
				   action: [ self contactList addContact ];
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

{ #category : 'initialization' }
ICVCardMainPresenter >> removeContact [

	(self confirm: 'Are you sure you want to remove the contact ?')
		ifFalse: [ ^ self ].
	contactListPresenter removeContact
]

{ #category : 'layout' }
ICVCardMainPresenter >> toolbarHeight [

	^ self class toolbarHeight
]

{ #category : 'initialization' }
ICVCardMainPresenter >> updateDetail: anICvcard [

	anICvcard ifNotNil: [ detailOfContactPresenter updateModel: anICvcard ]
]

{ #category : 'initialization' }
ICVCardMainPresenter >> vcardManager [

	^ ICVCardManager uniqueInstance 
]
