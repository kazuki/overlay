EAPI=5
PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )
PYTHON_REQ_USE='threads(+)' # required by waf
inherit python-any-r1 waf-utils eutils flag-o-matic

DESCRIPTION="Jubatus algorithm component "
HOMEPAGE="http://jubat.us/"
SRC_URI="https://github.com/jubatus/jubatus_core/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="LGPL-2"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="=dev-libs/msgpack-0.5.9
        dev-libs/oniguruma"

src_unpack() {
    unpack ${A}
    mv "${WORKDIR}/${P/-core/_core}" "${WORKDIR}/${P}"
    cd "${WORKDIR}/${P}"
    epatch "${FILESDIR}/fmv.patch"
}
