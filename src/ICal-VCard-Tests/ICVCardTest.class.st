Class {
	#name : 'ICVCardTest',
	#superclass : 'ICTest',
	#instVars : [
		'vcard',
		'vaddress',
		'vemail',
		'vname'
	],
	#category : 'ICal-VCard-Tests',
	#package : 'ICal-VCard-Tests'
}

{ #category : 'running' }
ICVCardTest >> setUp [ 

super setUp. 
vcard := ICVCard new.


]

{ #category : 'tests' }
ICVCardTest >> testCreateAICVCard [

vcard name: 'Sarah'.
vcard fullname: 'Sarah ','Tathy'.
vcard nickname: 'srhT'.
vcard addEmailAddress: 'sarah.tathy@inria.fr'.
vcard addAddress: '40 Avenue Edmund Halley, 59560 Villeneuve d''Ascq'.
vcard addPhoneNumber: '0600000000'.

self assert: vcard name equals: 'Sarah'.
self assert: vcard fullname equals: 'Sarah Tathy'.
self assert: vcard nickname equals: 'srhT'.



]

{ #category : 'tests' }
ICVCardTest >> testCreateAddress [ 

|address | 
vaddress := ICAddress new.
vaddress country: 'France'.
vaddress postalcode: '59000'; street: '40 Avenue Halley'; region: 'Lille'.
vaddress asVCardString.
vcard addAddress: vaddress. 
address := vcard addresses anyOne.
self assert: address postalcode equals: '59000'.
self assert: address region equals: 'Lille'.
self assert: address street equals: '40 Avenue Halley'.



]

{ #category : 'tests' }
ICVCardTest >> testCreateName [ 
 
vname := ICName new.
vname familyName: 'Tathy'.
vname givenName: 'Sarah'.
vname asVCardString.

vcard name: vname. 
self assert: vcard name familyName equals: 'Tathy'.
self assert: vcard name givenName equals: 'Sarah'.



]
