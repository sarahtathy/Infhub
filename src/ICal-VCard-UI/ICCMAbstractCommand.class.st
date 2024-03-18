"
Abstract class grouping common behavior for the Contact Manager application behavior.
"
Class {
	#name : 'ICCMAbstractCommand',
	#superclass : 'CmCommand',
	#category : 'ICal-VCard-UI-Command',
	#package : 'ICal-VCard-UI',
	#tag : 'Command'
}

{ #category : 'accessing' }
ICCMAbstractCommand >> contactManagerPresenter [
	"Answer the receiver's <CMMainPresenter> "

	^ context
]

{ #category : 'accessing' }
ICCMAbstractCommand >> selectedContact [
	"Answer a <ICVCard> representing the currently selected contact"
	
	^ self contactManagerPresenter selectedContact
	
]
