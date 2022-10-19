package main

import "github.com/gin-gonic/gin"

func main() {
	r := gin.Default()
	r.GET("/things", getThings)
	r.GET("/categories", getCategories)
	r.Run("localhost:5858")
}
