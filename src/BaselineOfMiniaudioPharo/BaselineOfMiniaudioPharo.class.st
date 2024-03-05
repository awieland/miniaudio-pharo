Class {
	#name : #BaselineOfMiniaudioPharo,
	#superclass : #BaselineOf,
	#category : #BaselineOfMiniaudioPharo
}

{ #category : #loading }
BaselineOfMiniaudioPharo class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'miniaudio-pharo' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfMiniaudioPharo >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'Miniaudio-Pharo'
		]
]
