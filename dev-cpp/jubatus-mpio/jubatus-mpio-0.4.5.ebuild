# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DESCRIPTION="mpio for Jubatus"
HOMEPAGE="http://jubat.us/"
SRC_URI="http://download.jubat.us/files/source/jubatus_mpio/jubatus_mpio-${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="~amd64"
DEPEND=">=sys-devel/gcc-4.1"

src_unpack() {
    unpack ${A}
    mv "${WORKDIR}/${P/-/_}" "${WORKDIR}/${P}"
}
