from fastapi.security import HTTPBearer
from fastapi import FastAPI, Request, HTTPException
from utils.jwt_manager import validate_token


class JWTBearer(HTTPBearer):
    async def __call__(self, request: Request):
        auth = await super().__call__(request)
        data = validate_token(auth.credentials)
        if not data:
            raise HTTPException(status_code=403, detail="Invalid token")
        
        request.state.user = data