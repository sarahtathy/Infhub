Class {
	#name : 'ICVCardNullPostalCodeException',
	#superclass : 'Exception',
	#category : 'ICal-VCard-Exception',
	#package : 'ICal-VCard',
	#tag : 'Exception'
}

{ #category : 'accessing' }
ICVCardNullPostalCodeException class >> exception: anAddress [

^ self signal: 'Code postal ', anAddress postalcode , ' is invalid, please correct!'
]
