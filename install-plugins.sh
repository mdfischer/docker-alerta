#!/bin/bash

while read plugin version; do
  echo "Installing '${plugin}' (${version})"
  if [ plugin = 'plugins/slack' ]
  then
    /venv/bin/pip install git+https://github.com/mdfischer/alerta-contrib.git@${version}#subdirectory=${plugin}
  else
    /venv/bin/pip install git+https://github.com/alerta/alerta-contrib.git@${slack_severity_filter}#subdirectory=${plugin}
  fi
done </app/plugins.txt
