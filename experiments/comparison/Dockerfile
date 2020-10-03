FROM gcc:9.1
COPY . /usr/src/
WORKDIR /usr/src/experiments/comparison
RUN apt update && apt install cmake -y
RUN ./build.sh
CMD ["bash", "run.sh"]
