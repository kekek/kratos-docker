#!/usr/bin/env bash

echo ">> build images"
echo "docker build -t kratos:v1.1 ."
echo

echo ">> run test-kratos"
echo "docker run -it --rm --name test-kratos kratos:v1.1"
echo

echo ">> new project"
echo "docker run -it --rm --dns "114.114.114.114" -v \$(pwd):/go/src/app/  --name test-kratos {kratos:v1-1} {kratos new test}"
echo

