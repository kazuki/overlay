# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

DESCRIPTION="mpio for Jubatus"
HOMEPAGE="http://jubat.us/"
SRC_URI="https://github.com/jubatus/jubatus-msgpack-rpc/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-lang/ruby"

src_configure() {
    cd cpp && ./bootstrap && econf || die "configure failed"
}

src_compile() {
    cd cpp && emake || die "make failed"
}

src_install() {
    cd cpp && emake DESTDIR="${D}" install || die "install failed"
}
