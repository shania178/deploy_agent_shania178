# Project Factory - Attendance Tracker

## Project Description
This project is a shell script that automatically creates a workspace for an attendance tracker system.  
It sets up folders, copies required files, updates configuration values, and handles interrupts safely.

---

## 1. Directory Setup
The script creates a folder based on user input called:
attendance_tracker_{input}

Inside it, two folders are created:
- Helpers
- reports

---

## 2. File Setup
The script copies the provided files into the correct places:

- attendance_checker.py → main folder
- assets.csv → Helpers folder
- config.json → Helpers folder
- reports.log → reports folder

---

## 3. Dynamic Configuration
The script asks the user if they want to update attendance thresholds.

If yes, it uses `sed` to update values inside:
Helpers/config.json

---

## 4. Process Management (Ctrl + C)
If the user presses Ctrl + C during execution, the script:
- creates a backup archive of the current project
- deletes the incomplete folder to keep things clean

---

## 5. Environment Check
The script checks if Python3 is installed on the system and prints a message depending on the result.

---

## How to Run

## How to Run

```bash
chmod +x setup_project.sh
./setup_project.sh

---

## How to Test Trap
Run the script and press Ctrl + C while it is running to see the cleanup and archive process work.
