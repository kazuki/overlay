# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5

inherit systemd user bash-completion-r1

DESCRIPTION="rkt is an App Container runtime for Linux"
HOMEPAGE="https://github.com/coreos/rkt"
SRC_URI="https://github.com/coreos/rkt/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
    >=dev-lang/go-1.4.0
    sys-fs/squashfs-tools
    app-arch/cpio
    app-crypt/gnupg
    !app-emulation/rkt-bin
"
RDEPEND=""

pkg_setup() {
    enewgroup rkt
}

src_prepare() {
    ./autogen.sh
}

src_compile() {
    ARCH=x86_64 emake || die "emake failed"
}

src_install() {
    BUILD_DIR="${S}/build-rkt-${PV}/bin"
    dobin "${BUILD_DIR}"/rkt
    dobin "${BUILD_DIR}"/actool
    dobin "${BUILD_DIR}"/stage1-coreos.aci
    dobin "${BUILD_DIR}"/stage1-kvm.aci
    dobin "${BUILD_DIR}"/stage1-fly.aci

    systemd_dounit "${S}/dist/init/systemd/rkt-gc.service"
    systemd_dounit "${S}/dist/init/systemd/rkt-gc.timer"
    systemd_dounit "${S}/dist/init/systemd/rkt-metadata.service"
    systemd_dounit "${S}/dist/init/systemd/rkt-metadata.socket"
    dobashcomp "${S}/dist/bash_completion/rkt.bash"
}
