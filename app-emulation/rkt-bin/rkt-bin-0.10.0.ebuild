# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5

inherit systemd user

DESCRIPTION="rkt is an App Container runtime for Linux"
HOMEPAGE="https://github.com/coreos/rkt"
SRC_URI="https://github.com/coreos/rkt/releases/download/v${PV}/rkt-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"

DEPEND=""
RDEPEND="sys-apps/systemd"

S="${WORKDIR}/rkt-v${PV}"

pkg_setup() {
    enewgroup rkt
}

src_install() {
	dobin "${S}"/rkt
	dobin "${S}"/stage1-coreos.aci
	dobin "${S}"/stage1-kvm.aci

	systemd_dounit ${FILESDIR}/rkt-gc.service
	systemd_dounit ${FILESDIR}/rkt-gc.timer
	systemd_dounit ${FILESDIR}/rkt-metadata.service
	systemd_dounit ${FILESDIR}/rkt-metadata.socket
}
