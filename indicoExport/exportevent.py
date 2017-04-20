#!/bin/env python

import os
import sys

url = sys.argv[1]
indicoID = url.split("/")[-2]
os.chdir(os.path.dirname(__file__))
os.system("python caleventexport.py %s"%indicoID)
os.system("open event.ics")
#python filter.py > filter_result.txt
#open addIndicoExport.app
