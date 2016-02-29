EAPI=5
inherit eutils

DESCRIPTION="msgpack-rpc for Jubatus"
HOMEPAGE="http://jubat.us/"
SRC_URI="http://download.jubat.us/files/source/jubatus_msgpack-rpc/jubatus_msgpack-rpc-${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Apache-2.0"

SLOT="0"
KEYWORDS="~amd64"

DEPEND=">=dev-libs/msgpack-0.1.1.0
        >=dev-cpp/jubatus-mpio-0.4.0"

src_unpack() {
    unpack "${A}"
    mv "${WORKDIR}/${P/-/_}" "${WORKDIR}/${P}"
}

src_prepare() {
    epatch "${FILESDIR}/remove-dep.patch"
    epatch "${FILESDIR}/msgpack-1.1.patch"
    epatch "${FILESDIR}/cpp11.patch"
}

src_configure() {
    if [[ -x ${ECONF_SOURCE:-.}/configure ]] ; then
        CXXFLAGS="$CXXFLAGS -std=c++11" econf
    fi
}
