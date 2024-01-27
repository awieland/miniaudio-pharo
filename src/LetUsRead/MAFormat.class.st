Class {
	#name : #MAFormat,
	#superclass : #FFIEnumeration,
	#classVars : [
		'ma_format_f32',
		'ma_format_s16',
		'ma_format_s24',
		'ma_format_s32',
		'ma_format_u8',
		'ma_format_unknown'
	],
	#category : #LetUsRead
}

{ #category : #'enum declaration' }
MAFormat class >> enumDecl [
	"
	self initialize.
	self rebuildEnumAccessors
	"
	^ #(
		ma_format_unknown 0 "Mainly used for indicating an error, but also used as the default for the output format for decoders."
    	ma_format_u8 1
    	ma_format_s16 2 "Seems to be the most widely supported format."
    	ma_format_s24 3 "Tightly packed. 3 bytes per sample."
    	ma_format_s32 4
    	ma_format_f32 5
	)
]

{ #category : #initalization }
MAFormat class >> initialize [
	super initialize
]

{ #category : #'accessing enum' }
MAFormat class >> ma_format_f32 [
	"This method was automatically generated"
	^ ma_format_f32
]

{ #category : #'accessing enum' }
MAFormat class >> ma_format_s16 [
	"This method was automatically generated"
	^ ma_format_s16
]

{ #category : #'accessing enum' }
MAFormat class >> ma_format_s24 [
	"This method was automatically generated"
	^ ma_format_s24
]

{ #category : #'accessing enum' }
MAFormat class >> ma_format_s32 [
	"This method was automatically generated"
	^ ma_format_s32
]

{ #category : #'accessing enum' }
MAFormat class >> ma_format_u8 [
	"This method was automatically generated"
	^ ma_format_u8
]

{ #category : #'accessing enum' }
MAFormat class >> ma_format_unknown [
	"This method was automatically generated"
	^ ma_format_unknown
]
