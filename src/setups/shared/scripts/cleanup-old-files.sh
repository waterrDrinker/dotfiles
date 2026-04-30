#!/bin/bash
find ~/downloads ~/Downloads ~/tmp -maxdepth 1 -mtime +45 -type f -delete
