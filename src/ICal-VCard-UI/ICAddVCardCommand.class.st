"
Implements the ""Add contact"" operation in the Contact Manager application.
"
Class {
	#name : 'ICAddVCardCommand',
	#superclass : 'ICAbstractCommand',
	#category : 'ICal-VCard-UI-Command',
	#package : 'ICal-VCard-UI',
	#tag : 'Command'
}

{ #category : 'executing' }
ICAddVCardCommand >> execute [

	context "..."
]

{ #category : 'initialization' }
ICAddVCardCommand >> initialize [
	super initialize.
	self
		name: 'Add';
		iconNamed: #glamorousAdd;
		description: 'Add a new Contact'
]
