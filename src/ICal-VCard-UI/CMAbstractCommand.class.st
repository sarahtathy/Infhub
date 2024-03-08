"
Abstract class grouping common behavior for the Contact Manager application behavior.
"
Class {
	#name : 'CMAbstractCommand',
	#superclass : 'CmCommand',
	#category : 'ICal-VCard-UI-Command',
	#package : 'ICal-VCard-UI',
	#tag : 'Command'
}

{ #category : 'accessing' }
CMAbstractCommand >> contactManagerPresenter [
	"Answer the receiver's <CMMainPresenter> "

	^ context
]

{ #category : 'accessing' }
CMAbstractCommand >> selectedContact [
	"Answer a <ICVCard> representing the currently selected contact"
	
	^ self contactManagerPresenter selectedContact
	
]
