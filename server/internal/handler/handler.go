package handler

import "github.com/krispykalsi/kiido/server/internal/repository"

type Handler struct {
	repo repository.Repository
}

func New(repo repository.Repository) *Handler {
	return &Handler{repo}
}
