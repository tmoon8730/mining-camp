#!/bin/bash
#
# Simple script to handle automatic server restarts. This helps with memory leaks accumulating too much RAM.
#

# Shut down the server gracefully and backup to S3
/minecraft/nerdhouse/mining-camp/utilities/shutdown.sh

# Wait for a few minutes so that everything clears out. Especially the RAM which can accumulate.
echo "Waiting for 5 minutes"
sleep 5m

# Start up the server
/minecraft/nerdhouse/mining-camp/utilities/bootstrap.sh