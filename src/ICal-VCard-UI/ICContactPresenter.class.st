"
This is the Spec Application class for adding a contact.

To start the application, please evaluate:
```
ICAddPresenter new open.
```
"
Class {
	#name : 'ICContactPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'nameText',
		'phoneNumber1',
		'phoneNumber2',
		'emailText',
		'lastName',
		'addressText',
		'birthday',
		'contactList'
	],
	#category : 'ICal-VCard-UI-Spec',
	#package : 'ICal-VCard-UI',
	#tag : 'Spec'
}

{ #category : 'layout' }
ICContactPresenter >> address [ 
	^ addressText text

]

{ #category : 'layout' }
ICContactPresenter >> birthday [  
	^ birthday text

]

{ #category : 'layout' }
ICContactPresenter >> defaultInputPort [ 

	^ SpModelPort newPresenter: self
]

{ #category : 'layout' }
ICContactPresenter >> defaultLayout [

	^ SpGridLayout build: [ :builder |
	  builder
		  beColumnNotHomogeneous;
		  column: 3 withConstraints: #beExpand;
		  add: 'Name';
		  add: nameText;
		  nextRow;
		  add: 'Lastname';
		  add: lastName;
		  nextRow;
		  add: 'Principal phone number';
		  add: phoneNumber1;
		  nextRow;
		  add: 'Second phone number';
		  add: phoneNumber2 ;
		  nextRow;
		  add: 'Address';
		  add: addressText ;
		  nextRow;
		  add: 'Email';
		  add: emailText;
		  nextRow; 
		  add: 'Birthday';
		  add: birthday ]




]

{ #category : 'layout' }
ICContactPresenter >> defaultOutputPort [ 

	^ contactList defaultOutputPort 
]

{ #category : 'layout' }
ICContactPresenter >> editable: aBoolean [

	nameText editable: aBoolean.
	addressText editable: aBoolean.
	emailText editable: aBoolean.
	lastName editable: aBoolean.
	birthday editable: aBoolean.
	phoneNumber1 editable: aBoolean.
	phoneNumber2 editable: aBoolean. 
]

{ #category : 'layout' }
ICContactPresenter >> email [
		
	^ emailText text
]

{ #category : 'layout' }
ICContactPresenter >> initializeContactList [

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
ICContactPresenter >> initializeDialogWindow: aDialogPresenter [	
	
	| cancelButton saveButton |
	
	aDialogPresenter centered.
   cancelButton := aDialogPresenter addButton: 'Cancel' do: [ :presenter | presenter close ].
   cancelButton icon: (self iconNamed: #smallCancel). "Appliquer le style visuel du bouton Cancel"
    
   saveButton := aDialogPresenter addButton: 'Save' do: [ :presenter | presenter beOk; close ].
	saveButton icon: (self iconNamed: #smallOk).
    
]

{ #category : 'initialization' }
ICContactPresenter >> initializePresenters [

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
ICContactPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter
	title: 'Contact';
	initialExtent: 400 @ 280

]

{ #category : 'layout' }
ICContactPresenter >> items: aCollection [ 

	contactList items: aCollection 
]

{ #category : 'layout' }
ICContactPresenter >> lastname [ 
		
	^ lastName text
]

{ #category : 'layout' }
ICContactPresenter >> name [
	^ nameText text

]

{ #category : 'layout' }
ICContactPresenter >> phoneNumber1 [
	^ phoneNumber1 text
		

]

{ #category : 'layout' }
ICContactPresenter >> phoneNumber2 [
	^ phoneNumber2 text
		

]

{ #category : 'layout' }
ICContactPresenter >> selectedItem [ 

	^ contactList selectedItem 
]
