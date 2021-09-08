Class {
	#name : #PokaLexerTest,
	#superclass : #TestCase,
	#instVars : [
		'lexer',
		'reader'
	],
	#category : #Poka
}

{ #category : #initialization }
PokaLexerTest >> setUp [ 
	reader := PokaReader new reset: 'program hello(x := 23.9);'.
	lexer := PokaLexer new reset: reader
]

{ #category : #tests }
PokaLexerTest >> testEOF [
	9 timesRepeat: [ lexer nextToken ].
	self assert: lexer nextToken equals: #EOF
]

{ #category : #tests }
PokaLexerTest >> testNextDigit [
	lexer nextToken;
		nextToken;
		nextToken;
		nextToken;
		nextToken;
		nextToken.
	self assert: lexer nextToken equals: '23.9'
]

{ #category : #tests }
PokaLexerTest >> testNextSymbol [
	lexer nextToken;
		nextToken.
	self assert: lexer nextToken equals: $(
]

{ #category : #tests }
PokaLexerTest >> testNextToken [
	lexer nextToken.
	self assert: lexer nextToken equals: 'hello'
]

{ #category : #tests }
PokaLexerTest >> testSymbolBetween [
	lexer nextToken;
		nextToken;
		nextToken;
		nextToken;
		nextToken.
		
	self assert: lexer nextToken equals: $=
]
