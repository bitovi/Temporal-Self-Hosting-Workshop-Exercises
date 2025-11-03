#!/bin/bash

export TEMPORAL_GRPC_ENDPOINT=127.0.0.1:8233
export TEMPORAL_NAMESPACE=default
export TEMPORAL_TASK_QUEUE=benchmark
export TEMPORAL_WORKFLOW_TASK_POLLERS=16
export TEMPORAL_ACTIVITY_TASK_POLLERS=8

cd benchmark-workers
go run ./cmd/worker