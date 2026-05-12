PORT=8081
IMAGE_NAME=classification-api
CONTAINER_NAME=classification-container

all: clean build run

build:
	@echo "--- Proje build ediliyor... ---"
	docker build -t $(IMAGE_NAME) ./classification-api

run:
	@echo "--- Konteyner başlatılıyor... ---"
	@echo "Uygulama adresi: http://localhost:$(PORT)"
	docker run -d --name $(CONTAINER_NAME) -p $(PORT):8081 $(IMAGE_NAME)
	@echo "--- Başarıyla çalıştı! ---"

stop:
	@echo "--- Konteyner durduruluyor... ---"
	-docker stop $(CONTAINER_NAME)
	-docker rm $(CONTAINER_NAME)

clean: stop
	@echo "--- Eski imajlar temizleniyor... ---"
	-docker rmi $(IMAGE_NAME)