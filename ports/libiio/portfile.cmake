vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO analogdevicesinc/libiio
    REF b36b19db32a2db5f9b4c48eba0c8f9b1e7231446
    SHA512 a3698596e58b13856915c12e0883451f41d81b4d4020a140148bbd56e5150a20ea1785f1a6db865da5235c2274631466d442945f04bf56160cd7e38963ce0cbe
    HEAD_REF master
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        network-backend WITH_NETWORK_BACKEND
        usb-backend WITH_USB_BACKEND
        local-backend WITH_LOCAL_BACKEND
        serial-backend WITH_SERIAL_BACKEND
        xml-backend WITH_XML_BACKEND
        zstd WITH_ZSTD
        ipv6 ENABLE_IPV6
)

#if(NOT WITH_NETWORK_BACKEND AND NOT WITH_USB_BACKEND AND NOT WITH_LOCAL_BACKEND AND NOT WITH_SERIAL_BACKEND)
#    message(FATAL_ERROR "At least one backend must be enabled")
#endif()

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
        -DSKIP_INSTALL_ALL=OFF
)

vcpkg_cmake_install()
vcpkg_copy_pdbs()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING.txt" "${SOURCE_PATH}/COPYING_GPL.txt")
