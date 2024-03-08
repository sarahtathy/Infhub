Class {
	#name : 'ICVCardExportLineTest',
	#superclass : 'ICTest',
	#instVars : [
		'vCardExporter'
	],
	#category : 'ICal-VCard-Tests',
	#package : 'ICal-VCard-Tests'
}

{ #category : 'private' }
ICVCardExportLineTest >> performTest [
	ICCardVersion 
		use: 2.1
		during: [ super performTest ].
	
]

{ #category : 'running' }
ICVCardExportLineTest >> setUp [

	super setUp.
	vCardExporter := ICVCardExporter new
	
]

{ #category : 'testing' }
ICVCardExportLineTest >> testExportExactlyThreeLines [
	"This test seems to check that each exported line does not exceed the length of 75 characters"
	| line expected |
	
	
	line := 'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttttaaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttaaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttt'.
	expected :=
		'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt', String crlf,
		' aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttt', String crlf,
		' aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttt' , String crlf.

	self assert: (vCardExporter exportLine: line) dataStream contents equals: expected.
]

{ #category : 'testing' }
ICVCardExportLineTest >> testExportExactlyTwoLines [

	| line expected |
	line := 'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttttaaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt'.
	expected := 'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt'
	            , String crlf
	            ,
	            ' aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt'
	            , String crlf.
	self
		assert: (vCardExporter exportLine: line) dataStream contents
		equals: expected
]

{ #category : 'testing' }
ICVCardExportLineTest >> testExportFourLines [

	| line expected |
	line := 'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttttaaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttaaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttt fff ggg hhh'.
	expected := 'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt'
	            , String crlf
	            ,
	            ' aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttt'
	            , String crlf
	            ,
	            ' aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttt'
	            , String crlf , '  fff ggg hhh' , String crlf.
	self
		assert: (vCardExporter exportLine: line) dataStream contents
		equals: expected
]

{ #category : 'testing' }
ICVCardExportLineTest >> testExportThreeLines [

	| line expected |
	line := 'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttttaaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttt fff ggg hhh'.
	expected := 'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt'
	            , String crlf
	            ,
	            ' aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttt'
	            , String crlf , '  fff ggg hhh' , String crlf.
	self
		assert: (vCardExporter exportLine: line) dataStream contents
		equals: expected
]

{ #category : 'testing' }
ICVCardExportLineTest >> testExportTwoLines [

	| line expected |
	line := 'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt fff ggg hhh'.
	expected := 'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt'
	            , String crlf , '  fff ggg hhh' , String crlf.
	self
		assert: (vCardExporter exportLine: line) dataStream contents
		equals: expected
]
