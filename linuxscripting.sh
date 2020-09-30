#!/bin/bash 
# This script will be created a new user on the local system.
# Make sure the script is executed with the Superuser Privileges.
if [[ ${UID} -ne 0 ]]; then 
echo 'LOGIN AS ROOT USER.'
exit 1
fi 

# Get the LOGIN_NAME.
read -p 'Enter the username for the account: ' USER_NAME

# Get the full login_name.
read -p 'Enter the full_name of the user's account: 'COMMENT

# Password.
read -p 'Enter the password: 'PASSWORD

# Create the account_name.
adduser -c "${COMMENT}" -m ${USER_NAME}

# Checking if the command has succeeded.
if [[ "${?}" -ne 0 ]]; then 
echo 'The account hasn't been created'
exit 1
fi

# Created the password for the user.
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

if [[ "${?}" -ne 0 ]]; then 
echo 'The password hasn't been created'
exit 1
fi

# Force changing password at the first login.
passwd -e ${USER_NAME}

if [[ "${?}" -eq  0 ]]; then
echo 'The command has executed'
exit 0 
else 
echo "The command hasn't been executed'
exit 1
fi 


