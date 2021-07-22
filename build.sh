#!/usr/bin/env bash

echo ">> build images"
echo "docker build -t kratos ."
echo

echo ">> run test-kratos"
echo "docker run -it --rm --name test-kratos kratos"
echo

echo ">> new project"
echo "docker run -it --rm --dns "114.114.114.114" -v \$(pwd):/go/src/app/  --name test-kratos {kekek/kratos:v2} {kratos new test}"
echo

