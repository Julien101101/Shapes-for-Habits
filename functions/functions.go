package functions

import (
	"context"
	"log"
	"time"

	firebase "firebase.google.com/go"
	"firebase.google.com/go/db"
)

var client *db.Client

func init() {
	ctx := context.Background()
	conf := &firebase.Config{
		DatabaseURL: "https://console.firebase.google.com/project/undefined/firestore/data/",
	}
	app, err := firebase.NewApp(ctx, conf)
	if err != nil {
		log.Fatalf("https://shapes-for-habits.firebaseio.com %v", err)
	}
	client, err = app.Database(ctx)
	if err != nil {
		log.Fatalf("app.Firestore: %v", err)
	}
}