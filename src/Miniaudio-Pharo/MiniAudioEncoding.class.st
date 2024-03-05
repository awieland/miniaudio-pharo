Class {
	#name : #MiniAudioEncoding,
	#superclass : #Object,
	#instVars : [
		'encodingFormat',
		'sampleFormat',
		'channels',
		'sampleRate'
	],
	#category : #'Miniaudio-Pharo'
}

{ #category : #'instance creation' }
MiniAudioEncoding class >> withEncodingFormat: anMAEncodingFormat sampleFormat: anMAFormat channels: channelsInteger sampleRate: sampleRateInteger [
	^ super new
		setEncodingFormat: anMAEncodingFormat
		sampleFormat: anMAFormat
		channels: channelsInteger
		sampleRate: sampleRateInteger
]

{ #category : #'ffi - instance creation' }
MiniAudioEncoding >> allocateEncoderConfig [
	^ MiniAudioLibrary uniqueInstance
		encoderConfigInitForEncodingFormat: encodingFormat
		format: sampleFormat
		channels: channels
		sampleRate: sampleRate
]

{ #category : #initialization }
MiniAudioEncoding >> setEncodingFormat: anMAEncodingFormat sampleFormat: anMAFormat channels: channelsInteger sampleRate: sampleRateInteger [
	encodingFormat := anMAEncodingFormat.
	sampleFormat := anMAFormat.
	channels := channelsInteger.
	sampleRate := sampleRateInteger
]
