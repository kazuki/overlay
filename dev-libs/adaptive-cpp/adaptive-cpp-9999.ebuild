EAPI=8
inherit cmake llvm prefix

LLVM_MAX_SLOT=17

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/AdaptiveCpp/AdaptiveCpp.git"
else
	SRC_URI="https://github.com/AdaptiveCpp/AdaptiveCpp/archive/refs/tags/v${PV}.tar.gz"
fi

DESCRIPTION="AdaptiveCpp - a SYCL implementation for CPUs and GPUs"
HOMEPAGE="https://github.com/AdaptiveCpp/AdaptiveCpp"
LICENSE="BSD-2"
SLOT="0"
CMAKE_BUILD_TYPE=Release
KEYWORDS="~amd64"
RESTRICT="network-sandbox"

BDEPEND="
    sys-devel/clang:${LLVM_MAX_SLOT}
    dev-libs/boost[context]
    dev-util/hip
"

PATCHES=(
    "${FILESDIR}/${PN}-9999-fix-destination-lib.patch"
)

src_configure() {
    local mycmakeargs=(
        -DCMAKE_INSTALL_PREFIX=/usr
        -DCMAKE_INSTALL_LIBDIR=lib64
        -DCLANG_INCLUDE_PATH=$(get_llvm_prefix "${LLVM_MAX_SLOT}")/include/clang
        -DSYCLCC_CONFIG_FILE_GLOBAL_INSTALLATION=true
    )
    cmake_src_configure
}

src_install() {
    cmake_src_install

    mkdir -p "${D}/usr/lib64/hipSYCL/ext"
    mv "${D}/${BUILD_DIR}/src/compiler/llvm-to-backend/temp_image" "${D}/usr/lib64/hipSYCL/ext/llvm-spir" || die
    echo DUMP
    find "${D}/lib64/hipSYCL/ext/llvm-spir"

    rm -rf "${D}/var/tmp"
    rmdir --ignore-fail-on-non-empty "${D}/var"
}