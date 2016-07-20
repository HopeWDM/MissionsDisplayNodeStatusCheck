#!/bin/bash
chromium-browser --kiosk --app=http://missionsdisplay.hopewdm.org/frontend/2 --display=:0.0 &
/opt/scripts/run-status-stuff.sh
