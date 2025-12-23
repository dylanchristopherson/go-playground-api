
rungo:
	go run main.go


build:
	docker build -t playground-api:latest .

run:
	docker run -d -p 8080:8080 playground-api:latest

stop: 
	docker stop playground-api
