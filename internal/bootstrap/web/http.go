package web

import (
	"errors"
	"os"
	"triva/helper"

	"github.com/goccy/go-json"
	"github.com/gofiber/fiber/v2"
)

type Webserver struct {
	fiber.Config
}

func NewWebserver() *fiber.App {
	return fiber.New(fiber.Config{
		AppName: os.Getenv("PROJECT_NAME"),
		Prefork: false,
		JSONEncoder: json.Marshal,
		JSONDecoder: json.Unmarshal,
		EnableTrustedProxyCheck: true,
		ErrorHandler: func(c *fiber.Ctx, err error) error {
			var code int = fiber.StatusNotFound
			var e *fiber.Error
			if errors.As(err, &e) {
				code = e.Code
			}

			resp := helper.NewHTTPResponse(e.Error(), nil)

			c.Set(fiber.HeaderContentType, fiber.MIMEApplicationJSON)
			return c.Status(code).JSON(resp)
		},
	})
}