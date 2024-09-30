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

{ #category : #'acessing-magritte' }
TBPost >> descriptionCategory [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Category';
		priority: 300;
		accessor: #category;
		comment: 'Unclassified if empty';
		componentClass: TBSMagritteTextInputComponent;
		yourself
]

{ #category : #'magritte descriptions' }
TBPost >> descriptionContainer [
	<magritteContainer>
	^ super descriptionContainer
		componentRenderer: TBSMagritteFormRenderer;
		yourself
]

{ #category : #'acessing-magritte' }
TBPost >> descriptionDate [
<magritteDescription>
^ MADateDescription new
label: 'Date';
priority: 400;
accessor: #date;
beRequired;
yourself
]

{ #category : #'acessing-magritte' }
TBPost >> descriptionText [
	<magritteDescription>
	^ MAMemoDescription new
		label: 'Text';
		priority: 200;
		accessor: #text;
		beRequired;
		requiredErrorMessage: 'A blog post must contain a text.';
		comment: 'Please enter a text';
		componentClass: TBSMagritteTextAreaComponent;
		yourself
]

{ #category : #'acessing-magritte' }
TBPost >> descriptionTitle [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Title';
		priority: 100;
		accessor: #title;
		requiredErrorMessage: 'A blog post must have a title.';
		comment: 'Please enter a title';
		componentClass: TBSMagritteTextInputComponent;
		beRequired;
		yourself
]

{ #category : #'acessing-magritte' }
TBPost >> descriptionVisible [
	<magritteDescription>
	^ MABooleanDescription new
		checkboxLabel: 'Visible';
		priority: 500;
		accessor: #visible;
		componentClass: TBSMagritteCheckboxComponent;
		beRequired;
		yourself
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
