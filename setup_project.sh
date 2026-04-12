#!/usr/bin/env bash

# 1. Trap early (so it works anytime)
trap '
echo "Interrupted! Cleaning up..."

if [ -d "attendance_tracker_${input}" ]; then
	tar -czf attendance_tracker_${input}_archive.tar.gz attendance_tracker_${input}
	rm -rf attendance_tracker_${input}
else 
	echo "No project folder to archive"
fi 

exit
' SIGINT

# 2. Input
read -p "Enter an input: " input

# 3. Directory architecture

mkdir attendance_tracker_${input}

cd attendance_tracker_${input}

mkdir Helpers reports


# 4. Copy files

cp ../project/attendance_checker.py .
cp ../project/assets.csv Helpers/
cp ../project/config.json Helpers/
cp ../project/reports.log reports/


# 5. Dynamic Configuration

read -p "Do you want to update thresholds? (yes/no): " answer

if [ "$answer" = "yes" ]; then
	read -p "Enter your new warning value: " warning_value
	read -p "Enter your new failure value: " failure_value

	sed -i "s/75/${warning_value}/" Helpers/config.json
	sed -i "s/50/${failure_value}/" Helpers/config.json
fi


# 6. Environment Validation

echo "Checking Python installation..."

if python3 --version >/dev/null 2>&1; then 
	echo "Python3 is installed successfully."
else 
	echo "Warning: Python3 is NOT installed."
fi
