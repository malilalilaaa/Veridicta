from fastapi import FastAPI
from server.pydantic_models.chat_body import ChatBody

app = FastAPI()

# send quary
@app.post("/chat")
def chat_endpoint(body: ChatBody):
    print(body.query)
    return body.query