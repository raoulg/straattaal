build-mac:
	docker build -t slang-backend .

# build-web:
# 	docker build -t slang-backend . --platform linux/amd64

run:
	docker run -p 5001:5001 slang-backend

train:
	python src/slanggen/main.py