package repository

import (
	"database/sql"
	"fmt"
	"os"

	"github.com/krispykalsi/kiido/server/internal/model"
	_ "github.com/lib/pq"
)

type DBRepository struct {
	db *sql.DB
}

func New() Repository {
	var (
		host     = os.Getenv("KIIDO_HOST")
		database = os.Getenv("KIIDO_DATABASE")
		user     = os.Getenv("KIIDO_USER")
		password = os.Getenv("KIIDO_PASSWORD")
	)
	connectionString := fmt.Sprintf("host=%s user=%s password=%s dbname=%s sslmode=require", host, user, password, database)
	db, err := sql.Open("postgres", connectionString)
	checkError(err)
	fmt.Println("Waiting for connection...")
	err = db.Ping()
	checkError(err)
	fmt.Println("Connected ✅")
	return &DBRepository{db}
}

func (r DBRepository) FetchThings() []model.Thing {
	var things []model.Thing
	q := `select 
	t.id,
	t."name",
	t.quantity,
	t.image_url,
	t.icon_url,
	c.id as category_id,
	c."name" as category_name,
	c.icon_url as category_icon_url,
	(select count(*) from thing where category_id = c.id) as number_of_things
from thing t
join category c on c.id  = t.category_id;`
	rows, err := r.db.Query(q)
	checkError(err)
	defer rows.Close()

	for rows.Next() {
		t := model.Thing{}
		c := model.Category{}
		switch err := rows.Scan(&t.Id, &t.Name, &t.Quantity, &t.ImageUrl, &t.IconUrl, &c.Id, &c.Name, &c.IconUrl, &c.NumberOfThings); err {
		case nil:
			t.Category = c
			things = append(things, t)
		default:
			checkError(err)
		}
	}
	return things
}

func (r DBRepository) FetchCategories() []model.Category {
	var categories []model.Category
	q := `SELECT *, (select count(*) from thing where category_id = c.id) number_of_things FROM category c;`
	rows, err := r.db.Query(q)
	checkError(err)
	defer rows.Close()

	for rows.Next() {
		c := model.Category{}
		switch err := rows.Scan(&c.Id, &c.Name, &c.IconUrl, &c.NumberOfThings); err {
		case sql.ErrNoRows:
			return categories
		case nil:
			categories = append(categories, c)
		default:
			checkError(err)
		}
	}
	return categories
}

func (r DBRepository) FetchThingsOfCategory(categoryId string) []model.Thing {
	var c model.Category
	q := fmt.Sprintf("select *, (select count(*) from thing where category_id = c.id) number_of_things from category c where c.id = %s;", categoryId)
	cRows, err := r.db.Query(q)
	checkError(err)
	defer cRows.Close()
	cRows.Next()
	err = cRows.Scan(&c.Id, &c.Name, &c.IconUrl, &c.NumberOfThings)
	checkError(err)

	var things []model.Thing
	q = fmt.Sprintf(`select id, name, quantity, image_url, icon_url from thing where category_id = %s;`, categoryId)
	rows, err := r.db.Query(q)
	checkError(err)
	defer rows.Close()

	for rows.Next() {
		t := model.Thing{}
		switch err := rows.Scan(&t.Id, &t.Name, &t.Quantity, &t.ImageUrl, &t.IconUrl); err {
		case nil:
			t.Category = c
			things = append(things, t)
		default:
			checkError(err)
		}
	}
	return things
}

func checkError(err error) {
	if err != nil {
		panic(err)
	}
}
