package model

type Category struct {
	Id             int64  `json:"id,omitempty"`
	Name           string `json:"name,omitempty"`
	IconUrl        string `json:"icon_url,omitempty"`
	NumberOfThings int    `json:"number_of_things,omitempty"`
}

func MakeCategory(id int64, name string, iconUrl string, numberOfThings int) Category {
	return Category{id, name, iconUrl, numberOfThings}
}
