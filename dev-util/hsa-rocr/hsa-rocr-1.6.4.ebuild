# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
EAPI=6

inherit cmake-utils

DESCRIPTION="ROCm Platform Runtime: ROCr a HPC market enhanced HSA based runtime"
HOMEPAGE="https://github.com/RadeonOpenCompute/ROCR-Runtime"
EXT_ROCR_NAME="hsa-ext-rocr-dev_1.1.7-12-gf0de514_amd64.deb"
SRC_URI="
    https://github.com/RadeonOpenCompute/ROCR-Runtime/archive/roc-${PV}.tar.gz -> ${P}.tar.gz
    ext-finalizer? ( http://repo.radeon.com/rocm/apt/debian/pool/main/h/hsa-ext-rocr-dev/${EXT_ROCR_NAME} )
"

LICENSE="NCSA"
SLOT="0"
KEYWORDS="~amd64"
S="${WORKDIR}/${P}/src"

IUSE="+ext-finalizer"

DEPEND="dev-util/hsakmt-roct"
RDEPEND="${DEPEND}"

src_unpack() {
    unpack ${A}
    mv ROCR-Runtime-roc-${PV} ${P}
    if use ext-finalizer; then
        tar xf data.tar.gz
    fi
    cd "${S}"
    epatch "${FILESDIR}/install.patch"
}

src_install() {
    cmake-utils_src_install

    if use ext-finalizer; then
        cd ${WORKDIR}/opt/rocm/hsa/bin
        into /usr || die
        dobin amdhsacod || die
        dobin amdhsafin || die
        cd ${WORKDIR}/opt/rocm/hsa/lib
        cp -a libhsa-ext-finalize64.so* ${ED}/usr/lib64 || die
    fi
}
