#script para usar el modelo (no funcionando)

import tensorflow as tf
from keras import backend as K
from tensorflow.python.saved_model import tag_constants, signature_constants


def load_pb(path_to_pb):
    with tf.gfile.GFile(path_to_pb, "rb") as f:
        graph_def = tf.GraphDef()
        graph_def.ParseFromString(f.read())
    with tf.Graph().as_default() as graph:
        tf.import_graph_def(graph_def, name='')
        return graph2


def main():
    #grafo = load_pb("salida_aux/saved_model.pb")
    # entrada = grafo.
    #salida = grafo.get_tensor_by_name('output:0')

    # with tf.Session(graph=tf.Graph()) as sess:
    #    builder.add_meta_graph_and_variables(sess, ["tag"], signature_def_map= {
    #        "model": tf.saved_model.signature_def_utils.predict_signature_def(
    #            inputs= {'images': model_to_save.input},
    #           outputs= {"scores": model_to_save.output})
    #        })

    imagen = "img_pixels.csv" 
    export = "salidaTensorFlow/"
    #with K.get_session() as sess:
    #    tf.saved_model.loader.load(sess,[tag_constants.SERVING],export)
    #    grafo = tf.get_default_graph()
    #    x = grafo.get_tensor_by_name("input:0")
    #    model = grafo.get_tensor_by_name("output:0")
    #    print(sess.run(model,{x:["fotogragia.jpg"]}))

    with tf.Session(graph=tf.Graph()) as sess:
        tf.saved_model.loader.load(sess, [tag_constants.SERVING], export)
        graph = tf.get_default_graph()
        x = graph.get_tensor_by_name('images:0')
        model = graph.get_tensor_by_name("scores:0")
        print(sess.run(model, {x: (1,6,7,3)}))


if __name__ == "__main__":
    main()

#compile model in console

#caracteristicas
#saved_model_cli show --dir ./ --all

#np.random.rand()
#saved_model_cli run --dir ./ --tag_set serve --signature_def predict --input_exp 'images=np.random.rand(1,48,48,3)'
#saved_model_cli run --dir ./ --tag_set serve --signature_def model --input_exp 'images=np.random.rand(1,128,128,3)'