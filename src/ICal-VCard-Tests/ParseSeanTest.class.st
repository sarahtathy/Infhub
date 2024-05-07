Class {
	#name : 'ParseSeanTest',
	#superclass : 'ICVCardParserTest',
	#category : 'ICal-VCard-Tests',
	#package : 'ICal-VCard-Tests'
}

{ #category : 'tests - parsing' }
ParseSeanTest >> testParseSeanAddressFirst [ 

	cards := ICCardHandParser parseVCardString: self seanCardString.
	self assert: cards size equals: 1.
	card := cards anyOne.
	
	
	self assert: card addresses size equals: 2.
	address := card addresses first.
	
	self deny: address isHome.
	self deny: address isDomestic.
	self deny: address isInternational.
	self deny: address isParcel.
	self deny: address isPostal.
	self deny: address isPreferred.
	self assert: address isWork.
	
	self assert: address poBox isEmptyOrNil.
	self assert: address extended isEmptyOrNil.
	
	self assert: address street equals: '6 Christie Lane'.
	self assert: address locality equals: 'Stratham'.
	self assert: address region equals: 'NH'.
	self assert: address postalcode equals: '03885'.
	self assert: address country equals: 'USA'.
	
	
	
	
]

{ #category : 'tests - parsing' }
ParseSeanTest >> testParseSeanFirstAddress [
	
	cards := ICCardHandParser parseVCardString: self seanCardString.
	self assert: cards size equals: 1.
	card := cards anyOne.
	
	
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
	
	self assert: address street equals: '6 Christie Lane'.
	self assert: address locality equals: 'Stratham'.
	self assert: address region equals: 'NH'.
	self assert: address postalcode equals: '03885'.
	self assert: address country equals: 'USA'.
	
]

{ #category : 'tests - parsing' }
ParseSeanTest >> testParseSeanFirstEmailAddress [
	
	cards := ICCardHandParser parseVCardString: self seanCardString.
	self assert: cards size equals: 1.
	card := cards anyOne.
	
	self assert: card emailAddresses size equals: 2.
	emailAddress := card emailAddresses first.
	self assert: emailAddress address equals: 'sglazier@comcast.net'.
	self assert: emailAddress isWork.
	self assert: emailAddress isPreferred.
	self deny: emailAddress isHome.
	self assert: emailAddress isInternet.
	self deny: emailAddress isX400.
	
]

{ #category : 'tests - parsing' }
ParseSeanTest >> testParseSeanFirstPhoneNumber [

	cards := ICCardHandParser parseVCardString: self seanCardString.
	self assert: cards size equals: 1.
	card := cards anyOne.
	
	
	self assert: card phoneNumbers size equals: 4.
	phoneNumber := card phoneNumbers first.
	self assert: phoneNumber number equals: '603 772 4480'.
	self deny: phoneNumber isHome.
	self deny: phoneNumber isPreferred.
	self assert: phoneNumber isWork.
	self deny: phoneNumber isBulletinBoard.
	self deny: phoneNumber isCar.
	self deny: phoneNumber isCellular.
	self deny: phoneNumber isFax.
	self deny: phoneNumber isISDN.
	self deny: phoneNumber isModem.
	self deny: phoneNumber isPager.
	self assert: phoneNumber isVoice.
	self deny: phoneNumber isVoiceMessage.
	
	
]

{ #category : 'tests - parsing' }
ParseSeanTest >> testParseSeanFourthPhoneNumber [
	
	cards := ICCardHandParser parseVCardString: self seanCardString.
	self assert: cards size equals: 1.
	card := cards anyOne.
	
	self assert: card phoneNumbers size equals: 4.
	phoneNumber := card phoneNumbers fourth.
	self assert: phoneNumber number equals: '603 770 8260'.
	self deny: phoneNumber isHome.
	self deny: phoneNumber isPreferred.
	self deny: phoneNumber isWork.
	self deny: phoneNumber isBulletinBoard.
	self deny: phoneNumber isCar.
	self assert: phoneNumber isCellular.
	self deny: phoneNumber isFax.
	self deny: phoneNumber isISDN.
	self deny: phoneNumber isModem.
	self deny: phoneNumber isPager.
	self assert: phoneNumber isVoice.
	self deny: phoneNumber isVoiceMessage
]

{ #category : 'tests - parsing' }
ParseSeanTest >> testParseSeanName [

	cards := ICCardHandParser parseVCardString: self seanCardString.
	self assert: cards size equals: 1.
	card := cards anyOne.
	
	self assert: card fullname equals: 'Sean Glazier'.
	self assert: card version equals: 2.1.
	self assert: card title equals: 'Lead Software Engineer'.
	self assert: card birthday equals: (self dateClass year: 2005 month: 10 day: 01).
	name := card name.
	self assert: name notNil.
	self assert: name familyName equals: 'Glazier'.
	self assert: name givenName equals: 'Sean'.
	self assert: name additionalNames isEmptyOrNil.
	self assert: name honorificPrefixes isEmptyOrNil.
	self assert: name honorificSuffixes isEmptyOrNil.
	
]

{ #category : 'tests - parsing' }
ParseSeanTest >> testParseSeanSecondEmailAddress [
	
	cards := ICCardHandParser parseVCardString: self seanCardString.
	self assert: cards size equals: 1.
	card := cards anyOne.
	
	self assert: card emailAddresses size equals: 2.
	emailAddress := card emailAddresses second.
	self assert: emailAddress address equals: 'sglazier@comcast.net'.
	self deny: emailAddress isWork.
	self deny: emailAddress isPreferred.
	self assert: emailAddress isHome.
	self assert: emailAddress isInternet.
	self deny: emailAddress isX400.
]

{ #category : 'tests - parsing' }
ParseSeanTest >> testParseSeanSecondPhoneNumber [

	cards := ICCardHandParser parseVCardString: self seanCardString.
	self assert: cards size equals: 1.
	card := cards anyOne.
	
	phoneNumber := card phoneNumbers second.
	self assert: phoneNumber number equals: '603 770 8260'.
	self deny: phoneNumber isHome.
	self deny: phoneNumber isPreferred.
	self deny: phoneNumber isWork.
	self deny: phoneNumber isBulletinBoard.
	self deny: phoneNumber isCar.
	self assert: phoneNumber isCellular.
	self deny: phoneNumber isFax.
	self deny: phoneNumber isISDN.
	self deny: phoneNumber isModem.
	self deny: phoneNumber isPager.
	self assert: phoneNumber isVoice.
	self deny: phoneNumber isVoiceMessage.
	
]

{ #category : 'tests - parsing' }
ParseSeanTest >> testParseSeanThirdPhoneNumber [

	cards := ICCardHandParser parseVCardString: self seanCardString.
	self assert: cards size equals: 1.
	card := cards anyOne.
	
	phoneNumber := card phoneNumbers third.
	self assert: phoneNumber number equals: '603 772 2852'.
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
	self assert: phoneNumber isVoice.
	self deny: phoneNumber isVoiceMessage.
	
]
