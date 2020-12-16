#!/bin/bash

gunicorn mysite.wsgi -b unix:/tmp/gunicorn.sock -D
nginx