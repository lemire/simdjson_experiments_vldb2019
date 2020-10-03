#!/bin/bash
RESULTSPATH=/results #hardcoded
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH/../../library/simdjson
for i in jsonexamples/*.json; do
    [ -f "$i" ] || break
    shortname=$(basename $i .json).table
    build-benchmark/benchmark/parsingcompetition -t $i > $RESULTSPATH/$shortname
    build-benchmark/benchmark/parsingcompetition  $i > $RESULTSPATH/detailed$shortname
    build-benchmark/benchmark/allparsingcompetition -t $i > $RESULTSPATH/all$shortname
    echo -n "."
done
echo
