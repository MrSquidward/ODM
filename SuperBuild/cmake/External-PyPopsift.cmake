set(_SB_BINARY_DIR "${SB_BINARY_DIR}/pypopsift")

# Pypopsift
if(SB_ENABLE_CUDA)
    ExternalProject_Add(pypopsift
        DEPENDS           opensfm
        PREFIX            ${_SB_BINARY_DIR}
        TMP_DIR           ${_SB_BINARY_DIR}/tmp
        STAMP_DIR         ${_SB_BINARY_DIR}/stamp
        #--Download step--------------
        DOWNLOAD_DIR      ${SB_DOWNLOAD_DIR}
        GIT_REPOSITORY    https://github.com/MrSquidward/pypopsift
        GIT_TAG           20794195b8adab2fa1dc21a34b522d0f8307c78f
        #--Update/Patch step----------
        UPDATE_COMMAND    ""
        #--Configure step-------------
        SOURCE_DIR        ${SB_SOURCE_DIR}/pypopsift
        CMAKE_ARGS
            -DOUTPUT_DIR=${SB_INSTALL_DIR}/bin/opensfm/opensfm
            -DCMAKE_INSTALL_PREFIX=${SB_INSTALL_DIR}
            ${CONDA_CMAKE_ARGS}
            ${ARM64_CMAKE_ARGS}
        #--Build step-----------------
        BINARY_DIR        ${_SB_BINARY_DIR}
        #--Install step---------------
        INSTALL_DIR       ${SB_INSTALL_DIR}
        #--Output logging-------------
        LOG_DOWNLOAD      OFF
        LOG_CONFIGURE     OFF
        LOG_BUILD         OFF
        )
else()
    message(STATUS "Skipping pypopsift: ODM_ENABLE_CUDA not set (use the pixi gpu env, or set ODM_ENABLE_CUDA=ON)")
endif()
