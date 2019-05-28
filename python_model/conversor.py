#conversor del modelo a tflite

import tensorflow as tf

path="simpleKeras/"

converter = tf.lite.TFLiteConverter.from_saved_model(path)
tflite_model = converter.convert()
open("tfLite/converted_model.tflite", "wb").write(tflite_model)