import json
import threading
import requests
import asyncio
import mysql.connector


print('Conectando a la base de datos')
mydb = mysql.connector.connect(host="localhost",user="root",passwd="camilo12",database="userinfo")
mycursor = mydb.cursor()

async def get_response(url):
    for i in range(2):
        res = requests.get(url)
        if res.status_code ==200:
            await get_responses(res.json())
        else:
            get_error()

async def get_responses(response):
    res = response.get("results")[0].get("location")
    res2 = response.get("results")[0].get("name")
    res3 = response.get("results")[0].get("gender")
    print(res2)
    print(res3)
    print(res)
    await creartxt(res2,res3,res)
    await insertDB(res2,res3,res,mydb,mycursor)

async def creartxt(res,res2,res3):
    txt=open('data.txt','a')
    txt.write(json.dumps(res))
    txt.write('\n')
    txt.write(json.dumps(res2))
    txt.write('\n')
    txt.write(json.dumps(res3))
    txt.write('\n')
async def insertDB(name,gender,location,mydb,mycursor):
    sql = "INSERT INTO user (title, first, last,gender,street_number,street_name,city,state,country,postcode,coordinates_latitud,coordinates_longitud,timezone_offset,timezone_description) VALUES (%s, %s ,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
    val = (name.get('title'), name.get('first'), name.get('last'),gender,location.get('street').get('number'), location.get('street').get('name'), location.get('city'), location.get('state'), location.get('country'),
           location.get('postcode'), location.get('coordinates').get('latitude'), location.get('coordinates').get('longitude'), location.get('timezone').get('offset'), location.get('timezone').get('description'))
    mycursor.execute(sql, val)
    mydb.commit()
    if (mycursor.rowcount > 0):
        print('usuario guardado con exito')


def get_error():
    print("error de respuesta")


def services(url):
    eventLoop = asyncio.new_event_loop()
    asyncio.set_event_loop(eventLoop)

    try:
        eventLoop.run_until_complete(get_response(url))
    finally:
        eventLoop.close()

if __name__ == "__main__":
    threading.Thread(target=services,kwargs={"url":"https://randomuser.me/api/"}).start()

