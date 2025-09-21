up:
	@echo "Creating docker containers"
	docker-compose up -d
	@echo "Removing known hosts for these containers"
	sh ./remove_known_host.sh

# Optional target to stop and remove containers
down:
	@echo "Stopping and removing Docker Compose containers..."
	docker-compose down
	@echo "Docker Compose containers stopped and removed."

.PHONY: up down