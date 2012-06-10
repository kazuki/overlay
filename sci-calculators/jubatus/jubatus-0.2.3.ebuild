# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit waf-utils

DESCRIPTION="Distributed Online Machine Learning Framework"
HOMEPAGE="http://jubat.us/"
SRC_URI="https://github.com/jubatus/jubatus/tarball/jubatus-${PV} -> ${P}.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="zookeeper +re2 mecab ux"

DEPEND="dev-cpp/pficommon[mprpc]
		dev-cpp/glog
		zookeeper? ( >=sys-cluster/apache-zookeeper-3.4.0 )
		re2? ( dev-libs/re2 )
		mecab? ( app-text/mecab )
		ux? ( dev-libs/ux )"
RDEPEND="${DPEND}"

src_unpack() {
    unpack ${A}

    # Rename github packaged dir name to standard dir name
    mv ${WORKDIR}/jubatus-jubatus-* ${WORKDIR}/${P}
}

src_configure() {
	# FIXME: quick hack. copy from waf-utils
	: ${WAF_BINARY:="${S}/waf"}
	tc-export AR CC CPP CXX RANLIB
	CCFLAGS="${CFLAGS}" LINKFLAGS="${LDFLAGS}" "${WAF_BINARY}" \
	"--prefix=${EPREFIX}/usr" \
	$(use zookeeper && printf -- "--enable-zookeeper") \
	$(use re2 || printf -- "--disable-re2") \
	$(use mecab && printf -- "--enable-mecab") \
	$(use ux && printf -- "--enable-ux") \
	"$@" \
	configure || die "configure failed"
}

src_compile() {
	waf-utils_src_compile
}

src_install() {
	waf-utils_src_install
}
