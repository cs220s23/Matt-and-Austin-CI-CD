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
    count=int(r.get('count'))
    return count


def save_count(count):
    # This ensures that the directory exists
    r.set('count', count)


@app.route("/")
def hello():
    count = read_count()    
    count += 1
    save_count(count)
    return "<h1 style='color:green'>Hello World! {}</h1>".format(count) 

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
