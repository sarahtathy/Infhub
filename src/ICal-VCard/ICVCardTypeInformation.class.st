Class {
	#name : 'ICVCardTypeInformation',
	#superclass : 'ICTypeInformation',
	#category : 'ICal-VCard-Model',
	#package : 'ICal-VCard',
	#tag : 'Model'
}

{ #category : 'conversion' }
ICVCardTypeInformation >> conversionSelector [
	^#asVCardString
]
