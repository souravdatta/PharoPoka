Class {
	#name : #PokaLexer,
	#superclass : #Object,
	#instVars : [
		'token',
		'lastToken',
		'reader'
	],
	#category : #Poka
}

{ #category : #initialization }
PokaLexer >> initialize [ 
	self reset: PokaReader new
]

{ #category : #initialization }
PokaLexer >> reset: aReader [
	reader := aReader
]
