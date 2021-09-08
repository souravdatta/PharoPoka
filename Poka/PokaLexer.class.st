Class {
	#name : #PokaLexer,
	#superclass : #Object,
	#instVars : [
		'reader'
	],
	#category : #Poka
}

{ #category : #initialization }
PokaLexer >> initialize [ 
	self reset: (PokaReader new reset: '')
]

{ #category : #testing }
PokaLexer >> isAlpha: aChar [
	aChar = #EOF
		ifTrue: [ ^ false ]
		ifFalse: [ ^ aChar isLetter ]
]

{ #category : #testing }
PokaLexer >> isDigit: aChar [
	aChar = #EOF
		ifTrue: [ ^ false ]
		ifFalse: [ ^ (aChar ~= #EOF) and: ((aChar isDigit) or: (aChar = $.)) ]
]

{ #category : #tokens }
PokaLexer >> nextDigit [ 
	| ch tokenString |
	
	tokenString := ''.
	ch := reader next.
	[ self isDigit: ch ] whileTrue: [  
		tokenString := tokenString , ch asString.
		ch := reader next
	].
	reader putBack: ch.
	
	^ tokenString
]

{ #category : #tokens }
PokaLexer >> nextSymbol [ 
	| ch tokenString |
	
	tokenString := ''.
	ch := reader next.
	[ self isAlpha: ch ] whileTrue: [  
		tokenString := tokenString , ch asString.
		ch := reader next
	].
	reader putBack: ch.
	
	^ tokenString
]

{ #category : #tokens }
PokaLexer >> nextToken [

	| ch |
	ch := reader next.
	ch = #EOF
		ifTrue: [ ^ch ].
	ch isSeparator ifTrue: [ ^ self nextToken ].
	(self isAlpha: ch) ifTrue: [ reader putBack: ch. ^ self nextSymbol ].
	(self isDigit: ch) ifTrue: [ reader putBack: ch. ^ self nextDigit ].
	^ ch
]

{ #category : #initialization }
PokaLexer >> reset: aReader [
	reader := aReader
]
