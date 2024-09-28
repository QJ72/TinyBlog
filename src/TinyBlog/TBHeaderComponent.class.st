Class {
	#name : #TBHeaderComponent,
	#superclass : #WAComponent,
	#category : #'TinyBlog-Components'
}

{ #category : #rendering }
TBHeaderComponent >> renderBrandOn: html [
	html tbsNavbarHeader: [
		html tbsNavbarBrand
		url: self application url;
		with: 'TinyBlog' 
	]
]

{ #category : #rendering }
TBHeaderComponent >> renderButtonsOn: html [ 
	self renderSimpleAdminButtonOn: html
]

{ #category : #rendering }
TBHeaderComponent >> renderContentOn: html [
	html tbsNavbar beDefault; with: [ 
		html tbsContainer: [ 
			self renderBrandOn: html.
			self renderButtonsOn: html
			]
		]
]

{ #category : #rendering }
TBHeaderComponent >> renderSimpleAdminButtonOn: html [ 
	html form: [ 
		html tbsNavbarButton 
			tbsPullRight ;
			with: [ 
				html tbsGlyphIcon iconListAlt.
				html text: ' Admin View' 
			]
	]
]
