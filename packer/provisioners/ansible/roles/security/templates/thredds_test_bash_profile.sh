# Setup maven and add to system bin path.
export M2_HOME="{{ install_dir }}/mvn"
export M2="${M2_HOME}/bin"
export MAVEN_OPTS="-Xms256m -Xmx512m"
DEFAULT_PATH=${M2}:${PATH}

# Add native library tools built by ansible to path.
ANSIBLE_BUILT_BIN="{{ install_dir }}/bin"
export DEFAULT_PATH=${DEFAULT_PATH}:${ANSIBLE_BUILT_BIN}

function activate-conda() {
    CONDA_PROFILE="{{ install_dir }}/miniconda3/etc/profile.d/conda.sh"
    if [[ $(which conda | wc -c) -eq 0 ]]
    then
        source ${CONDA_PROFILE}
    fi
}

function update-path() {
    if ! [ -z "${JAVA_HOME}" ]
    then
        # Use java located in bin directory of JAVA_HOME, if set.
        export PATH="${JAVA_HOME}/bin:${DEFAULT_PATH}"
    else
        # Use java 11 by default.
        export PATH="{{ install_dir }}/adoptium{{ default_java_version }}/bin:${DEFAULT_PATH}"
    fi
}

function select-java() {
    MAYBE_JAVA_HOME="{{ install_dir }}/adoptium$1"
    if [ -d ${MAYBE_JAVA_HOME} ]
    then
        export JAVA_HOME=${MAYBE_JAVA_HOME}
        update-path
    else
        echo "Error: Directory ${MAYBE_JAVA_HOME} does not exists."
        if ! [ -z "${JAVA_HOME}" ]
        then
            echo "Will continue to use JAVA_HOME=${JAVA_HOME}"
        else
            echo "JAVA_HOME will remain unset."
        fi
    fi
}

# Update the path to pickup additions from DEFAULT_PATH variable.
update-path
