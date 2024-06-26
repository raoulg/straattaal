build:
	docker build -t slang-backend .

run:
	docker run -p 80:5001 slang-backend

train:
	python src/slanggen/main.py