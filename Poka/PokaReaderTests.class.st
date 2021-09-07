Class {
	#name : #PokaReaderTests,
	#superclass : #TestCase,
	#instVars : [
		'reader'
	],
	#category : #Poka
}

{ #category : #initialization }
PokaReaderTests >> setUp [
	reader := PokaReader new.
]

{ #category : #tests }
PokaReaderTests >> testCompleteNext [
	reader reset: 'A'.
	reader next.
	self assert: reader next equals: #EOF
]

{ #category : #tests }
PokaReaderTests >> testEmptyNext [
	self assert: reader next equals: #EOF
]

{ #category : #tests }
PokaReaderTests >> testNext [
	reader reset: 'program'.
	self assert: reader next equals: $p
]

{ #category : #tests }
PokaReaderTests >> testPutBack [
	reader reset: 'ok'.
	reader next;
		putBack: $a.
	self assert: reader next equals: $a.
	self assert: reader next equals: $k
]

{ #category : #tests }
PokaReaderTests >> testPutBackEmpty [
	reader putBack: $h.
	self assert: reader next equals: $h
]

{ #category : #tests }
PokaReaderTests >> testPutBackEnd [
	reader reset: ';'.
	reader next.
	reader putBack: $=.
	self assert: reader next equals: $=
]
