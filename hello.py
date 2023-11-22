from fastapi import FastAPI
import time
import redis


app = FastAPI()
cache = redis.Redis(host='redis', port=6379)


def get_hit_count():
    retries = 5
    while True:
        try:
            return cache.incr('hits')
        except redis.exceptions.ConnectionError as exc:
            if retries == 0:
                raise exc
            retries -= 1
            time.sleep(0.5)


@app.get("/")
async def root():
    count = get_hit_count()
    return "What's up Docker Deep Divers! You've visited me {} times.\n".format(count)

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
