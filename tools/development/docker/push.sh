#!/bin/bash

################################################################################################################################################################

# @project        Library/Astrodynamics
# @file           tools/development/docker/push.sh
# @author         Lucas Brémond <lucas@loftorbital.com>
# @license        Apache License 2.0

################################################################################################################################################################

script_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "${script_directory}/../../.env"

docker push "${image_name}:${image_version}"

docker push "${image_name}:latest"

################################################################################################################################################################