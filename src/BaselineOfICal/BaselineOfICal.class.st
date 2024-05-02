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
			package: 'ICal-VCard-Tests' with: [ spec requires: #('ICal-VCard') ];
				
			package: 'ICal-VCard-UI' with: [ spec requires: #('ICal-VCard') ];
			package: 'ICal-VCard-UI-Tests' with: [ spec requires: #('ICal-VCard-UI') ].

		spec 
			group: 'Core' with: #('ICal');
			group: 'Tests' with: #('ICal-Tests');

			group: 'VCard' with: #('Core' 'ICal-VCard');
			group: 'VCardTests' with: #('Tests' 'VCard' 'ICal-VCard-Tests');

			group: 'UI' with: #('VCard' 'ICal-VCard-UI');
			group: 'UITests' with: #('UI' 'ICal-VCard-UI-Tests');
			group: 'all' with: #('VCardTests' 'UITests');

 			group: 'default' with: #('UITests') ]
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
