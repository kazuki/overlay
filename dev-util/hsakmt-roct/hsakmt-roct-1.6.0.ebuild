# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
EAPI=6

inherit cmake-utils

DESCRIPTION="Radeon Open Compute Thunk Interface"
HOMEPAGE="https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface"
SRC_URI="https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface/archive/roc-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_unpack() {
    unpack ${A}
    mv ROCT-Thunk-Interface-roc-${PV} ${P}
}

src_install() {
    cmake-utils_src_install

    dodir /etc/ld.so.conf.d/
    echo /usr/libhsakmt/lib >> ${ED}/etc/ld.so.conf.d/10${PN}.conf || die
}
