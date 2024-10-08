Class {
	#name : #TBCategoriesComponent,
	#superclass : #TBScreenComponent,
	#instVars : [
		'categories',
		'postsList'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #'as yet unclassified' }
TBCategoriesComponent class >> categories: categories postsList: aTBScreen [
	^ self new categories: categories; postsList: aTBScreen
]

{ #category : #accessing }
TBCategoriesComponent >> categories [
	^ categories
]

{ #category : #accessing }
TBCategoriesComponent >> categories: aCollection [
	categories := aCollection asSortedCollection
]

{ #category : #accessing }
TBCategoriesComponent >> postsList [
	^ postsList
]

{ #category : #accessing }
TBCategoriesComponent >> postsList: aComponent [
	postsList := aComponent
]

{ #category : #rendering }
TBCategoriesComponent >> renderCategoryLinkOn: html with: aCategory [
	html tbsLinkifyListGroupItem
	class: 'active' if: aCategory = self postsList currentCategory;
	callback: [ self selectCategory: aCategory ];
	with: aCategory
]

{ #category : #rendering }
TBCategoriesComponent >> renderContentOn: html [
	html tbsListGroup: [
	html tbsListGroupItem
	with: [ html strong: 'Categories' ].
	categories do: [ :cat |
	self renderCategoryLinkOn: html with: cat ] ]
]

{ #category : #'as yet unclassified' }
TBCategoriesComponent >> selectCategory: aCategory [
	postsList currentCategory: aCategory
]
