Class {
	#name : 'ParseOscarTest',
	#superclass : 'ICVCardParserTest',
	#category : 'ICal-VCard-Tests',
	#package : 'ICal-VCard-Tests'
}

{ #category : 'tests - parsing' }
ParseOscarTest >> testParseOscarEmailAddress [

	cards := ICCardHandParser parseVCardString: self oscarCardString.
	self assert: cards size equals: 1.
	card := cards anyOne.
	
	self assert: card emailAddresses size equals: 1.
	emailAddress := card emailAddresses first.
	self assert: emailAddress address equals: 'oscar.nierstrasz@acm.org'.
	self assert: emailAddress isWork.
	self assert: emailAddress isPreferred.
	self deny: emailAddress isHome.
	self assert: emailAddress isInternet.
	self deny: emailAddress isX400.
	

]

{ #category : 'tests - parsing' }
ParseOscarTest >> testParseOscarFirstAddress [
	
	cards := ICCardHandParser parseVCardString: self oscarCardString.
	self assert: cards size equals: 1.
	card := cards anyOne.
	
	self assert: card addresses size equals: 3.
	address := card addresses first.
	
	self deny: address isHome.
	self deny: address isDomestic.
	self deny: address isInternational.
	self deny: address isParcel.
	self deny: address isPostal.
	self assert: address isPreferred.
	self assert: address isWork.
	
	self assert: address poBox isEmptyOrNil.
	self assert: address extended isEmptyOrNil.
	
	self assert: address street equals: 'Software Composition Group
IAM, University of Bern
Neubrueckstrasse 10'.
	self assert: address locality equals: 'Bern'.
	self assert: address region isEmptyOrNil.
	self assert: address postalcode equals: 'CH-3012'.
	self assert: address country equals: 'SWITZERLAND'.
	
	
	
]

{ #category : 'tests - parsing' }
ParseOscarTest >> testParseOscarName [ 
	
	cards := ICCardHandParser parseVCardString: self oscarCardString.
	self assert: cards size equals: 1.
	card := cards anyOne.
	
	self assert: card fullname equals: 'Oscar2 Nierstrasz'.
	self assert: card version equals: 3.0.
	self assert: card title equals: 'Professor'.
	
	name := card name.
	self assert: name notNil.
	self assert: name familyName equals: 'Nierstrasz'.
	self assert: name givenName equals: 'Oscar'.
	self assert: name additionalNames isEmptyOrNil.
	self assert: name honorificPrefixes isEmptyOrNil.
	self assert: name honorificSuffixes isEmptyOrNil.
	
	
	

]

{ #category : 'tests - parsing' }
ParseOscarTest >> testParseOscarOrganization [
	| organization |
	cards := ICCardHandParser parseVCardString: self oscarCardString.
	self assert: cards size equals: 1.
	card := cards anyOne.
	
	
	organization := card organization.
	self assert: organization name equals: 'University of Bern'.
	self assert: organization unitNames isEmpty.
]

{ #category : 'tests - parsing' }
ParseOscarTest >> testParseOscarPhoneNumber [

	cards := ICCardHandParser parseVCardString: self oscarCardString.
	self assert: cards size equals: 1.
	card := cards anyOne.
	
	self assert: card phoneNumbers size equals: 3.
	phoneNumber := card phoneNumbers first.
	self assert: phoneNumber number equals: '+41 31 631.4618'.
	self deny: phoneNumber isHome.
	self assert: phoneNumber isPreferred.
	self assert: phoneNumber isWork.
	self deny: phoneNumber isBulletinBoard.
	self deny: phoneNumber isCar.
	self deny: phoneNumber isCellular.
	self deny: phoneNumber isFax.
	self deny: phoneNumber isISDN.
	self deny: phoneNumber isModem.
	self deny: phoneNumber isPager.
	self deny: phoneNumber isVoice.
	self deny: phoneNumber isVoiceMessage.
	
	phoneNumber := card phoneNumbers second.
	self assert: phoneNumber number equals: '+41 31 961.7065'.
	self assert: phoneNumber isHome.
	self deny: phoneNumber isPreferred.
	self deny: phoneNumber isWork.
	self deny: phoneNumber isBulletinBoard.
	self deny: phoneNumber isCar.
	self deny: phoneNumber isCellular.
	self deny: phoneNumber isFax.
	self deny: phoneNumber isISDN.
	self deny: phoneNumber isModem.
	self deny: phoneNumber isPager.
	self deny: phoneNumber isVoice.
	self deny: phoneNumber isVoiceMessage.
	
	phoneNumber := card phoneNumbers third.
	self assert: phoneNumber number equals: '+41 31 631.3355'.
	self deny: phoneNumber isHome.
	self deny: phoneNumber isPreferred.
	self assert: phoneNumber isWork.
	self deny: phoneNumber isBulletinBoard.
	self deny: phoneNumber isCar.
	self deny: phoneNumber isCellular.
	self assert: phoneNumber isFax.
	self deny: phoneNumber isISDN.
	self deny: phoneNumber isModem.
	self deny: phoneNumber isPager.
	self deny: phoneNumber isVoice.
	self deny: phoneNumber isVoiceMessage.
	
]

{ #category : 'tests - parsing' }
ParseOscarTest >> testParseOscarSecondAddress [
	
	cards := ICCardHandParser parseVCardString: self oscarCardString.
	self assert: cards size equals: 1.
	card := cards anyOne.
	
	self assert: card addresses size equals: 3.
	
	address := card addresses second.
	
	self assert: address isHome.
	self deny: address isDomestic.
	self deny: address isInternational.
	self deny: address isParcel.
	self deny: address isPostal.
	self deny: address isPreferred.
	self deny: address isWork.
	
	self assert: address poBox isEmptyOrNil.
	self assert: address extended isEmptyOrNil.
	
	self assert: address street equals: 'Fluhmattweg 41'.
	self assert: address locality equals: 'Kehrsatz'.
	self assert: address region isEmptyOrNil.
	self assert: address postalcode equals: '3122'.
	self assert: address country equals: 'SWITZERLAND'.
	
]

{ #category : 'tests - parsing' }
ParseOscarTest >> testParseOscarThirdAddress [
	
	cards := ICCardHandParser parseVCardString: self oscarCardString.
	self assert: cards size equals: 1.
	card := cards anyOne.
	
	self assert: card addresses size equals: 3.
	
	address := card addresses third.

	self assert: address isHome.
	self deny: address isDomestic.
	self deny: address isInternational.
	self deny: address isParcel.
	self deny: address isPostal.
	self deny: address isPreferred.
	self deny: address isWork.

	self assert: address poBox isEmptyOrNil.
	self assert: address extended isEmptyOrNil.

	self assert: address street equals: 'Schuetzenmattstrasse 14, room 103'.
	self assert: address locality isEmptyOrNil.
	self assert: address region isEmptyOrNil.
	self assert: address postalcode isEmptyOrNil.
	self assert: address country isEmptyOrNil.
	

]

{ #category : 'tests - parsing' }
ParseOscarTest >> testParseOscarUrl [

	cards := ICCardHandParser parseVCardString: self oscarCardString.
	self assert: cards size equals: 1.
	card := cards anyOne.

	self assert: card url asVCardString equals: 'http://www.iam.unibe.ch/~oscar/'.
	
]
