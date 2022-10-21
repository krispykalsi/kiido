package handler

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func (h Handler) GetCategories(c *gin.Context) {
	categories := h.repo.FetchCategories()
	c.IndentedJSON(http.StatusOK, categories)
}
