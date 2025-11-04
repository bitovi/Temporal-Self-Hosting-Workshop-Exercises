#!/bin/bash

CLUSTER=$1
NUMOFREQUESTS=$2
TYPE=$3
TEMPORAL_GRPC_ENDPOINT=""

echo "Starting runner for cluster: [$CLUSTER], Task Type: [$TYPE]"

if [[ "$CLUSTER" == "temporal" ]];then
    export TEMPORAL_GRPC_ENDPOINT=127.0.0.1:7233
elif [[ "$CLUSTER" == "mc-temporal" ]]; then
    export TEMPORAL_GRPC_ENDPOINT=127.0.0.1:8233
else
    echo "Unknown cluster"
    exit 2
fi

cd benchmark-workers
if [[ "$TYPE" == "" ]]; then
    go run ./cmd/runner \
    -t ExecuteActivity \
    -backoff-factor 1 \
    -c $NUMOFREQUESTS '{"Count":3,"Activity":"Echo","Input":{"Message":"test"}}'
elif [[ "$TYPE" == "sleep" ]];then
    go run ./cmd/runner \
    -t DSLWorkflow \
    -c $NUMOFREQUESTS '[{"a":"Echo","i":{"Message":"pre-sleep"}, "r": 3},{"a":"Sleep","i":{"SleepTimeInSeconds":5}, "r": 3},{"a":"Echo","i":{"Message":"post-sleep"}, "r": 3}]'
fi