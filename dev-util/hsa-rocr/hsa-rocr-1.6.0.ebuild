# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
EAPI=6

inherit cmake-utils

DESCRIPTION="ROCm Platform Runtime: ROCr a HPC market enhanced HSA based runtime"
HOMEPAGE="https://github.com/RadeonOpenCompute/ROCR-Runtime"
SRC_URI="https://github.com/RadeonOpenCompute/ROCR-Runtime/archive/roc-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="NCSA"
SLOT="0"
KEYWORDS="~amd64"
S="${WORKDIR}/${P}/src"

DEPEND="~dev-util/hsakmt-roct-${PV}"
RDEPEND="${DEPEND}"

src_unpack() {
    unpack ${A}
    mv ROCR-Runtime-roc-${PV} ${P}
}

src_install() {
    cmake-utils_src_install

    dodir /etc/ld.so.conf.d/
    echo /usr/hsa/lib >> ${ED}/etc/ld.so.conf.d/10${PN}.conf || die
}
