Class {
	#name : 'SpCountryCodesPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'list',
		'dictionaryImages'
	],
	#category : 'ICal-VCard-UI-Spec',
	#package : 'ICal-VCard-UI',
	#tag : 'Spec'
}

{ #category : 'layout' }
SpCountryCodesPresenter >> asIdentifier: aFilename [
    " Private - Taken and adapted from Seaside "

    | mainPart |
    
    mainPart := (aFilename copyUpToLast: $.) 
		select: [ :each | each isAlphaNumeric or: [ each = $_ ] ].
    [ mainPart first isDigit ] whileTrue: [ mainPart := mainPart allButFirst ].
    ^ mainPart asLowercase copyReplaceAll: '_' with: ' '.

]

{ #category : 'layout' }
SpCountryCodesPresenter >> defaultLayout [ 

	^ SpBoxLayout newVertical 
			add: list height: 30;
			yourself 
]

{ #category : 'layout' }
SpCountryCodesPresenter >> flagsOfCountry [ 

	| aFilename | 
	
	dictionaryImages := Dictionary new. 
	aFilename := 'C:\Users\addos\OneDrive\Documents\tiny'.
	aFilename asFileReference entries do: [ : entry |
    dictionaryImages 
		at: ( self asIdentifier: entry name ) 
		put: entry asFileReference  ].
	
	

	
]

{ #category : 'layout' }
SpCountryCodesPresenter >> iconFor: imageEntry [
    "Return the flag corresponding to the country


    ^ self iconFromImage: image."
	| image | 
	
   image := imageEntry binaryReadStreamDo: [ :stream | Form fromBinaryStream: stream ].
	^ image 
]

{ #category : 'initialization' }
SpCountryCodesPresenter >> initializePresenters [ 

	self flagsOfCountry.
	list := SpDropListPresenter new.
	list items: dictionaryImages keys.
	list displayIcon: [ :item | self iconFor: (dictionaryImages at: item) ] .

	
	
]
