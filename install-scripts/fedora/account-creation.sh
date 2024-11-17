#!/bin/bash

read -p "Please enter your username: " username

# Remove any extra space from the username
username="$username"

# Add the user and assign to the wheel group
useradd -m -G wheel $username

# Set the password for the user
passwd $username

# Insert the username with sudo privileges at line 101, column 0 in /etc/sudoers file
# Create a temporary file
tmpfile=$(mktemp)

# Insert the username with sudo privileges at the desired location
awk -v username="$username" '{
    if (NR == 101) {
        print username " ALL=(ALL) ALL"
    }
    print $0
}' /etc/sudoers > "$tmpfile" && mv "$tmpfile" /etc/sudoers

echo "Account created and username with sudo privileges added to /etc/sudoers."


exit 0
