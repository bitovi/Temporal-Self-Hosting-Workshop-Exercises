#!/bin/bash

CLUSTER=$1
PORT=""

echo "Starting worker for cluster: [$CLUSTER]"

if [[ "$CLUSTER" == "temporal" ]];then
    PORT=7233
elif [[ "$CLUSTER" == "mc-temporal" ]]; then
    PORT=8233
else
    echo "Unknown cluster"
    exit 2
fi

export TEMPORAL_GRPC_ENDPOINT=127.0.0.1:$PORT
export TEMPORAL_NAMESPACE=default
export TEMPORAL_TASK_QUEUE=benchmark
export TEMPORAL_WORKFLOW_TASK_POLLERS=16
export TEMPORAL_ACTIVITY_TASK_POLLERS=8

cd benchmark-workers
go run ./cmd/worker
