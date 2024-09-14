Class {
	#name : #TBPost,
	#superclass : #Object,
	#instVars : [
		'title',
		'text',
		'date',
		'category',
		'visible'
	],
	#category : #TinyBlog
}

{ #category : #'as yet unclassified' }
TBPost class >> title: aTitle text: aText [
	^ self new
	title: aTitle;
	text: aText; 
	category: self unclassifiedTag;
	notVisible ;
	yourself
]

{ #category : #'as yet unclassified' }
TBPost class >> title: aTitle text: aText category: aCategory [
	^ (self title: aTitle text: aText)
	category: aCategory;
	notVisible;
	yourself
]

{ #category : #'as yet unclassified' }
TBPost class >> unclassifiedTag [
	^ 'Unclassified'
]

{ #category : #acccessing }
TBPost >> beVisible [
	self visible: true
]

{ #category : #accessing }
TBPost >> category [
	^ category
]

{ #category : #accessing }
TBPost >> category: anObject [
	category := anObject
]

{ #category : #accessing }
TBPost >> date [
	^ date
]

{ #category : #accessing }
TBPost >> date: aDate [
	date := aDate
]

{ #category : #testing }
TBPost >> isUnclassified [
	^ self category = TBPost unclassifiedTag
]

{ #category : #testing }
TBPost >> isVisible [ 
	^ self visible
]

{ #category : #acccessing }
TBPost >> notVisible [
	self visible: false
]

{ #category : #accessing }
TBPost >> text [
	^ text
]

{ #category : #accessing }
TBPost >> text: anObject [
	text := anObject
]

{ #category : #accessing }
TBPost >> title [ 
	^ title
]

{ #category : #accessing }
TBPost >> title: aString [
	title := aString
]

{ #category : #accessing }
TBPost >> visible [
	^ visible
]

{ #category : #accessing }
TBPost >> visible: aBoolean [
	visible := aBoolean
]
