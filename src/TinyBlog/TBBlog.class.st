Class {
	#name : #TBBlog,
	#superclass : #Object,
	#instVars : [
		'posts',
		'adminUser'
	],
	#category : #TinyBlog
}

{ #category : #'as yet unclassified' }
TBBlog class >> createDemoPosts [
"TBBlog createDemoPosts"
self current
writeBlogPost: ((TBPost title: 'Welcome in TinyBlog' text:
'TinyBlog is a small blog engine made with Pharo.' category:
'TinyBlog') visible: true);
writeBlogPost: ((TBPost title: 'Report Pharo Sprint' text:
'Friday, June 12 there was a Pharo sprint / Moose dojo. It was a
nice event with more than 15 motivated sprinters. With the help
of candies, cakes and chocolate, huge work has been done'
category: 'Pharo') visible: true);
writeBlogPost: ((TBPost title: 'Brick on top of Bloc -
Preview' text: 'We are happy to announce the first preview
version of Brick, a new widget set created from scratch on top
of Bloc. Brick is being developed primarily by Alex Syrel
(together with Alain Plantec, Andrei Chis and myself), and the
work is sponsored by ESUG.
Brick is part of the Glamorous Toolkit effort and will provide
the basis for the new versions of the development tools.'
category: 'Pharo') visible: true);
writeBlogPost: ((TBPost title: 'The sad story of unclassified
blog posts' text: 'So sad that I can read this.') visible: true);
writeBlogPost: ((TBPost title: 'Working with Pharo on the
Raspberry Pi' text: 'Hardware is getting cheaper and many new
small devices like the famous Raspberry Pi provide new
computation power that was one once only available on regular
desktop computers.' category: 'Pharo') visible: true)
]

{ #category : #initialization }
TBBlog class >> current [ 
	^ self selectAll
	ifNotEmpty: [ :x | x anyOne ]
	ifEmpty: [ self new save ]
]

{ #category : #'as yet unclassified' }
TBBlog class >> defaultAdminLogin [
	^ 'admin'
]

{ #category : #'as yet unclassified' }
TBBlog class >> defaultAdminPassword [
	^ 'topsecret'
]

{ #category : #'class initialization' }
TBBlog class >> initialize [ 
	self reset
	
]

{ #category : #initialization }
TBBlog class >> initializeVoyageOnMemoryDB [
	VOMemoryRepository new enableSingleton
]

{ #category : #testing }
TBBlog class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
	in noSQL databases"
	^ true
]

{ #category : #initialization }
TBBlog class >> reset [ 
	self initializeVoyageOnMemoryDB
	
]

{ #category : #accessing }
TBBlog >> administrator [
	^ adminUser
]

{ #category : #accessing }
TBBlog >> allBlogPosts [
	^ posts
]

{ #category : #selection }
TBBlog >> allBlogPostsFromCategory: aCategory [ 
	^ posts select: [ :p | p category = aCategory ]
]

{ #category : #'as yet unclassified' }
TBBlog >> allCategories [
	^ (self allBlogPosts collect: [ :p | p category ]) asSet
]

{ #category : #accessing }
TBBlog >> allVisibleBlogPosts [
	^ posts select: [ :p | p isVisible ]
]

{ #category : #'as yet unclassified' }
TBBlog >> allVisibleBlogPostsFromCategory: aCategory [
	^ posts select: [ :p | p category = aCategory and: [ p isVisible ] ]
]

{ #category : #'as yet unclassified' }
TBBlog >> createAdministrator [
	^ TBAdministrator
		login: self class defaultAdminLogin
		password: self class defaultAdminPassword
]

{ #category : #initialization }
TBBlog >> initialize [ 
	super initialize.
	posts := OrderedCollection new.
	adminUser := self createAdministrator
]

{ #category : #'tests-as yet unclassified' }
TBBlog >> removeAllPosts [
	posts := OrderedCollection new.
	self save.
]

{ #category : #removing }
TBBlog >> removeBlogPost: aPost [
	posts remove: aPost ifAbsent: [ ].
	self save.
]

{ #category : #'as yet unclassified' }
TBBlog >> size [ 
	^ posts size
]

{ #category : #'as yet unclassified' }
TBBlog >> writeBlogPost: aPost [ 
	"Write the blog post in database"
	self allBlogPosts add: aPost.
	self save
]
