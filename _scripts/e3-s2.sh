#!/bin/bash

cd benchmark-workers
go run ./cmd/runner \
  -t ExecuteActivity \
  -c 20 '{"Count":3,"Activity":"Echo","Input":{"Message":"test"}}'