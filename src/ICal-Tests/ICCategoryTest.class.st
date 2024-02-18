Class {
	#name : 'ICCategoryTest',
	#superclass : 'ICTest',
	#instVars : [
		'calendar',
		'category1',
		'category2'
	],
	#category : 'ICal-Tests',
	#package : 'ICal-Tests'
}

{ #category : 'running' }
ICCategoryTest >> setUp [
	| categories |
	calendar := ICCalendar name: ' Test Calendar '.
	categories := OrderedCollection new.
	category1 := ICCategory summary: 'tennis club'.
	category1 textualDescription: 'this category is for tennis club events'.
	category1 color: 'red'.
	category2 := ICCategory summary: 'family'.
	category2 textualDescription: 'for family events'.
	category2 color: 'green'.
	categories := OrderedCollection with: category1 with: category2.
	calendar categories: categories
]

{ #category : 'testing' }
ICCategoryTest >> testColor [

	self assert: (calendar categoryWithSummary: 'family') hasColor.
	self
		assert: (calendar categoryWithSummary: 'tennis club') color
		equals: 'red'.

	category1 color: 'purple'.
	category2 color: 'yellow'.

	self assert: (calendar categoryWithSummary: 'family') hasColor.
	self
		deny: (calendar categoryWithSummary: 'tennis club') color
		equals: 'red'
]

{ #category : 'testing' }
ICCategoryTest >> testEqual [

	self deny: category1 equals: category2.
	self assert: category1 equals: (ICCategory summary: 'tennis club').
	self assert: category2 equals: (ICCategory summary: 'family')
]

{ #category : 'testing' }
ICCategoryTest >> testExplanation [

	self
		assert: (calendar categoryWithSummary: 'family') textualDescription
		equals: 'for family events'.
	self
		assert:
		(calendar categoryWithSummary: 'tennis club') textualDescription
		equals: 'this category is for tennis club events'.
	self deny: category1 textualDescription equals: ''
]
