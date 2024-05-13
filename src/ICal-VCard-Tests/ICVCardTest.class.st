Class {
	#name : 'ICVCardTest',
	#superclass : 'ICTest',
	#instVars : [
		'vcard',
		'imid'
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
ICVCardTest >> testVCardAddAIMId [

| vaimid | 
vaimid := ICAIMId new.
vaimid id: 'sth'. 
vcard addAimid: vaimid.
imid := vcard aimids first.
self assert: imid id equals: 'sth'.
self assert: (imid isKindOf: ICAIMId).
]

{ #category : 'tests' }
ICVCardTest >> testVCardAddAIMIdByParser [

| vaimid | 
vaimid := ICAIMId fromICalString: 'sth' parameters: Dictionary new.
vcard addAimid: vaimid.
imid := vcard aimids first.
self assert: imid id equals: 'sth'.
self assert: (imid isKindOf: ICAIMId).
]

{ #category : 'tests' }
ICVCardTest >> testVCardAddAddress [ 

|vaddress address | 
vaddress := ICAddress new.
vaddress country: 'France'.
vaddress postalcode: '59000'; street: '40 Avenue Edmund Halley'; locality: 'Villeneuve d''Ascq'.
vaddress postalcode: '59000'; locality: 'Villeneuve d''Ascq'; country: 'France'.
vaddress region: 'Hauts-de-France'.
vcard addAddress: vaddress. 
address := vcard addresses anyOne.
self assert: address street equals: '40 Avenue Edmund Halley'.
self assert: address locality equals: 'Villeneuve d''Ascq'.
self assert: address postalcode equals: '59000'.
self assert: address region equals: 'Hauts-de-France'.
self assert: address country equals: 'France'.





]

{ #category : 'tests' }
ICVCardTest >> testVCardAddAddressByParser [

|vaddress address stringAddress| 

stringAddress := ';;40 Avenue Edmund Halley;Villeneuve d''Ascq;Hauts-de-France;59000;France'.
vaddress := ICAddress fromVCardString: stringAddress parameters: Dictionary new. 
vcard addAddress: vaddress. 
address := vcard addresses anyOne.
self assert: address postalcode equals: '59000'.
self assert: address region equals: 'Hauts-de-France'.
self assert: address street equals: '40 Avenue Edmund Halley'.
self assert: address country equals: 'France'.
self assert: address locality equals: 'Villeneuve d''Ascq'.




]

{ #category : 'tests' }
ICVCardTest >> testVCardAddBirthday [

| date | 

date := self dateClass year: 2002 month: 08 day: 28.

vcard birthday: date.
self assert: date equals: (self dateClass year: 2002 month: 08 day: 28).
]

{ #category : 'tests' }
ICVCardTest >> testVCardAddBirthdayByParser [

| date | 

date := self dateClass fromVCardString: '2002-08-28'.
vcard birthday: date.
self assert: vcard birthday asVCardString equals: '2002-08-28'.
]

{ #category : 'tests' }
ICVCardTest >> testVCardAddEmailAddress [ 

|vemail email | 
vemail := ICEmailAddress new.
vemail address: 'addosarahb@gmail.com'.
vemail internet: true.
vemail beInternet.
vemail internet.
vcard addEmailAddress: vemail.
email := vcard emailAddresses first.
self assert: email address equals: 'addosarahb@gmail.com'.
self assert: email internet equals: true.
]

{ #category : 'tests' }
ICVCardTest >> testVCardAddEmailAddressByParser [

|vemail email | 
vemail := ICEmailAddress fromICalString: 'addosarahb@gmail.com' parameters: Dictionary new.
vemail internet: true.
vemail beInternet.
vemail internet.
vcard addEmailAddress: vemail.
email := vcard emailAddresses first.
self assert: email address equals: 'addosarahb@gmail.com'.
self assert: email internet equals: true.
]

{ #category : 'tests' }
ICVCardTest >> testVCardAddMSNId [

| vmsnid | 
vmsnid := ICMSNId new.
vmsnid id: 'unknown'. 
vcard addMsnid: vmsnid.
imid := vcard msnids first.
self assert: imid id equals: 'unknown'.
self assert: (imid isKindOf: ICMSNId).
]

{ #category : 'tests' }
ICVCardTest >> testVCardAddMSNIdByParser [

|vmsnid | 
vmsnid := ICMSNId fromICalString: 'unknown' parameters: Dictionary new.
vcard addMsnid: vmsnid.
imid := vcard msnids first.
self assert: imid id equals: 'unknown'.
self assert: (imid isKindOf: ICMSNId).
]

{ #category : 'tests' }
ICVCardTest >> testVCardAddNote [

|note | 

note := 'Un nouveau contact'.
vcard addNote: note.

self assert: vcard notes first equals: 'Un nouveau contact'.



]

{ #category : 'tests' }
ICVCardTest >> testVCardAddPhoneNumber [ 

|vphone phone | 
vphone := ICPhoneNumber new.
vphone number: '0614060814'.
vphone cellular: true.
vcard addPhoneNumber: vphone.
phone := vcard phoneNumbers first.
self assert: phone number equals: '0614060814'.
self assert: phone cellular equals: true.
]

{ #category : 'tests' }
ICVCardTest >> testVCardAddPhoneNumberByParser [

|vphone phone | 
vphone := ICPhoneNumber fromICalString: '0614060814' parameters: Dictionary new. 
vphone cellular: true.
vcard addPhoneNumber: vphone.
phone := vcard phoneNumbers first.
self assert: phone number equals: '0614060814'.
self assert: phone cellular equals: true.
]

{ #category : 'tests' }
ICVCardTest >> testVCardCreateName [ 
 
|vname | 
vname := ICName new.
vname familyName: 'Tathy'.
vname givenName: 'Sarah'.

vcard name: vname. 
self assert: vcard name asVCardString equals: 'Tathy;Sarah;;;'.

vcard fullname: 'Tathy Sarah'. 
self assert: vcard fullname equals: 'Tathy Sarah'.



]

{ #category : 'tests' }
ICVCardTest >> testVCardCreateNameByParser [
 
|vname | 
vname := ICName fromICalString: 'Tathy;Sarah'.
vcard name: vname. 
self assert: vcard name asVCardString equals: 'Tathy;Sarah;;;'.

vcard fullname: 'Tathy Sarah'. 
self assert: vcard fullname equals: 'Tathy Sarah'.



]
