# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
EAPI=6

inherit cmake-utils git-r3

DESCRIPTION="Radeon Open Compute Thunk Interface"
HOMEPAGE="https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface"
EGIT_REPO_URI="https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface.git"
EGIT_COMMIT="238782c960624adde80e6c2d3766ed816849f0e1"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_prepare() {
    epatch "${FILESDIR}/install-hack.patch"
    cmake-utils_src_prepare
}
