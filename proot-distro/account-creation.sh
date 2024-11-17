#!/bin/bash

read -p "Please enter your username: " username

# Add an extra space to the username
username="$username"

useradd -m -G wheel $username

passwd $username

echo "account created"

exit 0