Class {
	#name : 'ICAddToDoTest',
	#superclass : 'ICTest',
	#instVars : [
		'calendar'
	],
	#category : 'ICal-Tests',
	#package : 'ICal-Tests'
}

{ #category : 'running' }
ICAddToDoTest >> setUp [
	calendar := ICCalendar name: 'the calendar'
]

{ #category : 'testing' }
ICAddToDoTest >> testSave [

	| savedToDo deadLine todo |
	deadLine := self dateAndTimeClass now + (self durationClass
		             days: 1
		             hours: 0
		             minutes: 0
		             seconds: 0).
	todo := ICTodo new
		        addCategory: (ICCategory summary: 'second');
		        summary: 'writing a letter';
		        beLowPriority;
		        textualDescription:
			        'this should be a real letter not an email';
		        due: deadLine;
		        yourself.
	calendar addTodo: todo.
	savedToDo := calendar todos first.
	self assert: calendar todos size equals: 1.
	self
		assert: savedToDo categories anyOne
		equals: (ICCategory summary: 'second').
	self assert: savedToDo summary equals: 'writing a letter'.
	self assert: savedToDo isLowPriority.
	self
		assert: savedToDo textualDescription
		equals: 'this should be a real letter not an email'.
	self assert: savedToDo due equals: deadLine
]
