"
Implements the ""Remove contact"" operation in the Contact Manager application.
"
Class {
	#name : 'CMRemoveVCardCommand',
	#superclass : 'CMAbstractCommand',
	#category : 'ICal-VCard-UI-Command',
	#package : 'ICal-VCard-UI',
	#tag : 'Command'
}

{ #category : 'testing' }
CMRemoveVCardCommand >> canBeExecuted [ 

	^ self selectedContact notNil.
]

{ #category : 'executing' }
CMRemoveVCardCommand >> execute [

	self contactManagerPresenter removeContact: self selectedContact.
	self contactManagerPresenter updateItems
	
]

{ #category : 'initialization' }
CMRemoveVCardCommand >> initialize [
	super initialize.
	self
		name: 'Remove';
		iconNamed: #glamorousRemove;
		description: 'Remove the selected contact from the contact manager'
]
