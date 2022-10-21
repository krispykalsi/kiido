package repository

import "github.com/krispykalsi/kiido/server/internal/model"

type Repository interface {
	FetchThings() []model.Thing
	FetchCategories() []model.Category
	FetchThingsOfCategory(categoryId string) []model.Thing
}
