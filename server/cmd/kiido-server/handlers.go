package main

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func getThings(c *gin.Context) {
	c.String(http.StatusOK, "things" + c.Query("category"))
}

func getCategories(c *gin.Context) {
	c.String(http.StatusOK, "categories")
}
