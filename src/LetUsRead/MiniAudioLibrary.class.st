Class {
	#name : #MiniAudioLibrary,
	#superclass : #FFILibrary,
	#classVars : [
		'TypeMap'
	],
	#category : #LetUsRead
}

{ #category : #accessing }
MiniAudioLibrary class >> ffiBindingOf: aString [
	^ TypeMap at: aString ifAbsent: [ super ffiBindingOf: aString ]
]

{ #category : #initialization }
MiniAudioLibrary class >> initialize [
	self reset.
	self initializeTypeMap
]

{ #category : #initialization }
MiniAudioLibrary class >> initializeTypeMap [
	TypeMap := Dictionary newFromPairs: #(
		ma_encoder_config #FFIOpaqueObject
		ma_encoding_format #MAEncodingFormat
		ma_format #MAFormat
		ma_unit32 #uint32
	)
]

{ #category : #initialization }
MiniAudioLibrary class >> reset [
	uniqueInstance := nil
]

{ #category : #accessing }
MiniAudioLibrary >> encoderConfigInitForEncodingFormat: anMAEncodingFormat format: anMAFormat channels: channelsInteger sampleRate: sampleRateInteger [
	^ self ffiCall: #( ma_encoder_config* ma_ext_encoder_config_init(ma_encoding_format anMAEncodingFormat, ma_format anMAFormat, ma_unit32 channelsInteger, ma_unit32 sampleRateInteger) )

]

{ #category : #accessing }
MiniAudioLibrary >> versionString [
	^ self ffiCall: #(String ma_version_string #())
]

{ #category : #'accessing - platform' }
MiniAudioLibrary >> win32LibraryName [
	^ 'miniaudio-lib.dll'
]
