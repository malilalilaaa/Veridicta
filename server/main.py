import asyncio
from fastapi import FastAPI
from pydantic_models.chat_body import ChatBody
from services.search_service import SearchService
from services.sort_source_service import SortSourceService
from services.llm_service import LLMService
from fastapi import WebSocket, WebSocketDisconnect


app = FastAPI()
search_service = SearchService()
sort_source_service = SortSourceService()
llm_service = LLMService()

@app.websocket("/ws/chat")
async def websocket_chat_endpoint(websocket: WebSocket):
    await websocket.accept()

    try:
        await asyncio.sleep(0.1)
        data = await websocket.receive_json()
        print(f"Received data: {data}")

        query = data.get("query")
        if not query:
            print("Query is missing in request.")
            await websocket.send_json({"type": "error", "message": "Query is required."})
            return

        search_results = search_service.web_search(query)
        print(f"Search results: {search_results}")

        if not search_results:
            await websocket.send_json({"type": "error", "message": "No search results found."})
            return

        sorted_results = sort_source_service.sort_sources(query, search_results)
        print(f"Sorted results: {sorted_results}")

        if not sorted_results:
            await websocket.send_json({"type": "error", "message": "No sorted results available."})
            return

        await asyncio.sleep(0.1)
        await websocket.send_json({"type": "search_result", "data": sorted_results})

        response_generator = llm_service.generate_response(query, sorted_results)
        if response_generator is None:
            await websocket.send_json({"type": "error", "message": "Failed to generate response."})
            return

        for chunk in response_generator:
            print(f"Sending chunk: {chunk}")
            await asyncio.sleep(0.1)
            await websocket.send_json({"type": "content", "data": chunk})

    except Exception as e:
        import traceback
        traceback.print_exc()
        await websocket.send_json({"type": "error", "message": f"Server error: {str(e)}"})

    finally:
        await websocket.close()

#send quary
@app.post("/chat")
def chat_endpoint(body: ChatBody):
	
	search_results = search_service.web_search(body.query)
	print(search_results)
	sorted_results = sort_source_service.sort_sources(body.query, search_results)
	
	sort_source_service.sort_sources(body.query, search_results)

	response = llm_service.generate_response(body.query, sorted_results)
	return response
    
