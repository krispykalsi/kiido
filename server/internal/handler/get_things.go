package handler

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/krispykalsi/kiido/server/internal/model"
)

func (h Handler) GetThings(c *gin.Context) {
	cid := c.Query("category")
	var things []model.Thing
	if cid != "" {
		things = h.repo.FetchThingsOfCategory(cid)
	} else {
		things = h.repo.FetchThings()
	}
	c.IndentedJSON(http.StatusOK, things)
}
