Class {
	#name : 'CMIntegrationTests',
	#superclass : 'TestCase',
	#instVars : [
		'contactManager'
	],
	#category : 'ICal-VCard-UI-Tests',
	#package : 'ICal-VCard-UI-Tests'
}

{ #category : 'running' }
CMIntegrationTests >> setUp [

	super setUp.
	contactManager := ContactManager new.

]

{ #category : 'tests' }
CMIntegrationTests >> testAddContact [
]

{ #category : 'tests' }
CMIntegrationTests >> testContactDeletion [

]

{ #category : 'tests' }
CMIntegrationTests >> testContactExport [
]

{ #category : 'tests' }
CMIntegrationTests >> testContactGrouping [

]

{ #category : 'tests' }
CMIntegrationTests >> testContactHistory [
]

{ #category : 'tests' }
CMIntegrationTests >> testContactImport [

]

{ #category : 'tests' }
CMIntegrationTests >> testContactMerge [
]

{ #category : 'tests' }
CMIntegrationTests >> testContactNotifications [
	"Check that notifications related to contacts are appropriately triggered and handled within the contact manager"
]

{ #category : 'tests' }
CMIntegrationTests >> testContactOwnership [
]

{ #category : 'tests' }
CMIntegrationTests >> testContactPermissions [
]

{ #category : 'tests' }
CMIntegrationTests >> testContactSearch [

]

{ #category : 'tests' }
CMIntegrationTests >> testContactSharing [

]

{ #category : 'tests' }
CMIntegrationTests >> testContactSorting [

]

{ #category : 'tests' }
CMIntegrationTests >> testContactValidation [
]

{ #category : 'tests' }
CMIntegrationTests >> testDuplicateContactPrevention [

]

{ #category : 'tests' }
CMIntegrationTests >> testListContacts [

]

{ #category : 'tests' }
CMIntegrationTests >> testRemoveContact [
	"Test removing a single contact in the contact manager"

]

{ #category : 'tests' }
CMIntegrationTests >> testRetrieveContact [
	"Test obtaining a contact object"

]

{ #category : 'tests' }
CMIntegrationTests >> testUpdateContact [


]
