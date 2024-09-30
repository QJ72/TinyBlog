Class {
	#name : #TBPostsReport,
	#superclass : #TBSMagritteReport,
	#instVars : [
		'blog'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #'as yet unclassified' }
TBPostsReport class >> filteredDescriptionsFrom: aBlogPost [
	"Filter only some descriptions for the report columns."
	^ aBlogPost magritteDescription
select: [ :each | #(title category date) includes: each accessor
selector ]
]

{ #category : #'instance creation' }
TBPostsReport class >> from: aBlog [
 | report blogPosts |
blogPosts := aBlog allBlogPosts.
report := self rows: blogPosts description: (self
filteredDescriptionsFrom: blogPosts anyOne).
report blog: aBlog.
report addCommands: report.
^ report
]

{ #category : #adding }
TBPostsReport >> addCommands: aReport [
	self addColumn: (MACommandColumn new
addCommandOn: aReport selector: #viewPost: text: 'View';
yourself;
addCommandOn: aReport selector: #editPost: text: 'Edit';
yourself;
addCommandOn: aReport selector: #deletePost: text: 'Delete';
yourself).
]

{ #category : #adding }
TBPostsReport >> addPost [
	| post |
	post := self call: (self renderAddPostForm: TBPost new).
	post
		ifNotNil: [ :arg | 
			blog writeBlogPost: post.
			self refreshReport ]
]

{ #category : #accessing }
TBPostsReport >> blog [
	^ blog
]

{ #category : #accessing }
TBPostsReport >> blog: aTBBlog [
	blog := aTBBlog
]

{ #category : #accessing }
TBPostsReport >> deletePost: aPost [
	(self confirm: 'Do you want remove this post ?')
		ifFalse: [ ^ self ].
	blog removeBlogPost: aPost.
	self refreshReport
]

{ #category : #accessing }
TBPostsReport >> editPost: aPost [
	| post |
	post := self call: (self renderEditPostForm: aPost).
	post ifNotNil: [ :arg | blog save ]
]

{ #category : #'as yet unclassified' }
TBPostsReport >> refreshReport [
	self rows: blog allBlogPosts.
	self refresh.
]

{ #category : #rendering }
TBPostsReport >> renderAddPostForm: aPost [
	^ aPost asComponent
		addDecoration: (TBSMagritteFormDecoration buttons: { #save
	-> 'Add post' . #cancel -> 'Cancel'});
		yourself
]

{ #category : #rendering }
TBPostsReport >> renderContentOn: html [
	html tbsGlyphIcon iconPencil.
	html anchor
		callback: [ self addPost ];
		with: 'Add post'.
	super renderContentOn: html
]

{ #category : #rendering }
TBPostsReport >> renderEditPostForm: aPost [
	^ aPost asComponent addDecoration: (
		TBSMagritteFormDecoration buttons: {
			#save -> 'Save post'.
			#cancel -> 'Cancel'});
		yourself
]

{ #category : #rendering }
TBPostsReport >> renderViewPostForm: aPost [
	^ aPost asComponent
		addDecoration: (TBSMagritteFormDecoration buttons: { #cancel
	-> 'Back' });
		readonly: true;
		yourself
]
