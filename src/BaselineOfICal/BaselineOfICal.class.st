Class {
	#name : 'BaselineOfICal',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfICal',
	#package : 'BaselineOfICal'
}

{ #category : 'baselines' }
BaselineOfICal >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		
		self smaCC: spec.

		spec 
			package: 'ICal'       with: [ spec requires: #('SmaCC') ];
			package: 'ICal-Tests' with: [ spec requires: #('ICal') ];
			
			package: 'ICal-VCard' with: [ spec requires: #('ICal') ];
			package: 'ICal-VCard-Tests' with: [ spec requires: #('ICal-VCard') ].

		spec 
			group: 'Core' with: #('ICal');
			group: 'VCard' with: #('Core' 'ICal-VCard');
			group: 'Tests' with: #('VCard' 'ICal-Tests');
			group: 'default' with: #('VCard' 'Tests') ]
]

{ #category : 'baselines' }
BaselineOfICal >> smaCC: spec [

	spec
   		baseline: 'SmaCC'
  		with: [
			 spec 
				loads: 'Runtime';
				repository: 'github://hernanmd/SmaCC:pharo12' ].
	
]
