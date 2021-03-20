# docker-pyodbc

## Introduction
Docker image with pyodbc installed

## Getting Started

1. Build

Build the docker image:

    cd docker-pyodbc/
    docker build -t pyodbc:Dockerfile .

2.	Run

Delete any docker images with the name my-pyodbc-image, if applicable:

    docker stop my-pyodbc-image
    docker rm my-pyodbc-image

Run the new docker image:

    docker run -dit --name my-pyodbc-image pyodbc:Dockerfile
    docker exec -i -t my-pyodbc-image /bin/bash
