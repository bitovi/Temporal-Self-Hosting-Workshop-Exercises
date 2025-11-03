#!/bin/bash

go run benchmark-wokrers/cmd/runner \
  -t ExecuteActivity \
  -c 10 '{"Count":3,"Activity":"Echo","Input":{"Message":"test"}}'