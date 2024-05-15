"
When the vcard's address is null , it's called the class 'ICVCardNullAddressException' for giving an error message.

"
Class {
	#name : 'ICVCardNullAddressException',
	#superclass : 'Exception',
	#category : 'ICal-VCard-Exception',
	#package : 'ICal-VCard',
	#tag : 'Exception'
}

{ #category : 'accessing' }
ICVCardNullAddressException class >> exception: anVcard [

^ self signal: 'The Vcard: ' , anVcard fullname, ' has a nil address!'
]
