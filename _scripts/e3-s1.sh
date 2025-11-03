#!/bin/bash

cd benchmark-workers
go run ./cmd/runner \
  -t ExecuteActivity \
  -c 10 '{"Count":3,"Activity":"Echo","Input":{"Message":"test"}}'