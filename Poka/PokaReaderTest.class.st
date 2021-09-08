Class {
	#name : #PokaReaderTest,
	#superclass : #TestCase,
	#instVars : [
		'reader'
	],
	#category : #Poka
}

{ #category : #initialization }
PokaReaderTest >> setUp [
	super setUp.
	reader := PokaReader new.
]

{ #category : #tests }
PokaReaderTest >> testCompleteNext [
	reader reset: 'A'.
	reader next.
	self assert: reader next equals: #EOF
]

{ #category : #tests }
PokaReaderTest >> testEmptyNext [
	self assert: reader next equals: #EOF
]

{ #category : #tests }
PokaReaderTest >> testNext [
	reader reset: 'program'.
	self assert: reader next equals: $p
]

{ #category : #tests }
PokaReaderTest >> testPutBack [
	reader reset: 'ok'.
	reader next;
		putBack: $a.
	self assert: reader next equals: $a.
	self assert: reader next equals: $k
]

{ #category : #tests }
PokaReaderTest >> testPutBackEmpty [
	reader putBack: $h.
	self assert: reader next equals: $h
]

{ #category : #tests }
PokaReaderTest >> testPutBackEnd [
	reader reset: ';'.
	reader next.
	reader putBack: $=.
	self assert: reader next equals: $=
]
