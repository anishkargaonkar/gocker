package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
	var PORT string
	if PORT = os.Getenv("PORT"); PORT == "" {
		PORT = "9652"
	}
	fmt.Print("Server Started !!")
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, test(), r.URL.Path)

	})
	http.ListenAndServe(":"+PORT, nil)
}

func test() string {
	return `Hello World from path : %s\n`
}
