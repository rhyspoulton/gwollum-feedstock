#!/usr/bin/env csh
#
# Deconfigure a conda environment for GWOLLUM
#

if ($?GWOLLUM_DATA) then
	setenv GWOLLUM_DATA "$CONDA_BACKUP_GWOLLUM_DATA"
	unsetenv CONDA_BACKUP_GWOLLUM_DATA
else
	unsetenv GWOLLUM_DATA
endif

if ($?GWOLLUM_PIX) then
	setenv GWOLLUM_PIX "$CONDA_BACKUP_GWOLLUM_DATA"
	unsetenv CONDA_BACKUP_GWOLLUM_PIX
else
	unsetenv GWOLLUM_PIX
endif
