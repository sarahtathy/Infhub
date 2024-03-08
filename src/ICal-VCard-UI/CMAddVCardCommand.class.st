"
Implements the ""Add contact"" operation in the Contact Manager application.
"
Class {
	#name : 'CMAddVCardCommand',
	#superclass : 'CMAbstractCommand',
	#category : 'ICal-VCard-UI-Command',
	#package : 'ICal-VCard-UI',
	#tag : 'Command'
}

{ #category : 'executing' }
CMAddVCardCommand >> execute [

	context "..."
]

{ #category : 'initialization' }
CMAddVCardCommand >> initialize [
	super initialize.
	self
		name: 'Add';
		iconNamed: #glamorousAdd;
		description: 'Add a new Contact'
]
