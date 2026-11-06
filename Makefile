IMAGE_NAME ?= dchris-api
IMAGE_TAG  ?= latest

# Build the Go binary locally
build:
	go build -o $(IMAGE_NAME) main.go

# Build the container image
build-image:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

# Run the container locally
run:
	docker run --rm -p 8084:8084 $(IMAGE_NAME):$(IMAGE_TAG)

# Push the image to the local podman registry
push:
	docker tag $(IMAGE_NAME):$(IMAGE_TAG) localhost:5000/$(IMAGE_NAME):$(IMAGE_TAG)
	docker push localhost:5000/$(IMAGE_NAME):$(IMAGE_TAG)

# Load the image into minikube
load:
	docker save $(IMAGE_NAME):$(IMAGE_TAG) | minikube image load --overwrite=true -

.PHONY: build build-image run push load
