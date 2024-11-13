#!/bin/bash

# Set time limits for each level
TIME_LIMIT_LVL1=20
TIME_LIMIT_LVL2=15
TIME_LIMIT_LVL3=10

# Function to display a prompt with a subshell for exploration
prompt_with_subshell() {
    local prompt="$1"
    local time_limit="$2"
    local correct_answer="$3"
    
    echo -e "$prompt"
    echo "Type 'explore' to open a subshell for help, or answer directly within $time_limit seconds."

    # Start a background timer and capture input
    read -t "$time_limit" -p "> " answer

    # Allow the user to explore in a subshell
    if [[ "$answer" == "explore" ]]; then
        echo "Entering subshell. Type 'exit' to return and enter your answer."
        bash # Open a subshell
        echo "You're back! Now enter your answer."
        read -t "$time_limit" -p "> " answer # Prompt again after exiting subshell
    fi

    # Validate the answer
    if [[ "$answer" != "$correct_answer" ]]; then
        echo "Wrong answer! The bomb exploded!"
        exit 1
    fi
}

# Level 1: Basic Commands
level_1() {
    echo -e "\n=== Level 1 ==="
    echo "Goal: Use basic commands to defuse the bomb!"

    prompt_with_subshell "1. Find out the current working directory." "$TIME_LIMIT_LVL1" "$(pwd)"
    
    prompt_with_subshell "2. Display the contents of this directory." "$TIME_LIMIT_LVL1" "$(ls)"

    echo "Level 1 cleared! Moving to Level 2..."
}

# Level 2: Intermediate Commands
level_2() {
    echo -e "\n=== Level 2 ==="
    echo "Goal: Use intermediate commands to continue defusing the bomb!"

    prompt_with_subshell "1. Find the number of lines in this script." "$TIME_LIMIT_LVL2" "$(wc -l < "$0")"
    
    prompt_with_subshell "2. Display the last 5 lines of this script." "$TIME_LIMIT_LVL2" "$(tail -n 5 "$0")"

    echo "Level 2 cleared! Moving to Level 3..."
}

# Level 3: Advanced Commands
level_3() {
    echo -e "\n=== Level 3 ==="
    echo "Goal: Use advanced commands to finish defusing the bomb!"

    prompt_with_subshell "1. Find all lines containing the word 'bomb' in this script." "$TIME_LIMIT_LVL3" "$(grep 'bomb' "$0")"
    
    prompt_with_subshell "2. Replace all instances of 'defuse' with 'disable' in this script and display the result." "$TIME_LIMIT_LVL3" "$(sed 's/defuse/disable/g' "$0")"

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

