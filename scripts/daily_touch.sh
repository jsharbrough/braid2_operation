# HOW TO PREVENT FILE DELETION ON SCRATCH WITH A DAILY TOUCH COMMAND AT MIDNIGHT

# Start by opening your crontab file:

crontab -e

# Add the following line of code (edited to your specific name directory within the scratch folder):

0 0 * * * /usr/bin/find /path/to/your/directory -type f -exec /usr/bin/touch \{\} +

# To write out in Vim, press Esc to leave the coding environment, then type:

# :wq

# Then press enter, and you are done! Every individual file within your 
# name directory on scratch will be touched at midnight, so scratch will
# not delete it during wipes.
