package main

import (
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	fmt.Println("Hello world")

	router := gin.Default()
	router.GET("/test", test)

	router.Run("localhost:8080")
}

func test(c *gin.Context) {
	c.IndentedJSON(http.StatusOK, "Hello")
}
