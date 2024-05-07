Class {
	#name : 'ParseEricTest',
	#superclass : 'ICVCardParserTest',
	#category : 'ICal-VCard-Tests',
	#package : 'ICal-VCard-Tests'
}

{ #category : 'tests - parsing' }
ParseEricTest >> testParseEricAimids [

	cards := ICCardHandParser parseVCardString: self ericCardString.
	self assert: cards size equals: 1.
	card := cards anyOne.
	
	self assert: card aimids size equals: 1.	
	imid := card aimids anyOne.
	self assert: (imid isKindOf: ICAIMId).
	self assert: imid isPreferred.
	self deny: imid isWork.
	self assert: imid isHome.
	self assert: imid id equals: 'ericwahlforss'.
	
	
]

{ #category : 'tests - parsing' }
ParseEricTest >> testParseEricCategories [

	cards := ICCardHandParser parseVCardString: self ericCardString.
	self assert: cards size equals: 1.
	card := cards anyOne.
	
	self assert: card yahooids isEmpty.
	
	self assert: card categories size equals: 1.
	self assert: card categories anyOne summary equals: '24HDC'
	
]

{ #category : 'tests - parsing' }
ParseEricTest >> testParseEricIcqids [
	
	cards := ICCardHandParser parseVCardString: self ericCardString.
	self assert: cards size equals: 1.
	card := cards anyOne.
	
	self assert: card icqids size equals: 1.	
	imid := card icqids anyOne.
	self assert: (imid isKindOf: ICICQId).
	self assert: imid isPreferred.
	self assert: imid isWork.
	self deny: imid isHome.
	self assert: imid id equals: '5399905'.
	
]

{ #category : 'tests - parsing' }
ParseEricTest >> testParseEricMsnids [
	
	cards := ICCardHandParser parseVCardString: self ericCardString.
	self assert: cards size equals: 1.
	card := cards anyOne.
	
	self assert: card msnids size equals: 1.
	imid := card msnids anyOne.
	self assert: (imid isKindOf: ICMSNId).
	self deny: imid isPreferred.
	self deny: imid isWork.
	self assert: imid isHome.
	self assert: imid id equals: 'ericwahlforss@hotmail.com'.
	

	
]

{ #category : 'tests - parsing' }
ParseEricTest >> testParseEricName [
	
	cards := ICCardHandParser parseVCardString: self ericCardString.
	self assert: cards size equals: 1.
	card := cards anyOne.
	
	self assert: card fullname equals: 'Eric Wahlforss'.
	self assert: card title equals: 'Entrepreneur / Musician'.
	self assert: card url asVCardString equals: 'http://eric.wahlforss.com/'.
	self assert: card version equals: 3.0.
	name := card name.
	self assert: name notNil.
	self assert: name familyName equals: 'Wahlforss'.
	self assert: name givenName equals: 'Eric'.
	self assert: name additionalNames isEmptyOrNil.
	self assert: name honorificPrefixes isEmptyOrNil.
	self assert: name honorificSuffixes isEmptyOrNil.
	
	
]
