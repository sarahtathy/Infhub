Class {
	#name : 'ICTest',
	#superclass : 'TestCase',
	#category : 'ICal-Tests',
	#package : 'ICal-Tests'
}

{ #category : 'testing' }
ICTest class >> isAbstract [

	^self name = #ICTest
			
]

{ #category : 'private' }
ICTest >> dateAndTimeClass [
	^ICConversion dateAndTimeClass
]

{ #category : 'private' }
ICTest >> dateClass [
	^ICConversion dateClass
]

{ #category : 'private' }
ICTest >> durationClass [
	^ICConversion durationClass
]

{ #category : 'private' }
ICTest >> timeClass [
	^ICConversion timeClass
]
