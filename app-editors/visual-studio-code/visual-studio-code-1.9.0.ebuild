# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils pax-utils

DESCRIPTION="Multiplatform Visual Studio Code from Microsoft"
HOMEPAGE="https://code.visualstudio.com"
BASE_URI="https://vscode-update.azurewebsites.net/${PV}"
SRC_URI="
	x86? ( ${BASE_URI}/linux-ia32/stable ->  ${P}-x86.tar.gz )
	amd64? ( ${BASE_URI}/linux-x64/stable -> ${P}-amd64.tar.gz )
	"
RESTRICT="mirror strip"

LICENSE="Microsoft"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
	>=media-libs/libpng-1.2.46
	>=x11-libs/gtk+-2.24.8-r1:2
	x11-libs/cairo
	gnome-base/gconf
	x11-libs/libXtst
"

RDEPEND="
	${DEPEND}
	x11-libs/libnotify
"

ARCH=$(uname -m)

[[ ${ARCH} == "x86_64" ]] && S="${WORKDIR}/VSCode-linux-x64"
[[ ${ARCH} != "x86_64" ]] && S="${WORKDIR}/VSCode-linux-ia32"

src_install(){
	pax-mark m code
	insinto "/opt/${PN}"
	doins -r *
	dosym "/opt/${PN}/code" "/usr/bin/visual-studio-code"
	make_wrapper "${PN}" "/opt/${PN}/code"
	make_desktop_entry "${PN}" "Visual Studio Code" "${PN}" "Development;IDE"
	doicon ${FILESDIR}/${PN}.png
	fperms +x "/opt/${PN}/code"
	fperms +x "/opt/${PN}/libnode.so"
	insinto "/usr/share/licenses/${PN}"
	newins "resources/app/LICENSE.txt" "LICENSE"
}

pkg_postinst(){
	elog "You may install some additional utils, so check them in:"
	elog "https://code.visualstudio.com/Docs/setup#_additional-tools"
}
