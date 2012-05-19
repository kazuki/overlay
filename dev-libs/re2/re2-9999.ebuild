# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils mercurial

DESCRIPTION="An efficient, principled regular expression library"
HOMEPAGE="http://code.google.com/p/re2/"
EHG_REPO_URI="https://re2.googlecode.com/hg"
S="${WORKDIR}/${EHG_REPO_URI##*/}"

LICENSE="BSD"
SLOT=0
KEYWORDS=""
IUSE=""

RDEPEND=""
DEPEND=""

src_install(){
	# prefix is really in lowercase!
	emake DESTDIR="${D}" prefix="/usr" install || die
	dodoc README || die
}
