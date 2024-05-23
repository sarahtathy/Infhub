"
This is the Spec Application class for the Contact Manager.

To start the application, please evaluate:
```
ICCMMainApplication new start.
```
"
Class {
	#name : 'ICVCardApp',
	#superclass : 'SpApplication',
	#instVars : [
		'contactManager'
	],
	#category : 'ICal-VCard-UI-Spec',
	#package : 'ICal-VCard-UI',
	#tag : 'Spec'
}

{ #category : 'private' }
ICVCardApp class >> menuNoteTakersOn: aBuilder [
	<worldMenu>

	(aBuilder item: #ICVCardManager)
		parent: #Tools;
		label: 'The Contact Manager';
		icon: (self iconNamed: #catalog);
		action: [ ICVCardApp new run ];
		help: 'The Contact Manager';
		order: 630
]

{ #category : 'accessing' }
ICVCardApp >> contactManager [

	^ contactManager
]

{ #category : 'accessing' }
ICVCardApp >> contactManager: anObject [

	contactManager := anObject
]

{ #category : 'initialization' }
ICVCardApp >> defaultContactManager [

	^ ICVCardManager uniqueInstance 
]

{ #category : 'initialization' }
ICVCardApp >> initialize [

	super initialize.
	contactManager := self defaultContactManager.
]

{ #category : 'running' }
ICVCardApp >> start [

	(ICVCardMainPresenter newApplication: self) 
		"contacts: self contacts;"
		open
]
