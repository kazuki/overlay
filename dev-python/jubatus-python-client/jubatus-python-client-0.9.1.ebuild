EAPI=5

PYTHON_COMPAT=( python2_7 python{3_3,3_4} )

inherit distutils-r1

DESCRIPTION="Jubatus's Python client"
HOMEPAGE="http://jubat.us/"
#SRC_URI="mirror://pypi/j/jubatus/jubatus-${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI="https://pypi.python.org/packages/78/bb/de109ccd56bebd911492105dc4afb21fb138823df2d14da9397363e2093c/jubatus-0.9.1.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="dev-python/msgpack-rpc-python"
DEPEND="${RDEPEND}"

src_unpack() {
    unpack ${A}

    # Rename github packaged dir name to standard dir name
    mv ${WORKDIR}/jubatus-${PV} ${WORKDIR}/${P}
}
