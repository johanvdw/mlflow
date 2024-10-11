FROM python:3.11-bookwom

WORKDIR /home/mlflow

RUN apt-get install -y --no-install-recommends nodejs \
    # java
    openjdk-11-jre-headless \
    # protobuf 
     protobuf-compiler \
    # yarn
    && npm install --global yarn \
    # adding an unprivileged user
    && groupadd --gid 10001 mlflow  \
    && useradd --uid 10001 --gid mlflow --shell /bin/bash --create-home mlflow

ENV PATH="/home/mlflow/.local/protoc/bin:$PATH"

# the "mlflow" user created above, represented numerically for optimal compatibility with Kubernetes security policies
USER 10001

CMD ["bash"]
