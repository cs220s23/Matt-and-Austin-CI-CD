from flask import Flask
import redis
import dotenv
import os


dotenv.load_dotenv()

host = os.getenv('REDIS_HOST')
port = os.getenv('REDIS_PORT')

r = redis.Redis(host=host, port=port)


app = Flask(__name__)

def read_count():
    #Pulls data count from the redis server, with exception if it's blank
    try:
        count = int(r.get('count'))
        return count
    except ValueError:
        return 0


def save_count(count):
    #Ensures that the data count is set to redis server
    r.set('count', count)


@app.route("/")
def hello():
    #Gets count from redis, appends 1
    #save count to redis
    #returns a string incorporating this count
    count = read_count()    
    count += 1
    save_count(count)
    return "<h1 style='color:orange'>Hello World! {}</h1>".format(count) 

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
