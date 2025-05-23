from fastapi import FastAPI
from pydantic_models.chat_body import ChatBody
from services.search_service import SearchService
from services.sort_source_service import SortSourceService

app = FastAPI()
search_service = SearchService()
sort_source_service = SortSourceService()
#send quary
@app.post("/chat")
def chat_endpoint(body: ChatBody):
	
	# search the web and find appripiate sources
	
	search_results = search_service.web_search(body.query)
	print(search_results)
	
	# sort the sources
	
	sort_source_service.sort_sources(body.query, search_results)
	# generate the response using LLM/Gemini
	
	return body.query
    
