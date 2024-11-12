#!/bin/bash

# Set time limits for each level
TIME_LIMIT_LVL1=20
TIME_LIMIT_LVL2=15
TIME_LIMIT_LVL3=10

# Function to display a timed prompt
prompt_with_timer() {
    local prompt="$1"
    local time_limit="$2"
    
    echo -e "$prompt"
    echo "You have $time_limit seconds to answer!"
    
    # Start a background timer and capture input
    read -t "$time_limit" -p "> " answer
}

# Level 1: Basic Commands
level_1() {
    echo -e "\n=== Level 1 ==="
    echo "Goal: Use basic commands to defuse the bomb!"

    prompt_with_timer "1. Find out the current working directory (hint: command shows directory path)." "$TIME_LIMIT_LVL1"
    if [[ "$answer" != "$(pwd)" ]]; then
        echo "Wrong answer! The bomb exploded!"
        exit 1
    fi
    
    prompt_with_timer "2. Display the contents of this directory (hint: list command)." "$TIME_LIMIT_LVL1"
    if [[ "$answer" != "$(ls)" ]]; then
        echo "Wrong answer! The bomb exploded!"
        exit 1
    fi

    echo "Level 1 cleared! Moving to Level 2..."
}

# Level 2: Intermediate Commands
level_2() {
    echo -e "\n=== Level 2 ==="
    echo "Goal: Use intermediate commands to continue defusing the bomb!"

    prompt_with_timer "1. Find the number of lines in this script (hint: use a command to count lines)." "$TIME_LIMIT_LVL2"
    if [[ "$answer" != "$(wc -l < "$0")" ]]; then
        echo "Wrong answer! The bomb exploded!"
        exit 1
    fi
    
    prompt_with_timer "2. Display the last 5 lines of this script (hint: command shows end of a file)." "$TIME_LIMIT_LVL2"
    if [[ "$answer" != "$(tail -n 5 "$0")" ]]; then
        echo "Wrong answer! The bomb exploded!"
        exit 1
    fi

    echo "Level 2 cleared! Moving to Level 3..."
}

# Level 3: Advanced Commands
level_3() {
    echo -e "\n=== Level 3 ==="
    echo "Goal: Use advanced commands to finish defusing the bomb!"

    prompt_with_timer "1. Find all lines containing the word 'bomb' in this script (hint: use a search command)." "$TIME_LIMIT_LVL3"
    if [[ "$answer" != "$(grep 'bomb' "$0")" ]]; then
        echo "Wrong answer! The bomb exploded!"
        exit 1
    fi
    
    prompt_with_timer "2. Replace all instances of 'defuse' with 'disable' in this script and display the result (hint: use a stream editor)." "$TIME_LIMIT_LVL3"
    if [[ "$answer" != "$(sed 's/defuse/disable/g' "$0")" ]]; then
        echo "Wrong answer! The bomb exploded!"
        exit 1
    fi

    echo "Congratulations! You've successfully defused the bomb!"
}

# Game Start
echo -e "\nWelcome to 'Defuse the Bomb'!"
echo "Solve each level's challenges within the time limit to prevent the bomb from exploding."
echo "Good luck!"

# Run each level
level_1
level_2
level_3


