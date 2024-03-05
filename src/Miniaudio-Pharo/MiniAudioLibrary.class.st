Class {
	#name : #MiniAudioLibrary,
	#superclass : #FFILibrary,
	#classVars : [
		'TypeMap'
	],
	#category : #'Miniaudio-Pharo'
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
		ma_encoder #FFIOpaqueObject
		ma_device_config #FFIOpaqueObject
		ma_device #FFIOpaqueObject
		ma_result #MAResult
		ma_encoding_format #MAEncodingFormat
		ma_format #MAFormat
		ma_unit32 #uint32
	)
]

{ #category : #initialization }
MiniAudioLibrary class >> reset [
	uniqueInstance := nil
]

{ #category : #api }
MiniAudioLibrary >> allocateDevice [
	self ffiCall: #( ma_device* ma_ext_allocate_device() )
]

{ #category : #api }
MiniAudioLibrary >> allocateEncoder [
	^ self ffiCall: #( ma_encoder* ma_ext_allocate_encoder() )
]

{ #category : #api }
MiniAudioLibrary >> deviceConfigInitForCaptureWith: encoder [
	^ self ffiCall: #( ma_device_config* ma_ext_device_config_init_for_capture(ma_encoder* encoder) )
]

{ #category : #api }
MiniAudioLibrary >> deviceInitForConfig: config device: device [
	^ self ffiCall: #( ma_result ma_device_init(NULL, ma_device_config* config, ma_device* device) )
]

{ #category : #api }
MiniAudioLibrary >> deviceStart: device [
	^ self ffiCall: #( ma_result ma_device_start(ma_device* device) )
]

{ #category : #api }
MiniAudioLibrary >> deviceStop: device [
	^ self ffiCall: #( ma_result ma_device_stop(ma_device* device) )
]

{ #category : #api }
MiniAudioLibrary >> deviceUninit: device [
	^ self ffiCall: #( void ma_device_uninit(ma_device* device) )
]

{ #category : #api }
MiniAudioLibrary >> encoderConfigInitForEncodingFormat: anMAEncodingFormat format: anMAFormat channels: channelsInteger sampleRate: sampleRateInteger [
	^ self ffiCall: #( ma_encoder_config* ma_ext_encoder_config_init(ma_encoding_format anMAEncodingFormat, ma_format anMAFormat, ma_unit32 channelsInteger, ma_unit32 sampleRateInteger) )

]

{ #category : #api }
MiniAudioLibrary >> encoderInitFileWithPath: pathString config: config encoder: encoder [
	^ self ffiCall: #( ma_result ma_encoder_init_file(String pathString, ma_encoder_config* config, ma_encoder* encoder) )
]

{ #category : #api }
MiniAudioLibrary >> encoderUninit: encoder [
	^ self ffiCall: #( void ma_encoder_uninit(ma_encoder* encoder) )
]

{ #category : #api }
MiniAudioLibrary >> free: anOpaqueObject [
	^ self ffiCall: #( void ma_ext_free(void* anOpaqueObject) )
]

{ #category : #api }
MiniAudioLibrary >> versionString [
	^ self ffiCall: #( String ma_version_string #() )
]

{ #category : #'accessing - platform' }
MiniAudioLibrary >> win32LibraryName [
	| repo |
	repo := IceRepository registeredRepositoryIncludingPackage: self class package.
	^ (repo location / 'bin' / 'miniaudio-lib.dll') fullName
]
