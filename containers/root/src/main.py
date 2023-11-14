import os
import boto3
import uvicorn
from fastapi import FastAPI, HTTPException
from fastapi.responses import StreamingResponse


app = FastAPI()
s3 = boto3.client("s3")


@app.get('/')
async def main():
  try:
    result = s3.get_object(Bucket=os.getenv('BUCKET'), Key=os.getenv('KEY'))
    return StreamingResponse(content=result["Body"].iter_chunks())
  except Exception as e:
        if hasattr(e, "message"):
            raise HTTPException(
                status_code=e.message["response"]["Error"]["Code"],
                detail=e.message["response"]["Error"]["Message"],
            )
        else:
            raise HTTPException(status_code=500, detail=str(e))
