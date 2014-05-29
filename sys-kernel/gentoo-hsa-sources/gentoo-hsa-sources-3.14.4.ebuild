# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-kernel/gentoo-sources/gentoo-sources-3.14.1.ebuild,v 1.1 2014/04/15 15:01:50 mpagano Exp $

EAPI="5"
ETYPE="sources"
K_WANT_GENPATCHES="base extras experimental"
K_GENPATCHES_VER="5"
K_DEBLOB_AVAILABLE="1"
inherit kernel-2
detect_version
EXTRAVERSION=${EXTRAVERSION/gentoo/gentoo-hsa}
KV_FULL=${KV_FULL/gentoo/gentoo-hsa}
S=${WORKDIR}/linux-${KV_FULL}
KV=${KV_FULL}
detect_arch

KEYWORDS="~amd64"
HOMEPAGE="http://dev.gentoo.org/~mpagano/genpatches"
IUSE="deblob experimental"

DESCRIPTION="Full sources including the Gentoo patchset for the ${KV_MAJOR}.${KV_MINOR} kernel tree and AMD HSA KFD driver patchset"
SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI}"

src_prepare() {
    epatch "${FILESDIR}/hsa-${PV}.patch"
}

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "For more info on this patchset, and how to report problems, see:"
	einfo "${HOMEPAGE}"
}

pkg_postrm() {
	kernel-2_pkg_postrm
}