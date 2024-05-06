"
Abstract class grouping common behavior for the Contact Manager application behavior.
"
Class {
	#name : 'ICAbstractCommand',
	#superclass : 'CmCommand',
	#category : 'ICal-VCard-UI-Command',
	#package : 'ICal-VCard-UI',
	#tag : 'Command'
}

{ #category : 'accessing' }
ICAbstractCommand >> contactManagerPresenter [
	"Answer the receiver's <CMMainPresenter> "

	^ context
]

{ #category : 'accessing' }
ICAbstractCommand >> selectedContact [
	"Answer a <ICVCard> representing the currently selected contact"
	
	^ self contactManagerPresenter selectedContact
	
]
