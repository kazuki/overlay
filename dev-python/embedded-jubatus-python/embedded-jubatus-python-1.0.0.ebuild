EAPI=5
PYTHON_COMPAT=( python2_7 python{3_3,3_4,3_5} )

inherit distutils-r1

DESCRIPTION="jubatus_core Python binding"
HOMEPAGE="http://jubat.us/"
LICENSE="LGPL-2"
SRC_URI="https://pypi.python.org/packages/9f/0f/81fbc34cc34b99ca47a1df5b45a4ba63c29e592031b4e9a0d2376fd8acf2/embedded_jubatus-1.0.0-1.tar.gz -> ${P}.tar.gz"

SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="numpy"

RDEPEND="dev-python/jubatus-python-client"
DEPEND="${RDEPEND}
    >=dev-python/cython-0.22
    numpy? ( dev-python/numpy )"

src_unpack() {
    unpack ${A}

    # Rename github packaged dir name to standard dir name
    mv ${WORKDIR}/embedded* ${WORKDIR}/${P}
}
