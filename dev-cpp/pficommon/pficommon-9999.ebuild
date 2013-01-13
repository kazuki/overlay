# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-cpp/pficommon/pficommon-1.3.1.0.ebuild,v 1.2 2012/07/08 19:56:24 naota Exp $

EAPI=4

inherit git-2 waf-utils eutils

DESCRIPTION="General purpose C++ library for PFI"
HOMEPAGE="https://github.com/pfi/pficommon"
EGIT_REPO_URI="https://github.com/pfi/pficommon.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="fcgi imagemagick mprpc mysql postgres test"

RDEPEND="fcgi? ( dev-libs/fcgi )
	imagemagick? (
		media-libs/lcms
		media-gfx/imagemagick[cxx]
		sys-devel/libtool
	)
	mprpc? ( dev-libs/msgpack )
	mysql? ( virtual/mysql )
	postgres? ( dev-db/postgresql-base )
	"
DEPEND="${RDEPEND}
	test? ( dev-cpp/gtest )"

src_unpack() {
    git-2_src_unpack
    cd "${S}"
}

src_prepare() {
	epatch "${FILESDIR}"/pficommon-1.3.1.0-postgresql.patch
}

src_configure() {
	if use fcgi; then
		myconf="${myconf} --with-fcgi=/usr"
	else
		myconf="${myconf} --disable-fcgi"
	fi
	use imagemagick || myconf="${myconf} --disable-magickpp"
	use mprpc || myconf="${myconf} --disable-mprpc"
	if ! use mysql && ! use postgres; then
		myconf="${myconf} --disable-database"
	fi
	waf-utils_src_configure ${myconf}
}
