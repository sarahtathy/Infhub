"
This is the Spec Application class for the Contact Manager.

To start the application, please evaluate:
```
ICCMMainApplication new start.
```
"
Class {
	#name : 'ICMainApplication',
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
ICMainApplication class >> menuNoteTakersOn: aBuilder [
	<worldMenu>

	(aBuilder item: #ICContactManager)
		parent: #Tools;
		label: 'The Contact Manager';
		icon: (self iconNamed: #catalog);
		action: [ ICMainApplication new run ];
		help: 'The Contact Manager';
		order: 630
]

{ #category : 'accessing' }
ICMainApplication >> contactManager [

	^ contactManager
]

{ #category : 'accessing' }
ICMainApplication >> contactManager: anObject [

	contactManager := anObject
]

{ #category : 'instance creation' }
ICMainApplication >> contacts [

	^ contacts
]

{ #category : 'accessing' }
ICMainApplication >> contacts: anObject [

	contacts := anObject
]

{ #category : 'initialization' }
ICMainApplication >> defaultContactManager [

	^ ICContactManager uniqueInstance 
]

{ #category : 'initialization' }
ICMainApplication >> initialize [

	super initialize.
	contacts := OrderedCollection new.
	contactManager := self defaultContactManager.
]

{ #category : 'running' }
ICMainApplication >> start [

	(ICMainPresenter newApplication: self) 
		"contacts: self contacts;"
		open
]
