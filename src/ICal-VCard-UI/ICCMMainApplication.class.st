"
This is the Spec Application class for the Contact Manager.

To start the application, please evaluate:
```
ICCMMainApplication new start.
```
"
Class {
	#name : 'ICCMMainApplication',
	#superclass : 'SpApplication',
	#instVars : [
		'contacts',
		'contactManager'
	],
	#category : 'ICal-VCard-UI-Spec',
	#package : 'ICal-VCard-UI',
	#tag : 'Spec'
}

{ #category : 'private' }
ICCMMainApplication class >> menuNoteTakersOn: aBuilder [
	<worldMenu>

	(aBuilder item: #ICContactManager)
		parent: #Tools;
		label: 'The Contact Manager';
		icon: (self iconNamed: #catalog);
		action: [ ICCMMainApplication new run ];
		help: 'The Contact Manager';
		order: 630
]

{ #category : 'accessing' }
ICCMMainApplication >> contactManager [

	^ contactManager
]

{ #category : 'accessing' }
ICCMMainApplication >> contactManager: anObject [

	contactManager := anObject
]

{ #category : 'instance creation' }
ICCMMainApplication >> contacts [

	^ contacts
]

{ #category : 'accessing' }
ICCMMainApplication >> contacts: anObject [

	contacts := anObject
]

{ #category : 'initialization' }
ICCMMainApplication >> defaultContactManager [

	^ ICContactManager uniqueInstance 
]

{ #category : 'instance creation' }
ICCMMainApplication >> defaultContacts [

	^ ICCardHandParser parseVCardString: ICVCardParserTest new aviCardString
]

{ #category : 'initialization' }
ICCMMainApplication >> initialize [

	super initialize.
	contacts := self defaultContacts.
	contactManager := self defaultContactManager.
]

{ #category : 'running' }
ICCMMainApplication >> start [

	(ICCMMainPresenter newApplication: self) 
		"contacts: self contacts;"
		open
]
