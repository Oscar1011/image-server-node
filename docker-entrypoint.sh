#!/bin/bash

if [ -s /data/config/config.js ]; then
  echo -e "检测到自定义配置文件，同步配置文件\n"
  cp /data/config/config.js /app/config/config.js
fi
node app.js
