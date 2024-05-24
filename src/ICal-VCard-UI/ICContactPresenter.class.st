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
		'birthday'
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
ICContactPresenter >> address: anAddress [

	addressText text: anAddress 
]

{ #category : 'layout' }
ICContactPresenter >> birthday [  
	^ birthday text

]

{ #category : 'layout' }
ICContactPresenter >> birthday: aBirthday [ 

	birthday text: aBirthday 
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
			  add: phoneNumber2;
			  nextRow;
			  add: 'Address';
			  add: addressText;
			  nextRow;
			  add: 'Email';
			  add: emailText;
			  nextRow;
			  add: 'Birthday';
			  add: birthday ]
]

{ #category : 'layout' }
ICContactPresenter >> email [
		
	^ emailText text
]

{ #category : 'layout' }
ICContactPresenter >> email: anEmail [ 

	emailText text: anEmail 
]

{ #category : 'layout' }
ICContactPresenter >> initialExtentForWindow [

	^ (400 @300) scaledByDisplayScaleFactor
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

	nameText := self newTextInput.
	lastName := self newTextInput.
	addressText := self newTextInput.
	emailText := self newTextInput.
	phoneNumber1 := self instantiate: ICVCardPhonePresenter.
	phoneNumber2 := self instantiate: ICVCardPhonePresenter.
	birthday := self newTextInput
]

{ #category : 'initialization' }
ICContactPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Contact';
		initialExtent: self initialExtentForWindow 
]

{ #category : 'layout' }
ICContactPresenter >> lastname [ 
		
	^ lastName text
]

{ #category : 'layout' }
ICContactPresenter >> lastname: aLastName [

	lastName text: aLastName 
]

{ #category : 'layout' }
ICContactPresenter >> model: anICvcard [

	| vlastname vfirstname vname | 
	
	vname := anICvcard fullname splitOn: ' '.
	vfirstname := vname at: 1.
	vlastname := vname at: 2.
	self address: anICvcard addresses first.
	self name: vfirstname. 
	self lastname: vlastname.
	self email: anICvcard emailAddresses first.
	self birthday: anICvcard birthday
]

{ #category : 'layout' }
ICContactPresenter >> name [
	^ nameText text

]

{ #category : 'accessing' }
ICContactPresenter >> name: aName [ 

	nameText text: aName 
]

{ #category : 'layout' }
ICContactPresenter >> phoneNumber1 [
	^ phoneNumber1 text
		

]

{ #category : 'layout' }
ICContactPresenter >> phoneNumber1: number1 [ 

	phoneNumber1 text: number1 
]

{ #category : 'layout' }
ICContactPresenter >> phoneNumber2 [
	^ phoneNumber2 text
		

]

{ #category : 'layout' }
ICContactPresenter >> phoneNumber2: number2 [ 

	phoneNumber2 text: number2 
]
