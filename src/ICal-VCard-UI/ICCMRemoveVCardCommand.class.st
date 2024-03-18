"
Implements the ""Remove contact"" operation in the Contact Manager application.
"
Class {
	#name : 'ICCMRemoveVCardCommand',
	#superclass : 'ICCMAbstractCommand',
	#category : 'ICal-VCard-UI-Command',
	#package : 'ICal-VCard-UI',
	#tag : 'Command'
}

{ #category : 'testing' }
ICCMRemoveVCardCommand >> canBeExecuted [ 

	^ self selectedContact notNil.
]

{ #category : 'executing' }
ICCMRemoveVCardCommand >> execute [

	(self confirm: 'Do you want to remove the selected contact?')
		ifTrue: [ self contactManagerPresenter removeContact: self selectedContact ]
]

{ #category : 'initialization' }
ICCMRemoveVCardCommand >> initialize [
	super initialize.
	self
		name: 'Remove';
		iconNamed: #glamorousRemove;
		description: 'Remove the selected contact from the contact manager'
]
