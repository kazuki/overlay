EAPI=5
inherit eutils

DESCRIPTION="msgpack-rpc for Jubatus"
HOMEPAGE="http://jubat.us/"
SRC_URI="http://download.jubat.us/files/source/jubatus_msgpack-rpc/jubatus_msgpack-rpc-${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="~amd64"
IUSE="patch"

DEPEND="patch? ( >=dev-libs/msgpack-1.1.0 )
        !patch? ( =dev-libs/msgpack-0.5.9 )
        >=dev-cpp/jubatus-mpio-0.4.0[patch=]"

src_unpack() {
    unpack "${A}"
    mv "${WORKDIR}/${P/-/_}" "${WORKDIR}/${P}"
}

src_prepare() {
    if use patch ; then
        epatch "${FILESDIR}/remove-dep.patch"
        epatch "${FILESDIR}/msgpack-1.1.patch"
        epatch "${FILESDIR}/cpp11.patch"
    fi
}

src_configure() {
    if [[ -x ${ECONF_SOURCE:-.}/configure ]] ; then
        if use patch ; then
            CXXFLAGS="$CXXFLAGS -std=c++11" econf
        else
            econf
        fi
    fi
}
