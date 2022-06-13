#!/usr/bin/env bash
#
# De-configure a conda environment for GWOLLUM
#

if [ ! -z "${CONDA_BACKUP_GWOLLUM_DATA}" ]; then
	export GWOLLUM_DATA="${CONDA_BACKUP_GWOLLUM_DATA}"
	unset CONDA_BACKUP_GWOLLUM_DATA
else
	unset GWOLLUM_DATA
fi

if [ ! -z "${CONDA_BACKUP_GWOLLUM_PIX}" ]; then
	export GWOLLUM_PIX="${CONDA_BACKUP_GWOLLUM_DATA}"
	unset CONDA_BACKUP_GWOLLUM_PIX
else
	unset GWOLLUM_PIX
fi
