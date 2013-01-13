# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

DESCRIPTION="mpio for Jubatus"
HOMEPAGE="http://jubat.us/"
SRC_URI="https://github.com/jubatus/jubatus-mpio/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=sys-devel/gcc-4.1
        >=sys-libs/glibc-2.8
        dev-lang/ruby"

src_configure() {
    ./bootstrap
    econf || die "configure failed"
}

src_install() {
    emake DESTDIR="${D}" install || die "install failed"
}
