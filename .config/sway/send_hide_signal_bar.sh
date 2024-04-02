#!/bin/bash

# Send SIGUSR1 signal to rusticbar process
kill -SIGUSR1 $(pgrep rusticbar)

