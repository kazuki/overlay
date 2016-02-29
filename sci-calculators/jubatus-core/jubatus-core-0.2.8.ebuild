EAPI=5
PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE='threads(+)' # required by waf
inherit python-any-r1 waf-utils eutils flag-o-matic

DESCRIPTION="Jubatus algorithm component "
HOMEPAGE="http://jubat.us/"
SRC_URI="https://github.com/jubatus/jubatus_core/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="LGPL-2"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-libs/msgpack-1.1.0
       dev-libs/oniguruma"

append-cppflags "-std=c++11"

src_unpack() {
    unpack ${A}
    mv "${WORKDIR}/${P/-core/_core}" "${WORKDIR}/${P}"
}

src_prepare() {
    epatch "${FILESDIR}/msgpack-1.1.patch"
}
