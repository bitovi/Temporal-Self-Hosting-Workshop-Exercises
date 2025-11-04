#!/bin/bash

cd benchmark-workers
go run ./cmd/runner \
  -t DSLWorkflow \
  -c 15 '[{"a":"Echo","i":{"Message":"pre-sleep"}, "r": 3},{"a":"Sleep","i":{"SleepTimeInSeconds":5}, "r": 3},{"a":"Echo","i":{"Message":"post-sleep"}, "r": 3}]'