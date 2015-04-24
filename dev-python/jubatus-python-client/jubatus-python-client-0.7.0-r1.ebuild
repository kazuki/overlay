EAPI=5

PYTHON_COMPAT=( python2_7 python{3_3,3_4} )

inherit distutils-r1

DESCRIPTION="Jubatus's Python client"
HOMEPAGE="http://jubat.us/"
SRC_URI="https://pypi.python.org/packages/source/j/jubatus/jubatus-${PV}.tar.gz -> ${P}.tar.gz"
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

    cd "${S}"
    epatch "${FILESDIR}/py3.patch"
}
