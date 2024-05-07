Class {
	#name : 'ParseAviTest',
	#superclass : 'ICVCardParserTest',
	#category : 'ICal-VCard-Tests',
	#package : 'ICal-VCard-Tests'
}

{ #category : 'tests - parsing' }
ParseAviTest >> testParseAviAddress [

	cards := ICCardHandParser parseVCardString: self aviCardString.

	self assert: cards size equals: 1.
	card := cards anyOne.
	
	self assert: card addresses size equals: 1.
	address := card addresses anyOne.
	
	self assert: address isHome.
	self deny: address isDomestic.
	self deny: address isInternational.
	self deny: address isParcel.
	self deny: address isPostal.
	self assert: address isPreferred.
	self deny: address isWork.
	
	self assert: address poBox isEmptyOrNil.
	self assert: address extended isEmptyOrNil.
	
	self assert: address street equals: 'xxx E. xx Ave'.
	self assert: address locality equals: 'Vancouver'.
	self assert: address region equals: 'BC'.
	self assert: address postalcode equals: 'V5V 1E3'.
	self assert: address country equals: 'Canada'.
	
]

{ #category : 'tests - parsing' }
ParseAviTest >> testParseAviAimids [

	cards := ICCardHandParser parseVCardString: self aviCardString.

	self assert: cards size equals: 1.
	card := cards anyOne.
	
	self assert: card photo iCalType equals: 'BINARY'.
	
	self assert: card aimids size equals: 1.
	imid := card aimids anyOne.
	self assert: (imid isKindOf: ICAIMId).
	self assert: imid isPreferred.
	self deny: imid isWork.
	self deny: imid isHome.
	self assert: imid id equals: 'avbry'.
	
	self assert: card icqids isEmpty.
	
	self assert: card msnids size equals: 1.
	imid := card msnids anyOne.
	self assert: (imid isKindOf: ICMSNId).
	self assert: imid isPreferred.
	self deny: imid isWork.
	self deny: imid isHome.
	self assert: imid id equals: 'avi666@hotmail.com'.
	

	
]

{ #category : 'tests - parsing' }
ParseAviTest >> testParseAviEmailAddress [ 
	
	cards := ICCardHandParser parseVCardString: self aviCardString.

	self assert: cards size equals: 1.
	card := cards anyOne.
	
	self assert: card emailAddresses size equals: 2.
	emailAddress := card emailAddresses first.
	self assert: emailAddress address equals: 'avi@smallthought.com'.
	self assert: emailAddress isWork.
	self assert: emailAddress isPreferred.
	self deny: emailAddress isHome.
	self assert: emailAddress isInternet.
	self deny: emailAddress isX400.
	
	
	emailAddress := card emailAddresses second.
	self assert: emailAddress address equals: 'avi.bryant@gmail.com'.
	self deny: emailAddress isWork.
	self deny: emailAddress isPreferred.
	self assert: emailAddress isHome.
	self assert: emailAddress isInternet.
	self deny: emailAddress isX400.
	
	
]

{ #category : 'tests - parsing' }
ParseAviTest >> testParseAviName [

	cards := ICCardHandParser parseVCardString: self aviCardString.

	self assert: cards size equals: 1.
	card := cards anyOne.
	
	self assert: card fullname equals: 'Avi Bryant'.
	self assert: card version equals: 3.0.
	name := card name.
	self assert: name notNil.
	self assert: name familyName equals: 'Bryant'.
	self assert: name givenName equals: 'Avi'.
	self assert: name additionalNames isEmptyOrNil.
	self assert: name honorificPrefixes isEmptyOrNil.
	self assert: name honorificSuffixes isEmptyOrNil.
	
]

{ #category : 'tests - parsing' }
ParseAviTest >> testParseAviPhoneNumber [

	cards := ICCardHandParser parseVCardString: self aviCardString.

	self assert: cards size equals: 1.
	card := cards anyOne.
	
	self assert: card phoneNumbers size equals: 1.
	phoneNumber := card phoneNumbers first.
	self assert: phoneNumber number equals: '(778) xxx-xxxx'.
	self assert: phoneNumber isHome.
	self assert: phoneNumber isPreferred.
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
	
	
]

{ #category : 'tests - parsing' }
ParseAviTest >> testParseAviPosition [ 
	
	cards := ICCardHandParser parseVCardString: self aviCardString.

	self assert: cards size equals: 1.
	card := cards anyOne.
	
	
	self assert: card yahooids isEmpty.
	self assert: (card timeZone isKindOf: ICUtcOffset).
	self assert: card timeZone totalSeconds equals: (5 * 60 * 60) negated
	
]
