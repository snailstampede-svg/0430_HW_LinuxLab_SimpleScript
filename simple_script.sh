# 0430 Simple Script Assignment

#!/bin/bash

# create a directrory named "my_files" in the current working directory.
mkdir -p my_files

#show the current working directory to confirm we are in the correct location.
pwd

# Create basic text files with generic content in the current directory.
touch ./my_files/poem.txt ./my_files/story.txt

# #list the created files to confirm they exist.
# ls -lah poem.txt story.txt

# Add some content to the created files.
echo "Roses are red, violets are blue." > ./my_files/poem.txt
echo "Once upon a time, there was a brave knight." > ./my_files/story.txt  
# Display the contents of the created files.



# Define the source directory, backup directory and current user.
SOURCE_DIR="./my_files"
BACKUP_DIR="./backup_files"
USERNAME=$(whoami)


#print banner message indicating the start of the backup process for the current user.
echo "######### Backing up files for user: $USERNAME #########"
SLEEP_TIME=3
echo "#####  Please wait while we prepare the backup..."
sleep $SLEEP_TIME


DATE=$(date +"%Y-%m-%d_%H-%M-%S")


# Create the backup directory if it doesn't exist.
mkdir -p "$BACKUP_DIR"
# Copy the contents of the source directory to the backup directory.
cp -r "$SOURCE_DIR"/* "$BACKUP_DIR"
WAIT_TIME=5
echo "Waiting for $WAIT_TIME seconds before confirming backup..."
sleep $WAIT_TIME


  

# Confirm that the backup was successful.
echo "######### Backup process completed for user: $USERNAME on $DATE #########"


# show list of files in the backup directory to confirm the backup was successful. 
echo "###### Files in the backup directory:"
ls -lah "$BACKUP_DIR"

# Display the contents of the created files.
echo "###### Contents of poem.txt:"$'\n'
cat ./my_files/poem.txt

echo "###### Contents of story.txt:"$'\n'
cat ./my_files/story.txt

# Display the character count of the created files.
echo "###### Character count of poem.txt:"
wc -m ./my_files/poem.txt

echo "###### Character count of story.txt:"
wc -m ./my_files/story.txt 

# create a file with character count of the created files and save it in the backup directory.
echo "Character count of poem.txt: $(wc -m < ./my_files/poem.txt)" > "$BACKUP_DIR/character_count.txt"
echo "Character count of story.txt: $(wc -m < ./my_files/story.txt)" >> "$BACKUP_DIR/character_count.txt"
echo "Character count saved to $BACKUP_DIR/character_count.txt"


