EAPI=5

PYTHON_COMPAT=( python2_7 python{3_3,3_4,3_5} )

inherit distutils-r1

DESCRIPTION="Jubatus's Python client"
HOMEPAGE="http://jubat.us/"
#SRC_URI="mirror://pypi/j/jubatus/jubatus-${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI="https://pypi.python.org/packages/35/be/0487017d530ce23d37d4538ead2801a38a59085d99af08404f104bbedd6b/jubatus-1.0.0.tar.gz -> ${P}.tar.gz"
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
