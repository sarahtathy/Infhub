"
I'm the new Scanner, I contain lots of tokens specified in RFC 2445
"
Class {
	#name : 'ICCalendarScanner2',
	#superclass : 'SmaCCScanner',
	#category : 'ICal-Parser',
	#package : 'ICal-Parser'
}

{ #category : 'generated-comments' }
ICCalendarScanner2 class >> scannerDefinitionComment [

	"<ALPHA> : [A-Za-z];

#0-9
<DIGIT> : \d;

#carriage return
<CR> : \r;

#Controls
<CTL> : [\x00-\x08] | [\x0A-\0x1F] | \x7F ;

#Quotation Mark
<DQUOTE> : \x22;

#line feed
<LF> : \f;

#Internet standard newline
<CRLF> : <CR> <LF>;

<HTAB> : \t;

<SPACE> : \x20;

<WSP> : <SPACE> | <HTAB>;

#Use restricted by charset parameter
#on outer MIME object (UTF-8 preferred)
<NONUSASCII> : [\x80-\xF8];

#Any textual character
<VALUECHAR> : <WSP> | [\x21-\x7E] | <NONUSASCII>;

#Any character except CTLs and DQUOTE
<QSAFECHAR> : <WSP> | [\x21] | [\x23-\x7E] | <NONUSASCII>; 

#Any character except CTLs, DQUOTE, "";"", "":"", "",""
<SAFECHAR> : <WSP> | [\x21] | [\x23-\x2B] | [\x2D-\x39] | [\x3C-\x7E] | <NONUSASCII>; 

<ianatoken> : (<ALPHA> | <DIGIT> | ""-"")+ ;

<xname> : (""X-"" | ""x-"") [<vendorid> ""-""]? (<ALPHA> | <DIGIT> | ""-"")+;

<paramtext> : <SAFECHAR>*;

<quotedstring> : <DQUOTE> <QSAFECHAR>* <DQUOTE>;

<value> : <VALUECHAR>*;

<xtoken> : (""X-"" | ""x-"") | (<ALPHA> | <DIGIT> | ""-"")+;

<vendorid> : (<ALPHA> | <DIGIT>) (<ALPHA> | <DIGIT>) (<ALPHA> | <DIGIT>)+;



"
]

{ #category : 'generated-tokens' }
ICCalendarScanner2 >> emptySymbolTokenId [
	^28
]

{ #category : 'generated-tokens' }
ICCalendarScanner2 >> errorTokenId [
	^29
]

{ #category : 'generated-scanner' }
ICCalendarScanner2 >> scan1 [
	
	[self recordMatch: #(7 9).
	self step.
	currentCharacter == $	 or: 
			[(currentCharacter between: $  and: $!) or: 
					[(currentCharacter between: $# and: $+) or: 
							[(currentCharacter between: $- and: $9) or: 
									[(currentCharacter between: $< and: $~) 
										or: [currentCharacter between: $a and: $z]]]]]] 
			whileTrue.
	(currentCharacter == $" 
		or: [currentCharacter == $, or: [currentCharacter between: $: and: $;]]) 
			ifTrue: 
				[
				[self recordMatch: #(9).
				self step.
				currentCharacter == $	 or: 
						[(currentCharacter between: $  and: $~) 
							or: [currentCharacter between: $a and: $z]]] 
						whileTrue.
				^self reportLastMatch].
	^self reportLastMatch
]

{ #category : 'generated-scanner' }
ICCalendarScanner2 >> scan2 [
	
	[self recordMatch: #(9).
	self step.
	currentCharacter == $	 or: 
			[(currentCharacter between: $  and: $!) or: 
					[(currentCharacter between: $# and: $~) 
						or: [currentCharacter between: $a and: $z]]]] 
			whileTrue.
	currentCharacter == $" ifTrue: [^self scan3].
	^self reportLastMatch
]

{ #category : 'generated-scanner' }
ICCalendarScanner2 >> scan3 [
	self recordMatch: #(8 9).
	self step.
	(currentCharacter == $	 or: 
			[(currentCharacter between: $  and: $~) 
				or: [currentCharacter between: $a and: $z]]) 
		ifTrue: 
			[
			[self recordMatch: #(9).
			self step.
			currentCharacter == $	 or: 
					[(currentCharacter between: $  and: $~) 
						or: [currentCharacter between: $a and: $z]]] 
					whileTrue.
			^self reportLastMatch].
	^self reportLastMatch
]

{ #category : 'generated-scanner' }
ICCalendarScanner2 >> scan4 [
	
	[self recordMatch: #(5 9 10).
	self step.
	(currentCharacter == $	 or: 
			[(currentCharacter between: $  and: $!) or: 
					[(currentCharacter between: $# and: $/) or: 
							[(currentCharacter between: $: and: $@) or: 
									[(currentCharacter between: $[ and: $`) or: 
											[(currentCharacter between: ${ and: $~) 
												or: [currentCharacter between: $a and: $z]]]]]]) 
		ifTrue: 
			[
			[self recordMatch: #(9).
			self step.
			currentCharacter == $	 or: 
					[(currentCharacter between: $  and: $~) 
						or: [currentCharacter between: $a and: $z]]] 
					whileTrue.
			^self reportLastMatch].
	currentCharacter isDigit or: 
			[(currentCharacter between: $A and: $Z) 
				or: [currentCharacter between: $a and: $z]]] 
			whileTrue.
	currentCharacter == $" ifTrue: [^self scan5].
	^self reportLastMatch
]

{ #category : 'generated-scanner' }
ICCalendarScanner2 >> scan5 [
	self recordMatch: #(9).
	self step.
	(currentCharacter == $	 or: 
			[(currentCharacter between: $  and: $,) or: 
					[(currentCharacter between: $. and: $~) 
						or: [currentCharacter between: $a and: $z]]]) 
		ifTrue: 
			[
			[self recordMatch: #(9).
			self step.
			currentCharacter == $	 or: 
					[(currentCharacter between: $  and: $~) 
						or: [currentCharacter between: $a and: $z]]] 
					whileTrue.
			^self reportLastMatch].
	currentCharacter == $- 
		ifTrue: 
			[self recordMatch: #(9).
			self step.
			(currentCharacter == $	 or: 
					[(currentCharacter between: $  and: $!) or: 
							[(currentCharacter between: $# and: $~) 
								or: [currentCharacter between: $a and: $z]]]) 
				ifTrue: 
					[
					[self recordMatch: #(9).
					self step.
					currentCharacter == $	 or: 
							[(currentCharacter between: $  and: $~) 
								or: [currentCharacter between: $a and: $z]]] 
							whileTrue.
					^self reportLastMatch].
			currentCharacter == $" ifTrue: [^self scan4].
			^self reportLastMatch].
	^self reportLastMatch
]

{ #category : 'generated-scanner' }
ICCalendarScanner2 >> scan6 [
	
	[self recordMatch: #(6 9).
	self step.
	(currentCharacter == $	 or: 
			[(currentCharacter between: $  and: $!) or: 
					[(currentCharacter between: $# and: $/) or: 
							[(currentCharacter between: $: and: $@) or: 
									[(currentCharacter between: $[ and: $`) or: 
											[(currentCharacter between: ${ and: $~) 
												or: [currentCharacter between: $a and: $z]]]]]]) 
		ifTrue: 
			[
			[self recordMatch: #(9).
			self step.
			currentCharacter == $	 or: 
					[(currentCharacter between: $  and: $~) 
						or: [currentCharacter between: $a and: $z]]] 
					whileTrue.
			^self reportLastMatch].
	currentCharacter isDigit or: 
			[(currentCharacter between: $A and: $Z) 
				or: [currentCharacter between: $a and: $z]]] 
			whileTrue.
	currentCharacter == $" ifTrue: [^self scan7].
	^self reportLastMatch
]

{ #category : 'generated-scanner' }
ICCalendarScanner2 >> scan7 [
	self recordMatch: #(9).
	self step.
	(currentCharacter == $	 or: 
			[(currentCharacter between: $  and: $,) or: 
					[(currentCharacter between: $. and: $~) 
						or: [currentCharacter between: $a and: $z]]]) 
		ifTrue: 
			[
			[self recordMatch: #(9).
			self step.
			currentCharacter == $	 or: 
					[(currentCharacter between: $  and: $~) 
						or: [currentCharacter between: $a and: $z]]] 
					whileTrue.
			^self reportLastMatch].
	currentCharacter == $- ifTrue: [^self scan8].
	^self reportLastMatch
]

{ #category : 'generated-scanner' }
ICCalendarScanner2 >> scan8 [
	self recordMatch: #(9).
	self step.
	(currentCharacter == $	 or: 
			[(currentCharacter between: $  and: $!) or: 
					[(currentCharacter between: $# and: $~) 
						or: [currentCharacter between: $a and: $z]]]) 
		ifTrue: 
			[
			[self recordMatch: #(9).
			self step.
			currentCharacter == $	 or: 
					[(currentCharacter between: $  and: $~) 
						or: [currentCharacter between: $a and: $z]]] 
					whileTrue.
			^self reportLastMatch].
	currentCharacter == $" ifTrue: [^self scan6].
	^self reportLastMatch
]

{ #category : 'generated-scanner' }
ICCalendarScanner2 >> scanForToken [
	self recordMatch: #(7 9).
	self step.
	(currentCharacter == $	 or: 
			[(currentCharacter between: $  and: $!) or: 
					[(currentCharacter between: $# and: $+) or: 
							[(currentCharacter between: $- and: $/) or: 
									[currentCharacter == $< or: 
											[(currentCharacter between: $> and: $@) or: 
													[(currentCharacter between: $[ and: $`) or: 
															[(currentCharacter between: ${ and: $~) 
																or: [currentCharacter between: $a and: $z]]]]]]]]) 
		ifTrue: [^self scan1].
	(currentCharacter isDigit or: 
			[(currentCharacter between: $A and: $Z) 
				or: [currentCharacter between: $a and: $z]]) 
		ifTrue: 
			[
			[self recordMatch: #(5 7 9 10).
			self step.
			(currentCharacter == $	 or: 
					[(currentCharacter between: $  and: $!) or: 
							[(currentCharacter between: $# and: $+) or: 
									[(currentCharacter between: $- and: $/) or: 
											[(currentCharacter between: $< and: $@) or: 
													[(currentCharacter between: $[ and: $`) or: 
															[(currentCharacter between: ${ and: $~) 
																or: [currentCharacter between: $a and: $z]]]]]]]) 
				ifTrue: [^self scan1].
			currentCharacter isDigit or: 
					[(currentCharacter between: $A and: $Z) 
						or: [currentCharacter between: $a and: $z]]] 
					whileTrue.
			(currentCharacter == $, or: [currentCharacter between: $: and: $;]) 
				ifTrue: 
					[
					[self recordMatch: #(9).
					self step.
					currentCharacter == $	 or: 
							[(currentCharacter between: $  and: $~) 
								or: [currentCharacter between: $a and: $z]]] 
							whileTrue.
					^self reportLastMatch].
			currentCharacter == $" ifTrue: [^self scan5].
			^self reportLastMatch].
	currentCharacter == $
 
		ifTrue: 
			[self step.
			currentCharacter == $ ifTrue: [^self recordAndReportMatch: #(4)].
			^self reportLastMatch].
	currentCharacter == $" 
		ifTrue: 
			[self recordMatch: #(9).
			self step.
			(currentCharacter == $	 or: 
					[(currentCharacter between: $  and: $!) or: 
							[(currentCharacter between: $# and: $,) or: 
									[(currentCharacter between: $. and: $W) or: 
											[(currentCharacter between: $Y and: $w) or: 
													[(currentCharacter between: $y and: $~) 
														or: [currentCharacter between: $a and: $z]]]]]]) 
				ifTrue: [^self scan2].
			(currentCharacter == $X or: [currentCharacter == $x]) 
				ifTrue: 
					[self recordMatch: #(9).
					self step.
					(currentCharacter == $	 or: 
							[(currentCharacter between: $  and: $!) or: 
									[(currentCharacter between: $# and: $,) or: 
											[(currentCharacter between: $. and: $~) 
												or: [currentCharacter between: $a and: $z]]]]) 
						ifTrue: [^self scan2].
					currentCharacter == $" ifTrue: [^self scan3].
					currentCharacter == $- 
						ifTrue: 
							[self recordMatch: #(9).
							self step.
							(currentCharacter == $	 or: 
									[(currentCharacter between: $  and: $!) or: 
											[(currentCharacter between: $# and: $~) 
												or: [currentCharacter between: $a and: $z]]]) 
								ifTrue: [^self scan2].
							currentCharacter == $" 
								ifTrue: 
									[self recordMatch: #(8 9 10).
									self step.
									(currentCharacter == $	 or: 
											[currentCharacter == $! or: 
													[(currentCharacter between: $# and: $/) or: 
															[(currentCharacter between: $: and: $;) or: 
																	[currentCharacter == $= or: 
																			[(currentCharacter between: $? and: $@) or: 
																					[(currentCharacter between: $[ and: $`) or: 
																							[(currentCharacter between: ${ and: $~) 
																								or: [currentCharacter between: $a and: $z]]]]]]]]) 
										ifTrue: 
											[
											[self recordMatch: #(9).
											self step.
											currentCharacter == $	 or: 
													[(currentCharacter between: $  and: $~) 
														or: [currentCharacter between: $a and: $z]]] 
													whileTrue.
											^self reportLastMatch].
									(currentCharacter isDigit or: 
											[(currentCharacter between: $A and: $Z) 
												or: [currentCharacter between: $a and: $z]]) 
										ifTrue: [^self scan6].
									(currentCharacter == $  
										or: [currentCharacter == $< or: [currentCharacter == $>]]) 
											ifTrue: 
												[self recordMatch: #(9).
												self step.
												(currentCharacter == $	 or: 
														[(currentCharacter between: $  and: $!) or: 
																[(currentCharacter between: $# and: $/) or: 
																		[(currentCharacter between: $: and: $@) or: 
																				[(currentCharacter between: $[ and: $`) or: 
																						[(currentCharacter between: ${ and: $~) 
																							or: [currentCharacter between: $a and: $z]]]]]]) 
													ifTrue: 
														[
														[self recordMatch: #(9).
														self step.
														currentCharacter == $	 or: 
																[(currentCharacter between: $  and: $~) 
																	or: [currentCharacter between: $a and: $z]]] 
																whileTrue.
														^self reportLastMatch].
												(currentCharacter isDigit or: 
														[(currentCharacter between: $A and: $Z) 
															or: [currentCharacter between: $a and: $z]]) 
													ifTrue: [^self scan6].
												currentCharacter == $" ifTrue: [^self scan7].
												^self reportLastMatch].
									currentCharacter == $" 
										ifTrue: 
											[self recordMatch: #(9).
											self step.
											(currentCharacter == $	 or: 
													[(currentCharacter between: $  and: $!) or: 
															[(currentCharacter between: $# and: $,) or: 
																	[(currentCharacter between: $. and: $/) or: 
																			[(currentCharacter between: $: and: $@) or: 
																					[(currentCharacter between: $[ and: $`) or: 
																							[(currentCharacter between: ${ and: $~) 
																								or: [currentCharacter between: $a and: $z]]]]]]]) 
												ifTrue: 
													[
													[self recordMatch: #(9).
													self step.
													currentCharacter == $	 or: 
															[(currentCharacter between: $  and: $~) 
																or: [currentCharacter between: $a and: $z]]] 
															whileTrue.
													^self reportLastMatch].
											(currentCharacter isDigit or: 
													[(currentCharacter between: $A and: $Z) 
														or: [currentCharacter between: $a and: $z]]) 
												ifTrue: [^self scan6].
											currentCharacter == $" ifTrue: [^self scan7].
											currentCharacter == $- ifTrue: [^self scan8].
											^self reportLastMatch].
									^self reportLastMatch].
							^self reportLastMatch].
					^self reportLastMatch].
			currentCharacter == $" ifTrue: [^self scan3].
			currentCharacter == $- 
				ifTrue: 
					[self recordMatch: #(9).
					self step.
					(currentCharacter == $	 or: 
							[(currentCharacter between: $  and: $!) or: 
									[(currentCharacter between: $# and: $~) 
										or: [currentCharacter between: $a and: $z]]]) 
						ifTrue: [^self scan2].
					currentCharacter == $" 
						ifTrue: 
							[self recordMatch: #(5 8 9 10).
							self step.
							(currentCharacter == $	 or: 
									[(currentCharacter between: $  and: $!) or: 
											[(currentCharacter between: $# and: $/) or: 
													[(currentCharacter between: $: and: $@) or: 
															[(currentCharacter between: $[ and: $`) or: 
																	[(currentCharacter between: ${ and: $~) 
																		or: [currentCharacter between: $a and: $z]]]]]]) 
								ifTrue: 
									[
									[self recordMatch: #(9).
									self step.
									currentCharacter == $	 or: 
											[(currentCharacter between: $  and: $~) 
												or: [currentCharacter between: $a and: $z]]] 
											whileTrue.
									^self reportLastMatch].
							(currentCharacter isDigit or: 
									[(currentCharacter between: $A and: $Z) 
										or: [currentCharacter between: $a and: $z]]) 
								ifTrue: [^self scan4].
							currentCharacter == $" ifTrue: [^self scan5].
							^self reportLastMatch].
					^self reportLastMatch].
			^self reportLastMatch].
	currentCharacter == $, 
		ifTrue: 
			[
			[self recordMatch: #(9).
			self step.
			currentCharacter == $	 or: 
					[(currentCharacter between: $  and: $~) 
						or: [currentCharacter between: $a and: $z]]] 
					whileTrue.
			^self reportLastMatch].
	currentCharacter == $: 
		ifTrue: 
			[self recordMatch: #(1 9).
			self step.
			(currentCharacter == $	 or: 
					[(currentCharacter between: $  and: $~) 
						or: [currentCharacter between: $a and: $z]]) 
				ifTrue: 
					[
					[self recordMatch: #(9).
					self step.
					currentCharacter == $	 or: 
							[(currentCharacter between: $  and: $~) 
								or: [currentCharacter between: $a and: $z]]] 
							whileTrue.
					^self reportLastMatch].
			^self reportLastMatch].
	currentCharacter == $; 
		ifTrue: 
			[self recordMatch: #(2 9).
			self step.
			(currentCharacter == $	 or: 
					[(currentCharacter between: $  and: $~) 
						or: [currentCharacter between: $a and: $z]]) 
				ifTrue: 
					[
					[self recordMatch: #(9).
					self step.
					currentCharacter == $	 or: 
							[(currentCharacter between: $  and: $~) 
								or: [currentCharacter between: $a and: $z]]] 
							whileTrue.
					^self reportLastMatch].
			^self reportLastMatch].
	currentCharacter == $= 
		ifTrue: 
			[self recordMatch: #(3 7 9).
			self step.
			(currentCharacter == $	 or: 
					[(currentCharacter between: $  and: $!) or: 
							[(currentCharacter between: $# and: $+) or: 
									[(currentCharacter between: $- and: $9) or: 
											[(currentCharacter between: $< and: $~) 
												or: [currentCharacter between: $a and: $z]]]]]) 
				ifTrue: [^self scan1].
			(currentCharacter == $" 
				or: [currentCharacter == $, or: [currentCharacter between: $: and: $;]]) 
					ifTrue: 
						[
						[self recordMatch: #(9).
						self step.
						currentCharacter == $	 or: 
								[(currentCharacter between: $  and: $~) 
									or: [currentCharacter between: $a and: $z]]] 
								whileTrue.
						^self reportLastMatch].
			^self reportLastMatch].
	^self reportLastMatch
]
