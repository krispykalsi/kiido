package model

type Thing struct {
	Id       int64    `json:"id,omitempty"`
	Name     string   `json:"name,omitempty"`
	Quantity int      `json:"quantity,omitempty"`
	Category Category `json:"category,omitempty"`
	ImageUrl string   `json:"image_url,omitempty"`
	IconUrl  string   `json:"icon_url,omitempty"`
}

func MakeThing(id int64, name string, quantity int, category Category, imageUrl string, iconUrl string) Thing {
	return Thing{id, name, quantity, category, imageUrl, iconUrl}
}
