from fastapi import FastAPI

app = FastAPI()

# send quary
@app.post("/chat")
def chat_endpoint():
    pass