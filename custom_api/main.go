package main

import (
	"encoding/json"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	// Set CORS headers to allow cross-origin requests
	w.Header().Set("Access-Control-Allow-Origin", "*")                   // Allow all origins
	w.Header().Set("Access-Control-Allow-Methods", "GET, POST, OPTIONS") // Allow specific HTTP methods
	w.Header().Set("Access-Control-Allow-Headers", "Content-Type")       // Allow specific headers

	// Handle preflight requests (OPTIONS method)
	if r.Method == http.MethodOptions {
		w.WriteHeader(http.StatusOK)
		return
	}

	// Your regular response
	response := map[string]string{"message": "Hello, Cloud!"}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

func main() {
	http.HandleFunc("/json", handler)
	http.ListenAndServe(":8080", nil)
}
