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
		'emailText'
	],
	#category : 'ICal-VCard-UI-Spec',
	#package : 'ICal-VCard-UI',
	#tag : 'Spec'
}

{ #category : 'layout' }
ICAddPresenter >> defaultLayout [

	^ SpGridLayout build: [ :builder |
		  builder
			  beColumnNotHomogeneous;
			  column: 2 withConstraints: #beExpand;
			  add: 'Name';
			  add: nameText;
			  nextRow;
			  add: 'PhoneNumbers';
			  add: phoneNumber;
			  nextRow;
			  add: 'Email';
			  add: emailText ]
]

{ #category : 'layout' }
ICAddPresenter >> email [
		
	^ emailText text
]

{ #category : 'initialization' }
ICAddPresenter >> initializeDialogWindow: aDialogPresenter [
	aDialogPresenter centered.
	aDialogPresenter
		addButton: 'Cancel' do: [ :presenter | presenter close ];
		addButton: 'Save' do: [ :presenter | presenter beOk;
	close ].


]

{ #category : 'initialization' }
ICAddPresenter >> initializePresenters [
	
	nameText := self newTextInput.
	emailText := self newTextInput.
	phoneNumber := self newTextInput

]

{ #category : 'initialization' }
ICAddPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter
	title: 'Contact';
	initialExtent: 400 @ 250

]

{ #category : 'layout' }
ICAddPresenter >> name [
	^ nameText text

]

{ #category : 'layout' }
ICAddPresenter >> phoneNumbers [
	^ phoneNumber text
		

]
