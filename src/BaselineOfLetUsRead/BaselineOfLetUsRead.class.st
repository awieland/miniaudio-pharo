Class {
	#name : #BaselineOfLetUsRead,
	#superclass : #BaselineOf,
	#category : #BaselineOfLetUsRead
}

{ #category : #loading }
BaselineOfLetUsRead class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'let-us-read' ]
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
BaselineOfLetUsRead >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'LetUsRead'
		]
]
