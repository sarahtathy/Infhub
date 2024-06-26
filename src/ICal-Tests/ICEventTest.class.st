Class {
	#name : 'ICEventTest',
	#superclass : 'ICTest',
	#instVars : [
		'appointment1',
		'appointment2',
		'todo',
		'calendar'
	],
	#category : 'ICal-Tests',
	#package : 'ICal-Tests'
}

{ #category : 'running' }
ICEventTest >> setUp [
	
	super setUp.
	calendar := ICCalendar new.
	self 
		setUpAppointment1;
		setUpAppointment2;
		setUpToDo.

	calendar addEvent: appointment1.
	calendar addEvent: appointment2.
	calendar addEvent: todo
]

{ #category : 'running' }
ICEventTest >> setUpAppointment1 [

	| category |
	category := ICCategory summary: 'friends'.

	appointment1 := ICEvent summary: 'diner'.
	appointment1 addCategory: category.
	appointment1 uid: 'app1'.
	appointment1
		start: (self dateAndTimeClass 
					year: 2005
					month: 5
					day: 18
					hour: 17
					minute: 0
					second: 0);
		end: (self dateAndTimeClass 
					year: 2005
					month: 5
					day: 18
					hour: 20
					minute: 0
					second: 0).
	appointment1 beLowPriority.
	appointment1 location: 'in nature'.
]

{ #category : 'running' }
ICEventTest >> setUpAppointment2 [

	appointment2 := ICEvent summary: 'running'.
	appointment2 uid: 'app2'.
	appointment2
		start: (self dateAndTimeClass 
					year: 2005
					month: 6
					day: 12
					hour: 8
					minute: 30
					second: 0);
		end: (self dateAndTimeClass 
					year: 2005
					month: 6
					day: 12
					hour: 9
					minute: 40
					second: 0).
]

{ #category : 'running' }
ICEventTest >> setUpToDo [

	todo := ICTodo summary: 'clean the living-room'.
	todo uid: 'todo1'.
	todo due: self inFourDaysFromNow
]

{ #category : 'testing' }
ICEventTest >> testHours [
 
  self assert: appointment1 hours asInteger equals: 3.
  self assert: appointment2 hours equals: (1 +(1/6)) asFloat.
   
]

{ #category : 'testing' }
ICEventTest >> testIDs [
	| aTodo |
	self assert: appointment1 uid equals: 'app1'.
	self assert: appointment2 uid equals: 'app2'.
	self assert: todo uid equals: 'todo1'.
	calendar addEvent: (
		ICTodo new
			summary: 'cleaning';
			uid: 'todo2';
			yourself).
	aTodo := ICTodo summary: 'shopping'.
	aTodo uid: 'todo3'.
	calendar addEvent: aTodo.
	self assert: aTodo uid equals: 'todo3'.
	self assert: (calendar eventWithUid: 'app1') equals: appointment1.
	self assert: (calendar eventWithUid: 'todo2') summary equals: 'cleaning'
]

{ #category : 'testing' }
ICEventTest >> testInitialize [
	| anAppointment |
	anAppointment := ICEvent summary: 'physical test'.
	self assert: anAppointment summary equals: 'physical test'.
	self assert: anAppointment textualDescription isNil.
	self assert: anAppointment lastModified isNil.
	self assert: anAppointment isMediumPriority
]

{ #category : 'testing' }
ICEventTest >> testIsBefore [
	self assert: appointment1 <= appointment2
]

{ #category : 'testing' }
ICEventTest >> testStati [

	| stati |
	stati := ICEvent possibleStati asSet.
	self assert: stati size equals: 3.
	self assert: (stati includes: ICEvent statusCanceled).
	self assert: (stati includes: ICEvent statusConfirmed).
	self assert: (stati includes: ICEvent statusTentative).
	stati := ICTodo possibleStati asSet.
	self assert: stati size equals: 4.
	self assert: (stati includes: ICTodo statusCanceled).
	self assert: (stati includes: ICTodo statusNeedsAction).
	self assert: (stati includes: ICTodo statusInProcess).
	self assert: (stati includes: ICTodo statusCompleted).
	stati := ICJournal possibleStati asSet.
	self assert: stati size equals: 3.
	self assert: (stati includes: ICJournal statusCanceled).
	self assert: (stati includes: ICJournal statusDraft).
	self assert: (stati includes: ICJournal statusFinal)
]

{ #category : 'testing' }
ICEventTest >> testTesting [

	self deny: appointment1 isFullDayEvent.
	self deny: appointment1 isRecurrent.

	self deny: todo isRecurrent.

	self assert: (appointment1 isValidForDate:
			 (self dateAndTimeClass year: 2005 month: 5 day: 18)).

	self deny: (todo startsInHour: self inFourDaysFromNow)
]

{ #category : 'testing' }
ICEventTest >> testTransparency [
	self assert: ICEvent new isTransparent
]

{ #category : 'testing' }
ICEventTest >> testUpdateAppointment [
	| appEvent |
	appEvent := ICEvent summary: 'meeting'.
	calendar addEvent: appEvent.
	appEvent updateEventWith: appointment1.
	self assert: appEvent summary equals: appointment1 summary.
	self assert: appEvent categories equals: appointment1 categories.
	self assert: appEvent textualDescription equals: appointment1 textualDescription.
	self assert: appEvent status equals: appointment1 status.
	self assert: appEvent priority equals: appointment1 priority.
	self assert: appEvent created equals: appointment1 created.
	self assert: appEvent lastModified equals: appointment1 lastModified.
	self assert: appEvent sequenceNumber equals: appointment1 sequenceNumber.
	self assert: appEvent start equals: appointment1 start.
	self assert: appEvent end equals: appointment1 end.
]

{ #category : 'testing' }
ICEventTest >> testUpdateToDo [
	| todoEvent |
	todoEvent := ICTodo summary: 'todo'.
	todoEvent updateEventWith: todo.
	self assert: todoEvent summary equals: todo summary.
	self assert: todoEvent categories equals: todo categories.
	self assert: todoEvent textualDescription equals: todo textualDescription.
	self assert: todoEvent status equals: todo status.
	self assert: todoEvent priority equals: todo priority.
	self assert: todoEvent created equals: todo created.
	self assert: todoEvent lastModified equals: todo lastModified.
	self assert: todoEvent sequenceNumber equals: todo sequenceNumber.
	self assert: todoEvent due equals: todo due
]
