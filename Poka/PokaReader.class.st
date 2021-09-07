Class {
	#name : #PokaReader,
	#superclass : #Object,
	#instVars : [
		'buffer',
		'index'
	],
	#category : #Poka
}

{ #category : #initialization }
PokaReader >> initialize [ 
	self reset: ''
]

{ #category : #accessing }
PokaReader >> next [
	((buffer isEmpty) or: (index > buffer size))
		ifTrue: [ ^ #EOF ]
		ifFalse: [ 
			| ch |
			
			ch := buffer at: index.
			index := index + 1.
			^ ch	
		]
]

{ #category : #accessing }
PokaReader >> putBack: aChar [
	index = 1
		ifTrue: [ buffer := aChar asString , buffer ]
		ifFalse: [  
			index := index - 1.
			buffer at: index put: aChar	
		]
]

{ #category : #initialization }
PokaReader >> reset: aString [
	buffer := aString asArray.
	index := 1
]
