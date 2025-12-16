#!/bin/bash
# SVTPlay-dl GUI Startup Script

cd /home/user/SVTPlay-dl-GUI

# Kill any existing instance
pkill -f "python.*app.py"

# Wait a moment
sleep 2

# Start the server
nohup /home/user/SVTPlay-dl-GUI/venv/bin/python app.py > /home/user/SVTPlay-dl-GUI/server.log 2>&1 &

echo "SVTPlay-dl GUI started! Access it at http://localhost:5000"
echo "Log file: /home/user/SVTPlay-dl-GUI/server.log"
