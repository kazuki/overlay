# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="3"

inherit git-2 eutils

EGIT_REPO_URI="git://github.com/collie/accord.git"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RDEPEND="sys-cluster/corosync"
DEPEND="${RDEPENT}"

src_unpack() {
    git-2_src_unpack

    cd "${S}"
    epatch "${FILESDIR}/coroutine-longjmp.patch"
}

src_install() {
    cd "${S}"
    PREFIX="${D}/usr" einstall || die "einstall failed"

    # manual replace pkg-config path
    PKGCONFIG_FILE="${D}/usr/lib/pkgconfig/libacrd.pc"
    sed -i "s/${D////\\/}/${DESTDIR////\\/}/" ${PKGCONFIG_FILE}
}
