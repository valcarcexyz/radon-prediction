FROM tensorflow/serving
ENV PWD RUN echo $PWD
# ENV DOCKER_PORT 8080
COPY . ${PWD}
WORKDIR ${PWD}
# EXPOSE ${DOCKER_PORT}
ENTRYPOINT "tensorflow_model_server" "--model_base_path=$PWD/models/radon_prediction" "--model_name=radon_prediction"
# /home/valcarce/Documentos/universidad/2021ColaboracionDepartamento/radon/radon-prediction/models/radon_prediction

CMD ["--rest_api_port=8501", "--port=8500"]

# LO QUE FUNCIONA
# docker run -t --rm -p 8501:8501 -v "$PWD/models/radon_prediction/:/models/radon_prediction" -e MODEL_NAME=radon_prediction tensorflow/serving


# request funcionando:
# data = np.zeros((1, 15, 2))
# resp = requests.post("http://localhost:8501/v1/models/radon_prediction:predict", data = json.dumps({"instances": data.tolist()}))
# resp.text -> incluye un atributo predictions