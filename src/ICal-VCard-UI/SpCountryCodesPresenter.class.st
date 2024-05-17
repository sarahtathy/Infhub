Class {
	#name : 'SpCountryCodesPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'list',
		'countryData'
	],
	#category : 'ICal-VCard-UI-Spec',
	#package : 'ICal-VCard-UI',
	#tag : 'Spec'
}

{ #category : 'as yet unclassified' }
SpCountryCodesPresenter >> defaultLayout [ 

	^ SpBoxLayout newVertical 
		add: (SpBoxLayout newLeftToRight 
			add: list;
			yourself);
		yourself 
]

{ #category : 'as yet unclassified' }
SpCountryCodesPresenter >> iconFor: countryCode [
    "Return the flag corresponding to the country"

  | url |
    url := self urlForCountryCode: countryCode.
    ^ self iconFromUrl: url.
]

{ #category : 'as yet unclassified' }
SpCountryCodesPresenter >> iconFromUrl: url [

	| image |
	image := ZnEasy get: url.

	^ (Form fromBinaryStream: image contents readStream) scaledToSize:
		  16 @ 16
]

{ #category : 'as yet unclassified' }
SpCountryCodesPresenter >> initializePresenters [
	
	self loadCountryData.
	list := self newDropList.
	list
		items: (countryData collect: [:each | each at: 'cca2']);
		displayIcon: [ :elem | self iconFor: elem ].
]

{ #category : 'as yet unclassified' }
SpCountryCodesPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'test';
		initialExtent: 400 @ 100
]

{ #category : 'as yet unclassified' }
SpCountryCodesPresenter >> loadCountryData [
 
	|jsonResponse | 
	jsonResponse := ZnEasy get: 'https://restcountries.com/v3.1/all'.
	countryData := NeoJSONReader fromString: jsonResponse contents. 
]

{ #category : 'as yet unclassified' }
SpCountryCodesPresenter >> urlForCountryCode: countryCode [ 

	^ 'https://flagcdn.com/w320/' , countryCode asLowercase , '.png'.
]
