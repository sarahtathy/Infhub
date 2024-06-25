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
		'nameTextPresenter',
		'phoneNumber1Presenter',
		'phoneNumber2Presenter',
		'emailTextPresenter',
		'lastNameTextPresenter',
		'addressTextPresenter',
		'birthdayPresenter',
		'picturePresenter'
	],
	#category : 'ICal-VCard-UI-Spec',
	#package : 'ICal-VCard-UI',
	#tag : 'Spec'
}

{ #category : 'layout' }
ICContactPresenter >> address [

	^ addressTextPresenter text
]

{ #category : 'layout' }
ICContactPresenter >> address: anAddress [

	addressTextPresenter text: anAddress
]

{ #category : 'layout' }
ICContactPresenter >> birthday [

	^ birthdayPresenter text
]

{ #category : 'layout' }
ICContactPresenter >> birthday: aBirthday [

	birthdayPresenter text: aBirthday
]

{ #category : 'layout' }
ICContactPresenter >> defaultLayout [

	^ SpGridLayout build: [ :builder |
		  builder
			  beColumnNotHomogeneous;
			  add: 'Name';
			  add: nameTextPresenter;
			  nextRow;
			  add: 'Lastname';
			  add: lastNameTextPresenter ;
			  nextRow;
			  add: 'Principal phone number';
			  add: phoneNumber1Presenter;
			  nextRow;
			  add: 'Second phone number';
			  add: phoneNumber2Presenter;
			  nextRow;
			  add: 'Address';
			  add: addressTextPresenter;
			  nextRow;
			  add: 'Email';
			  add: emailTextPresenter;
			  nextRow;
			  add: 'Birthday';
			  add: birthdayPresenter;
			  nextRow;
			  add: 'Picture';
			  add: picturePresenter ]
]

{ #category : 'layout' }
ICContactPresenter >> email [

	^ emailTextPresenter text
]

{ #category : 'layout' }
ICContactPresenter >> email: anEmail [

	emailTextPresenter text: anEmail
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

	nameTextPresenter := self newTextInput.
	lastNameTextPresenter := self newTextInput.
	addressTextPresenter := self newTextInput.
	emailTextPresenter := self newTextInput.
	phoneNumber1Presenter := self instantiate: ICVCardPhonePresenter.
	phoneNumber2Presenter := self instantiate: ICVCardPhonePresenter.
	birthdayPresenter := self newTextInput.
	picturePresenter := self newImage
]

{ #category : 'initialization' }
ICContactPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Contact';
		initialExtent: self initialExtentForWindow 
]

{ #category : 'layout' }
ICContactPresenter >> lastname [

	^ lastNameTextPresenter text
]

{ #category : 'layout' }
ICContactPresenter >> lastname: aLastName [

	lastNameTextPresenter text: aLastName
]

{ #category : 'layout' }
ICContactPresenter >> model: anICvcard [

	| vlastname vfirstname vname firstNumber secondNumber|
	vname := anICvcard fullname splitOn: ' '.
	vfirstname := vname at: 1.
	vlastname := vname at: 2.
	firstNumber := anICvcard phoneNumbers at: 1.
	secondNumber := anICvcard phoneNumbers at: 2.
	self address: anICvcard addresses first.
	self name: vfirstname.
	self lastname: vlastname.
	self email: anICvcard emailAddresses first.
	self birthday: anICvcard birthday.
	self phoneNumber1: firstNumber.
	self phoneNumber2: secondNumber
]

{ #category : 'layout' }
ICContactPresenter >> name [

	^ nameTextPresenter text
]

{ #category : 'accessing' }
ICContactPresenter >> name: aName [

	nameTextPresenter text: aName
]

{ #category : 'layout' }
ICContactPresenter >> phoneNumber1 [

	^ phoneNumber1Presenter text
]

{ #category : 'layout' }
ICContactPresenter >> phoneNumber1: number1 [

	phoneNumber1Presenter text: number1
]

{ #category : 'layout' }
ICContactPresenter >> phoneNumber2 [

	^ phoneNumber2Presenter text
]

{ #category : 'layout' }
ICContactPresenter >> phoneNumber2: number2 [

	phoneNumber2Presenter text: number2
]
