package main

import (
	"os"

	"github.com/gin-gonic/gin"
	"github.com/krispykalsi/kiido/server/internal/handler"
	"github.com/krispykalsi/kiido/server/internal/repository"
)

func main() {
	gin.SetMode(gin.ReleaseMode)
	r := gin.Default()
	repo := repository.New()
	h := handler.New(repo)

	r.GET("/things", h.GetThings)
	r.GET("/categories", h.GetCategories)

	port := os.Getenv("KIIDO_PORT")
	if port == "" {
		port = "8000"
	}
	r.Run("localhost:" + port)
}
