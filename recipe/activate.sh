#!/usr/bin/env bash
#
# Configure a conda environment for GWOLLUM
#

# preserve the user's existing settings
if [ ! -z "${GWOLLUM_DATA+x}" ]; then
	export CONDA_BACKUP_GWOLLUM_DATA="${GWOLLUM_DATA}"
fi
if [ ! -z "${GWOLLUM_PIX+x}" ]; then
	export CONDA_BACKUP_GWOLLUM_PIX="${GWOLLUM_PIX}"
fi

# set the variables
export GWOLLUM_DATA="${CONDA_PREFIX}/share/GWOLLUM/data"
export GWOLLUM_PIX="${CONDA_PREFIX}/share/GWOLLUM/images"
