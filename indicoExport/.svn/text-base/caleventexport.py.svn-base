#!/bin/env python

# script to download from indico the ics files you want


# ==================================================
# code starts here
# ==================================================

import hashlib
import hmac
import urllib
import time
import os
import sys

def build_indico_request(path, params, api_key=None, secret_key=None, only_public=False, persistent=False):
    items = params.items() if hasattr(params, 'items') else list(params)
    if api_key:
        items.append(('apikey', api_key))
    if only_public:
        items.append(('onlypublic', 'yes'))
    if secret_key:
        if not persistent:
            items.append(('timestamp', str(int(time.time()))))
        items = sorted(items, key=lambda x: x[0].lower())
        url = '%s?%s' % (path, urllib.urlencode(items))
        signature = hmac.new(secret_key, url, hashlib.sha1).hexdigest()
        items.append(('signature', signature))
    if not items:
        return path
    return '%s?%s' % (path, urllib.urlencode(items))

if __name__ == '__main__':
    API_KEY = '35129c98-2ccc-4412-a331-d6a17d7de85e' # From the https://indico.cern.ch/user/api/, copy the content in the field "Token"
    SECRET_KEY = 'ffd7251b-7ff3-493c-953a-d389bb7ba0a6' # From the https://indico.cern.ch/user/api/, copy the content in the field "Secret"
    PATH = '/export/event/%s.ics'%(sys.argv[1])
    PARAMS = {
    #    'limit': 100,
    #    'detail': 'sessions',
    #    'detail': 'sessions',
    #    'detail': 'events',
    }
    url = 'https://indico.cern.ch%s'%build_indico_request(PATH, PARAMS, API_KEY, SECRET_KEY)
    command = "curl -s -o event.ics -O '%s' "%(url)
    print command
    os.system(command)

#eof
