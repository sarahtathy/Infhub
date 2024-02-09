Class {
	#name : 'ICOrganizationTest',
	#superclass : 'ICTest',
	#category : 'ICal-VCard-Tests',
	#package : 'ICal-VCard-Tests'
}

{ #category : 'testing' }
ICOrganizationTest >> testABCInc [
	| organization string |
	string := 'ABC\, Inc.;North American Division;Marketing'.
	organization := ICOrganization fromICalString: string.
	self assert: organization name equals: 'ABC, Inc.'.
	self assert: organization unitNames size equals: 2.
	self assert: organization unitNames first equals: 'North American Division'.
	self assert: organization unitNames second equals: 'Marketing'.
	self assert: organization asVCardString equals: string
]

{ #category : 'testing' }
ICOrganizationTest >> testUnibe [
	| organization string |
	string := 'University of Bern'.
	organization := ICOrganization fromICalString: string.
	self assert: organization name equals: 'University of Bern'.
	self assert: organization unitNames isEmpty.
	self assert: organization asVCardString equals: string
]
