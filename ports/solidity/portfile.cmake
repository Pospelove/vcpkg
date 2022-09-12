set(commit_hash 9876093f5e02af0d475fba763dcea9b48b82a029)
# a78a2bcf34f729957095587fcead56a7291abfb1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Pospelove/solidity #ethereum/solidity
    REF "${commit_hash}"
    SHA512 90fa29bce4f91ff14c2d3a10144fbd871b39b198026ec80a377ea7333d48961ea080d898f03cffa25de42b60913a55bb9b0f7e3f8ef176471e6d0eb7cfacaabf
    #8dcac184c7c77139ce9940e722cb2859a45a4326f19e0863ad8bcecb66664c627f48c1a24327cbdfeb76d01624dd0ef23228ae83c4e2e1ee6b362bc5f59d7320
    HEAD_REF master
)

file(WRITE "${SOURCE_PATH}/commit_hash.txt" "${commit_hash}")

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    #WINDOWS_USE_MSBUILD
)

vcpkg_cmake_install()