Class {
	#name : #MAEncodingFormat,
	#superclass : #FFIEnumeration,
	#classVars : [
		'ma_encoding_format_flac',
		'ma_encoding_format_mp3',
		'ma_encoding_format_unknown',
		'ma_encoding_format_vorbis',
		'ma_encoding_format_wav'
	],
	#category : #'Miniaudio-Pharo'
}

{ #category : #'enum declaration' }
MAEncodingFormat class >> enumDecl [
	"
	self initialize.
	self rebuildEnumAccessors
	"
	^ #(
		ma_encoding_format_unknown 0
		ma_encoding_format_wav 1
		ma_encoding_format_flac 2
		ma_encoding_format_mp3 3
		ma_encoding_format_vorbis 4
	)
]

{ #category : #initialization }
MAEncodingFormat class >> initialize [
	super initialize
]

{ #category : #'accessing enum' }
MAEncodingFormat class >> ma_encoding_format_flac [
	"This method was automatically generated"
	^ ma_encoding_format_flac
]

{ #category : #'accessing enum' }
MAEncodingFormat class >> ma_encoding_format_mp3 [
	"This method was automatically generated"
	^ ma_encoding_format_mp3
]

{ #category : #'accessing enum' }
MAEncodingFormat class >> ma_encoding_format_unknown [
	"This method was automatically generated"
	^ ma_encoding_format_unknown
]

{ #category : #'accessing enum' }
MAEncodingFormat class >> ma_encoding_format_vorbis [
	"This method was automatically generated"
	^ ma_encoding_format_vorbis
]

{ #category : #'accessing enum' }
MAEncodingFormat class >> ma_encoding_format_wav [
	"This method was automatically generated"
	^ ma_encoding_format_wav
]
