package domain

type Repository interface {
	FetchThings() []Thing
	FetchCategories() []Category
	FetchThingsOfCategory(categoryId string) []Thing
}
