"
This is the Spec Application class for adding a contact.

To start the application, please evaluate:
```
ICAddPresenter new open.
```
"
Class {
	#name : 'ICAddPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'nameText',
		'phoneNumber',
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
ICAddPresenter >> address [ 
	^ addressText text

]

{ #category : 'layout' }
ICAddPresenter >> birthday [  
	^ birthday text

]

{ #category : 'layout' }
ICAddPresenter >> defaultLayout [

	^ SpGridLayout build: [ :builder |
	  builder
		  beColumnNotHomogeneous;
		  column: 2 withConstraints: #beExpand;
		  add: 'Name';
		  add: nameText;
		  nextRow;
		  add: 'Lastname';
		  add: lastName;
		  nextRow;
		  add: 'PhoneNumbers';
		  add: phoneNumber;
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
ICAddPresenter >> email [
		
	^ emailText text
]

{ #category : 'initialization' }
ICAddPresenter >> initializeDialogWindow: aDialogPresenter [	
	
	| cancelButton saveButton |
	
	aDialogPresenter centered.
   cancelButton := aDialogPresenter addButton: 'Cancel' do: [ :presenter | presenter close ].
   cancelButton icon: (self iconNamed: #smallCancel). "Appliquer le style visuel du bouton Cancel"
    
   saveButton := aDialogPresenter addButton: 'Save' do: [ :presenter | presenter beOk; close ].
	saveButton icon: (self iconNamed: #smallOk).
    
]

{ #category : 'initialization' }
ICAddPresenter >> initializePresenters [
	
	nameText := self newTextInput.
	emailText := self newTextInput.
	phoneNumber := self newTextInput.
	lastName := self newTextInput.
	addressText := self newTextInput.
	birthday := self newTextInput. 
	"example : '2024-05-14 for a birthday date. 
	
	day := self newNumberInput 
				rangeMinimum: 1 maximum: 31.
	year := self newNumberInput
				rangeMinimum: 1900 maximum: Year current year;
				yourself. 
	month := self newNumberInput
				rangeMinimum: 1 maximum: 12;
				yourself."
				
	 
	

]

{ #category : 'initialization' }
ICAddPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter
	title: 'Contact';
	initialExtent: 400 @ 280

]

{ #category : 'layout' }
ICAddPresenter >> lastname [ 
		
	^ lastName text
]

{ #category : 'layout' }
ICAddPresenter >> name [
	^ nameText text

]

{ #category : 'layout' }
ICAddPresenter >> phoneNumbers [
	^ phoneNumber text
		

]
