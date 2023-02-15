import re

# Define a regular expression pattern to match valid email addresses
email_pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'

# Open the input file for reading
with open('users.txt', 'r') as f:
    # Loop through each line in the file
    for line in f:
        # Split the line into fields based on whitespace
        fields = line.strip().split()
        # If there are not enough fields, skip this user
        if len(fields) < 3:
            continue
        # Get the ID number from the last field, if it exists and is a valid integer
        id_str = fields[-1]
        if not id_str.isdigit():
            continue
        id_num = int(id_str)
        # Check if the ID number is odd or even
        if id_num % 2 == 0:
            id_type = 'even'
        else:
            id_type = 'odd'
        # Get the email address from the second-to-last field, if it exists and is a valid email
        email = fields[-2]
        if not re.match(email_pattern, email):
            continue
        # Print a message for this user
        print(f"The ID {id_num} of the email {email} is {id_type}.")
