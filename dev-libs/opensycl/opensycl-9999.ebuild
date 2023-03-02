EAPI=8
inherit cmake

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/OpenSYCL/OpenSYCL.git"
else
	SRC_URI="https://github.com/OpenSYCL/OpenSYCL/archive/refs/tags/v${PV}.tar.gz"
fi

DESCRIPTION="OpenSYCL - a SYCL implementation for CPUs and GPUs"
HOMEPAGE="https://github.com/OpenSYCL/OpenSYCL"
LICENSE="BSD-2"
SLOT="0"
CMAKE_BUILD_TYPE=Release
KEYWORDS="~amd64"

BDEPEND="
    dev-libs/boost[context]
    dev-util/hip
"

PATCHES=(
    "${FILESDIR}/${PN}-9999-fix-destination-lib.patch"
)

src_configure() {
    local version=()
    read -r -a version < <(clang++ --version)
    local major=${version[-1]%%.*}
    local mycmakeargs=(
        -DCMAKE_INSTALL_PREFIX=/usr
        -DCMAKE_INSTALL_LIBDIR=lib64
        -DCLANG_INCLUDE_PATH=/usr/lib/llvm/${major}/include/clang
        -DSYCLCC_CONFIG_FILE_GLOBAL_INSTALLATION=true
    )
    cmake_src_configure
}
