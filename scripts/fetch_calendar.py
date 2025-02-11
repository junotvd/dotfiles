#!/usr/bin/env python3

import os
import requests
import ics
from datetime import datetime, timedelta
import pytz
from agenda import ics_url

# ics_url = "https://outlook.office365.com/owa/calendar/6313bbb4a7f849428d5b2eb6d5022e07@student.kuleuven.be/7a0173bb4a84485ebaa1f0e0b38bc6182479167579211136462/calendar.ics"
ics_url = ics_url()

response = requests.get(ics_url)
calendar = ics.Calendar(response.text)
Brussels = pytz.timezone("Europe/Brussels")

if 'TZ' in os.environ:
        TZ = pytz.timezone(os.environ['TZ'])
else:
    # print("Warning: TZ environ variable not set")
    TZ = Brussels


now = datetime.now(tz=TZ)

next_event = None
for event in calendar.events:
    event_time = event.begin.datetime.replace(tzinfo=TZ)
    if event.begin.datetime > now:
        print(f"{event.name} at {event.begin.humanize()}")
        next_event = event
        break

if next_event:
    print(f"{next_event.begin.strftime("%H:%S")}: {next_event.name}")
else:
    print("No upcoming events")
