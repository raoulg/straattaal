# Variables
IMAGE_NAME := slang-backend
HOST_PORT := 80
CONTAINER_PORT := 80
DIST_DIR := dist
VERSION := 0.3.1
WHEEL_FILE := $(DIST_DIR)/slanggen-$(VERSION)-py3-none-any.whl

# Colors
RED := \033[0;31m
GREEN := \033[0;32m
YELLOW := \033[1;33m
NC := \033[0m # No Color

# Phony targets to prevent conflicts with files of the same name
.PHONY: all build run train check-wheel help up down stop status logs

# Default target
all: build

# Show help
help:
	@echo "Available commands:"
	@echo "  make help              Show this help message"
	@echo "  make all               Default target (builds Docker image)"
	@echo "  make build             Build Docker image"
	@echo "  make run               Run Docker container"
	@echo "  make train             Train the model"
	@echo "  make check-wheel       Check for wheel file and build if missing"
	@echo "Docker Compose commands:"
	@echo "  make up                Start services with Docker Compose"
	@echo "  make down              Stop and remove Docker Compose services"
	@echo "  make stop              Stop Docker Compose services (preserves containers)"
	@echo "  make status            Show status of Docker Compose services"
	@echo "  make logs              Show logs from Docker Compose services"

# Build Docker image, depends on .whl file
build: check-wheel
	@echo "$(GREEN)Building Docker image...$(NC)"
	docker build -t $(IMAGE_NAME) .

# Run Docker container
run:
	@echo "$(GREEN)Running Docker container...$(NC)"
	docker run -p $(HOST_PORT):$(CONTAINER_PORT) $(IMAGE_NAME)

# Train the model
train:
	@echo "$(GREEN)Training model...$(NC)"
	python src/slanggen/main.py

# Check for wheel file
check-wheel: $(WHEEL_FILE)

$(WHEEL_FILE):
	@echo "$(RED)$(WHEEL_FILE) file not found in $(DIST_DIR). Running 'uv build --wheel'...$(NC)"
	uv build --wheel

# Docker Compose commands
up:
	@echo "$(GREEN)Starting Docker Compose services...$(NC)"
	docker compose up -d

down:
	@echo "$(YELLOW)Stopping and removing Docker Compose services...$(NC)"
	docker compose down

stop:
	@echo "$(YELLOW)Stopping Docker Compose services...$(NC)"
	docker compose stop

status:
	@echo "$(GREEN)Docker Compose services status:$(NC)"
	docker compose ps

logs:
	@echo "$(GREEN)Docker Compose logs:$(NC)"
	docker compose logs -f
