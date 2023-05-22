#!/bin/bash

# Define the arguments and environment variables
arguments=("numpy" "torch_cpu" "torch_gpu" "cupy")
env_variables=("" "SCIPY_STRICT_ARR_API=1")

# Run the command 10 times for each combination
for env_var in "${env_variables[@]}"
do
    for arg in "${arguments[@]}"
    do
        # Construct the command
        command="PYTHONPATH=~/Documents/scipy $env_var python bench.py $arg"

        # Print the command
        echo "Running: $command"

        # Execute the command 10 times
        for ((i=1; i<=10; i++))
        do
            eval $command
        done

        echo ""
    done
done
