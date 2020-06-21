vcpkg_fail_port_install(ON_TARGET "UWP")

vcpkg_check_linkage(ONLY_DYNAMIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO OpenMW/openmw
    REF d529cf4a811cde926b193c1af3de756d742ca795 # 0.46+ (releases are quite rare so would be reasonable to keep newest version)
    SHA512 2feb45d02340ece091cad00d72911d62b977e7693f254a7fe92af3673541ba6b93a28ab774859bfd3063387df0d75b1fb52cf866821b375eacbdd549f8047cd7
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
)

if(SOURCE_PATH MATCHES ".* .*")
    message(FATAL_ERROR "OpenMW doesn't support paths with whitespace")
endif()

vcpkg_install_cmake()

#file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include ${CURRENT_PACKAGES_DIR}/debug/share)

vcpkg_copy_pdbs()

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
