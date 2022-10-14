package kiido

type Category struct {
	Id      int64  `json:"id,omitempty"`
	Name    string `json:"name,omitempty"`
	IconUrl string `json:"icon_url,omitempty"`
}
