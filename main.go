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
	router.GET("/ping", pong)

	router.Run("localhost:8084")
}

func test(c *gin.Context) {
	c.IndentedJSON(http.StatusOK, "Hello")
}

func pong(c *gin.Context) {
	c.JSON(200, gin.H{
		"message": "pong",
	})
}
