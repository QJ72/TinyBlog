Class {
	#name : #TBSession,
	#superclass : #WASession,
	#instVars : [
		'currentAdmin'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #accessing }
TBSession >> currentAdmin [
	^ currentAdmin
	
]

{ #category : #accessing }
TBSession >> currentAdmin: anObject [
	currentAdmin := anObject
]

{ #category : #testing }
TBSession >> isLogged [
	^ self currentAdmin notNil
]

{ #category : #rendering }
TBSession >> renderDisconnectButtonOn: html [
html tbsNavbarButton
tbsPullRight;
callback: [ self session reset ];
with: [
html text: 'Disconnect '.
html tbsGlyphIcon iconLogout ]
]

{ #category : #initialization }
TBSession >> reset [
	currentAdmin := nil.
	self requestContext redirectTo: self application url.
	self unregister.
]
