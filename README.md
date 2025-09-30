# RAG 101

Code from the RAG tutorial from Langchain: https://python.langchain.com/docs/tutorials/rag/

## Prerequisites 
- Python 3.10 or newer

## To get started
1. Get some credit and an API token from https://platform.openai.com/ (€5 should be more than enough)
2. Get an account at LangSmith: https://smith.langchain.com/ and create a project
3. Copy `.env_example` and rename it as `.env`(Should be gitignored) 
4. Add your API keys and project name from LangSmith to your `.env` file
5. Install all dependencies in requirements.txt, preferably in a python virtual environment
6. Open jupyter lab via `jupyter lab`
7. Execute the code in any of the Jupyter books (start with minimalRag, to follow along with [this LangChain tutorial](https://python.langchain.com/docs/tutorials/rag/#setup) )

## Run with Docker (one command)

If you prefer not to install Python locally, you can run the notebooks in Docker.

### Quickstart

1. (Optional) Create a `.env` file next to this README and add any keys you need, for example:
   ```
   OPENAI_API_KEY=your_key_here
   LANGSMITH_API_KEY=your_key_here
   LANGSMITH_TRACING=true
   ```
2. Build and start Jupyter Lab:
   ```bash
   docker compose up --build
   ```
3. Open your browser at `http://localhost:8888` (no token/password required).

Your current folder is mounted into the container at `/workspace`, so changes you make to notebooks and files are saved on your host.

To stop the server, press Ctrl+C in the terminal or run:
```bash
docker compose down
```