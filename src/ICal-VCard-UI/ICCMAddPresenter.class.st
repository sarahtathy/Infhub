Class {
	#name : 'ICCMAddPresenter',
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
ICCMAddPresenter >> defaultLayout [

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
ICCMAddPresenter >> email [
		
	^ emailText text
]

{ #category : 'initialization' }
ICCMAddPresenter >> initializeDialogWindow: aDialogPresenter [
	aDialogPresenter centered.
	aDialogPresenter
		addButton: 'Cancel' do: [ :presenter | presenter close ];
		addButton: 'Save' do: [ :presenter | presenter beOk;
	close ].


]

{ #category : 'initialization' }
ICCMAddPresenter >> initializePresenters [
	
	nameText := self newTextInput.
	emailText := self newTextInput.
	phoneNumber := self newTextInput

]

{ #category : 'initialization' }
ICCMAddPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter
	title: 'Contact';
	initialExtent: 400 @ 250

]

{ #category : 'layout' }
ICCMAddPresenter >> name [
	^ nameText text

]

{ #category : 'layout' }
ICCMAddPresenter >> phoneNumbers [
	^ phoneNumber text
		

]
