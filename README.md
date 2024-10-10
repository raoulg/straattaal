# straattaal

![Demo](./streetlang-demo.gif)

## 🚀 Slang Generator Project
This project trains a Recurrent Neural Network (RNN) on BPE tokens from the "Amsterdamse Straattaal Woordenboek" to generate non-existent words that follow the learned syntax.

# 🔍 Project Overview
The Slang Generator project aims to create a model that can generate new slang words based on the patterns and structure of existing Amsterdam street language. It uses a RNN trained on BPE (Byte Pair Encoding) tokens to learn the syntax and generate novel words.

# 💾 Installation
To set up the project, follow these steps:

- Clone the repository
- Install dependencies (assuming you're using rye):
```bash
rye sync
```
or, with pip:
```bash
pip install .
```
# 🛠 Usage
To use the project, you can run the following commands:
```bash
make train  # Train the model
make build  # Build the Docker image
make run    # Run the Docker container
```
This assumes `docker` (see [link](https://www.docker.com/)) and `make`.
If you are stuck on a windows machine, you can install docker and run:
```bash
python src/slanggen/main.py         # train the model
docker build -t slang-backend .     # build the docker
docker run -p 80:80 slang-backend  # run the docker
```

## 🌐 Frontend
The project includes a frontend component.
It will start up when you run the docker container and can be accessed at [http://localhost:80](http://localhost:80).

# ⚙️ Configuration
The project uses a `slanggen.toml` file for configuration. Key settings include:

- Data paths
- Model parameters (vocabulary size, embedding dimensions, etc.)
- Training parameters (batch size, learning rate, etc.)

# 📁 Project Structure
The main components of the project are:
- `src/slanggen/main.py`: The main training script
- `Makefile`: Contains commands for building, running, and training
- `slanggen.toml`: Configuration file for the project
- `Dockerfile`: For containerizing the application

