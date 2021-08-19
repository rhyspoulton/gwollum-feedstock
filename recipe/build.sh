#!/bin/bash

mkdir -p _build
pushd _build

# configure
cmake \
	${SRC_DIR} \
	${CMAKE_ARGS} \
	-DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo \
	-DCMAKE_DISABLE_FIND_PACKAGE_Doxygen:BOOL=true \
	-DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
;

# build
cmake --build . --parallel ${CPU_COUNT}

# install
cmake --build . --parallel ${CPU_COUNT} --target install

# -- build activate script

ACTIVATE_SH="${PREFIX}/etc/conda/activate.d/activate_${PKG_NAME}.sh"
mkdir -p $(dirname ${ACTIVATE_SH})
cat > ${ACTIVATE_SH} << EOF
#!/bin/bash
export CONDA_BACKUP_GWOLLUM_DATA="\${GWOLLUM_DATA:-empty}"
export GWOLLUM_DATA="/opt/anaconda1anaconda2anaconda3/share/data"
EOF
# deactivate.sh
DEACTIVATE_SH="${PREFIX}/etc/conda/deactivate.d/deactivate_${PKG_NAME}.sh"
mkdir -p $(dirname ${DEACTIVATE_SH})
cat > ${DEACTIVATE_SH} << EOF
#!/bin/bash
if [ "\${CONDA_BACKUP_GWOLLUM_DATA}" = "empty" ]; then
	unset GWOLLUM_DATA
else
	export GWOLLUM_DATA="\${CONDA_BACKUP_GWOLLUM_DATA}"
fi
unset CONDA_BACKUP_GWOLLUM_DATA
EOF
