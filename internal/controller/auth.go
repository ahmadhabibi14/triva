package controller

import (
	"os"
	"time"
	"triva/configs"
	"triva/helper"
	"triva/internal/request"
	"triva/internal/response"
	"triva/internal/service"

	"github.com/gofiber/fiber/v2"
)

type AuthController struct {
	AuthPrefix  string
	authService *service.AuthService
}

func NewAuthController(authService *service.AuthService) *AuthController {
	return &AuthController{
		AuthPrefix:  `/auth`,
		authService: authService,
	}
}

type (
	LoginIn struct {
		Username string `json:"username" form:"username" validate:"required,omitempty,min=5"`
		Password string `json:"password" form:"password" validate:"required,min=8"`
	} // @name LoginIn
	LoginOut struct {
		Session string `json:"session" form:"session"`
		Message string `json:"message" form:"message"`
	} // @name LoginOut
)

const (
	LoginAction = `/login`
	LoginOkMsg  = `login successful !`
)

// @Summary 			Login to authenticated
// @Tags					Auth
// @Param 				requestBody  body  LoginIn  true  "User credentials"
// @Success				200 {object} LoginOut
// @Produce				json
// @Router				/auth/login [post]
func (ac *AuthController) Login(c *fiber.Ctx) error {
	in, err := helper.ReadJSON[LoginIn](c, c.Body())
	if err != nil {
		response := helper.NewHTTPResponse(err.Error(), nil)
		return c.Status(fiber.StatusBadRequest).JSON(response)
	}

	sessionKey, err := ac.authService.Login(in.Username, in.Password)
	if err != nil {
		response := helper.NewHTTPResponse(err.Error(), nil)
		return c.Status(fiber.StatusBadRequest).JSON(response)
	}

	ac.setCookie(c, sessionKey)

	out := LoginOut{Session: sessionKey, Message: LoginOkMsg}
	response := helper.NewHTTPResponse(``, out)
	return c.Status(fiber.StatusOK).JSON(response)
}

const (
	RegisterAction = `/register`
	RegisterOkMsg  = `user created !`
)

// @Summary 			Regiser to create an account
// @Tags					Auth
// @Param 				requestBody  body  request.RegisterIn  true  "User data"
// @Success				200 {object} response.RegisterOut
// @Produce				json
// @Router				/auth/register [post]
func (ac *AuthController) Register(c *fiber.Ctx) error {
	in, err := helper.ReadJSON[request.RegisterIn](c, c.Body())
	if err != nil {
		response := helper.NewHTTPResponse(err.Error(), nil)
		return c.Status(fiber.StatusBadRequest).JSON(response)
	}

	err = ac.authService.Register(
		in.Username, in.FullName, in.Email, in.Password,
	)

	if err != nil {
		response := helper.NewHTTPResponse(err.Error(), nil)
		return c.Status(fiber.StatusBadRequest).JSON(response)
	}

	out := response.RegisterOut{Message: RegisterOkMsg}
	response := helper.NewHTTPResponse(``, out)
	return c.Status(fiber.StatusCreated).JSON(response)
}

func (ac *AuthController) ResetPassword(c *fiber.Ctx) error {
	return c.Status(fiber.StatusOK).JSON(fiber.Map{`ok`: true})
}

func (ac *AuthController) ForgotPassword(c *fiber.Ctx) error {
	return c.Status(fiber.StatusOK).JSON(fiber.Map{`ok`: true})
}

// ##################################### //
// ########### Utilities ############### //
// ##################################### //

func (ac *AuthController) setCookie(c *fiber.Ctx, sessionId string) {
	// 2 months expired
	expiration := time.Now().AddDate(0, 2, 0)

	c.Cookie(&fiber.Cookie{
		Name:     configs.AUTH_COOKIE,
		Value:    sessionId,
		Expires:  expiration,
		SameSite: `Lax`,
		Secure:   os.Getenv(`PROJECT_ENV`) == `prod`,
		HTTPOnly: true,
	})
}
