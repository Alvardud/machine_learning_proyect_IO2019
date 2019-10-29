#script que utiliza el modelo de tensorflow (si funciona)

import requests
import json
from keras.preprocessing import image


img = image.load_img('./edit.jpg', target_size=(48, 48))
img_array = image.img_to_array(img)/255

payload = {
  "instances": [{'images': img_array.tolist()}]
}
r = requests.post('http://localhost:9000/v1/models/metodo:predict', json=payload)
var = json.loads(r.content)
lista = var['predictions'][0]
emociones = ["enojado","asco","miedo","feliz","triste","sorpresa","neutral"]

for x in range(0,6):
    print(emociones[x]," : ",round(lista[x],2),"%")