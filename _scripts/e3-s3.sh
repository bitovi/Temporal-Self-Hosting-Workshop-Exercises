#!/bin/bash

cd benchmark-workers
go run ./cmd/runner \
  -t ExecuteActivity \
  -c 50 '{"Count":3,"Activity":"Echo","Input":{"Message":"test"}}'