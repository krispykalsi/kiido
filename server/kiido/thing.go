package kiido

type Thing struct {
	Id         int64  `json:"id,omitempty"`
	Name       string `json:"name,omitempty"`
	Quantity   int    `json:"quantity,omitempty"`
	CategoryId int64  `json:"category_id,omitempty"`
	ImageUrl   string `json:"image_url,omitempty"`
	IconUrl    string `json:"icon_url,omitempty"`
}
