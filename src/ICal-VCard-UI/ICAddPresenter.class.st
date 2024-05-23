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
	lastName := self newTextInput.
	addressText := self newTextInput.
	birthday := self newTextInput. 
	"countryCodePresenter := SpCountryCodesPresenter new."

   phoneNumber1 := ICPhoneNumberPresenter new.
	phoneNumber1 initializePresenters.
   phoneNumber2 := ICPhoneNumberPresenter new. 
	phoneNumber2 initializePresenters
	
	
	
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
ICAddPresenter >> phoneNumber1 [
	^ phoneNumber1 text
		

]

{ #category : 'layout' }
ICAddPresenter >> phoneNumber2 [
	^ phoneNumber2 text
		

]
