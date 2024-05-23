"
This class provides the displayer of phone numbers for the class `ICAddPresenter`.
"
Class {
	#name : 'ICPhoneNumberPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'textField',
		'countryCodePresenter',
		'selectedCountry'
	],
	#category : 'ICal-VCard-UI-Spec',
	#package : 'ICal-VCard-UI',
	#tag : 'Spec'
}

{ #category : 'initialization' }
ICPhoneNumberPresenter >> country [ 

	^ selectedCountry 
]

{ #category : 'layout' }
ICPhoneNumberPresenter >> defaultLayout [ 

	^ SpBoxLayout newLeftToRight 
		add: countryCodePresenter width:70;
		add: textField width: 100;
		yourself 
]

{ #category : 'initialization' }
ICPhoneNumberPresenter >> initializePresenters [ 

countryCodePresenter := SpCountryCodesPresenter new.
countryCodePresenter initializePresenters.

textField := self newTextInput.
selectedCountry := ''
]

{ #category : 'initialization' }
ICPhoneNumberPresenter >> text [ 

	^ textField text
]

{ #category : 'initialization' }
ICPhoneNumberPresenter >> updateCountry [ 

selectedCountry := countryCodePresenter selectedItem
]
