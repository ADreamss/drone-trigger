#!/bin/bash

export DRONE_SERVER=${PLUGIN_SERVER}
[ -n "$DOWNSTREAM_TOKEN" ] && export PLUGIN_TOKEN=${DOWNSTREAM_TOKEN}
export DRONE_TOKEN=${PLUGIN_TOKEN}

if [[ $# == '0' ]]; then
	nBuild=$(drone build last --branch ${PLUGIN_BRANCH} --format {{.Number}} ${PLUGIN_REPOSITORY})
	status=$(drone build last --branch ${PLUGIN_BRANCH} --format {{.Status}} ${PLUGIN_REPOSITORY})
	if [[ ${PLUGIN_FORK} = "true" ]]; then
		echo "New build"
		drone build start --fork ${PLUGIN_REPOSITORY} $nBuild
	else
		echo "Re-build" 
		drone build start ${PLUGIN_REPOSITORY} $nBuild	
	fi
else
  echo "Executing $@"
  $@
fi
