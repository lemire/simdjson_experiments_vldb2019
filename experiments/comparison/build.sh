#!/bin/bash
set -eux
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH/../../library/simdjson
mkdir build-benchmark
cd build-benchmark
cmake .. -DCMAKE_BUILD_TYPE=Release
# older cmake (3.13) needs one target at a time
cmake --build . -j $(nproc) --target parsingcompetition
cmake --build . -j $(nproc) --target allparsingcompetition

echo "$0: done building"

