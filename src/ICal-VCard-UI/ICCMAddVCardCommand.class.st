"
Implements the ""Add contact"" operation in the Contact Manager application.
"
Class {
	#name : 'ICCMAddVCardCommand',
	#superclass : 'ICCMAbstractCommand',
	#category : 'ICal-VCard-UI-Command',
	#package : 'ICal-VCard-UI',
	#tag : 'Command'
}

{ #category : 'executing' }
ICCMAddVCardCommand >> execute [

	context "..."
]

{ #category : 'initialization' }
ICCMAddVCardCommand >> initialize [
	super initialize.
	self
		name: 'Add';
		iconNamed: #glamorousAdd;
		description: 'Add a new Contact'
]
