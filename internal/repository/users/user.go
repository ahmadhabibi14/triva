package users

import (
	"errors"
	"time"
	"triva/internal/bootstrap/database"

	"github.com/google/uuid"
	"github.com/lib/pq"
)

const TABLE_User = `Users`

type User struct {
	Db *database.Database `db:"-" json:"-"`

	Id 					string 		`db:"id" json:"id"`
	Username 		string 		`db:"username" json:"username"`
	FullName 		string 		`db:"full_name" json:"full_name"`
	Email 			string 		`db:"email" json:"email"`
	Password 		string 		`db:"password" json:"password"`
	AvatarURL		string 		`db:"avatar_url" json:"avatar_url"`
	GoogleId 		string 		`db:"google_id" json:"google_id"`
	FacebookId	string 		`db:"facebook_id" json:"facebook_id"`
	GithubId 		string 		`db:"github_id" json:"github_id"`
	CreatedAt 	time.Time `db:"created_at" json:"created_at"`
	UpdatedAt 	time.Time `db:"updated_at" json:"updated_at"`
	DeletedAt 	time.Time `db:"deleted_at" json:"deleted_at"`
}

func NewUserMutator(Db *database.Database) *User {
	return &User{Db: Db}
}

func (u *User) CreateUser() error {
	query := `INSERT INTO ` + TABLE_User +` (id, username, full_name, email, password, created_at, updated_at)
VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING username`
	
	uid := uuid.New().String()
	if err := u.Db.DB.QueryRowx(query,
		uid, u.Username, u.FullName, u.Email, u.Password,
		time.Now(), time.Now(),
	).StructScan(u); err != nil {
		pgErr, ok := err.(*pq.Error)
		if ok && pgErr.Code == `23505` {
			return errors.New(`email or username is already in use`)
		}
		return err
	}

	return nil
}

func (u *User) FindUsernamePassword() error {
	query := `SELECT username, password FROM ` + TABLE_User + ` WHERE username = $1 LIMIT 1`
	err := u.Db.DB.Get(u, query, u.Username)
	if err != nil {
		return errors.New(`username not found`)
	}

	return nil
}