#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import sys, gnupg, json
from base64 import b64decode
from pprint import pprint
import smtplib, ssl

# init gpg - assuming that you have the priv key imported on your machine
gpg = gnupg.GPG()
"""
#in case need to import the private key from somewhere
priv_key_file = "myprivkey.key"
priv_key = open(priv_key_file, "rb").read()
r = gpg.import_keys(priv_key)
"""
#pprint(vars(r))

# get inputs with argv
id_key = sys.argv[1]
enc_secret = b64decode(sys.argv[2] + '=' * (-len(sys.argv[2]) % 4))
username = sys.argv[3]
enc_password = b64decode(sys.argv[4] + '=' * (-len(sys.argv[4]) % 4))
secret = gpg.decrypt(enc_secret).data.decode('utf-8')
password = gpg.decrypt(enc_password).data.decode('utf-8')

output = {
    "id_key": id_key,
    "secret_key": secret,
    "username": username,
    "password": password
    }
print((json.dumps(output, indent=4)))

