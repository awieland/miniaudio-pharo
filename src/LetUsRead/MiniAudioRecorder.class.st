Class {
	#name : #MiniAudioRecorder,
	#superclass : #Object,
	#instVars : [
		'encoderConfig',
		'encoder',
		'deviceConfig',
		'device'
	],
	#category : #LetUsRead
}

{ #category : #'instance creation' }
MiniAudioRecorder class >> withEncoding: aMiniAudioEncoding targetFile: aFileReference [
	^ super new
		setEncoding: aMiniAudioEncoding
		targetFile: aFileReference
]

{ #category : #private }
MiniAudioRecorder >> checkResult: anMAResult [
	anMAResult = MAResult MA_SUCCESS
		ifFalse: [ self error: 'Invalid ma_result: ' , anMAResult printString ]
]

{ #category : #finalization }
MiniAudioRecorder >> close [
	self lib
		deviceUninit: device;
		encoderUninit: encoder
]

{ #category : #'private - accessing' }
MiniAudioRecorder >> lib [
	^ MiniAudioLibrary uniqueInstance
]

{ #category : #initialization }
MiniAudioRecorder >> setEncoding: aMiniAudioEncoding targetFile: aFileReference [
	| result |
	encoderConfig := aMiniAudioEncoding allocateEncoderConfig.
	encoderConfig autoRelease.
	encoder := self lib allocateEncoder.
	encoder autoRelease.
	result := self lib
			encoderInitFileWithPath: aFileReference fullName
			config: encoderConfig
			encoder: encoder.
	self checkResult: result.
	deviceConfig := self lib deviceConfigInitForCaptureWith: encoder.
	deviceConfig autoRelease.
	device := self lib allocateDevice.
	device autoRelease.
	result := self lib deviceInitForConfig: deviceConfig device: device.
	self checkResult: result
]

{ #category : #recording }
MiniAudioRecorder >> start [
	| result |
	result := self lib deviceStart: device.
	self checkResult: result
]

{ #category : #recording }
MiniAudioRecorder >> stop [
	| result |
	result := self lib deviceStop: device.
	self checkResult: result
]
