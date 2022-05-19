#!/usr/bin/env csh
#
# Configure a conda environment for GWOLLUM
#

# backup the environment's current setting
if ($?GWOLLUM_DATA) then
	setenv CONDA_BACKUP_GWOLLUM_DATA "${GWOLLUM_DATA}"
endif
if ($?GWOLLUM_PIX) then
	setenv CONDA_BACKUP_GWOLLUM_PIX "${GWOLLUM_PIX}"
endif

# set the variable
setenv GWOLLUM_DATA "${CONDA_PREFIX}/share/GWOLLUM/data"
setenv GWOLLUM_PIX "${CONDA_PREFIX}/share/GWOLLUM/images"
