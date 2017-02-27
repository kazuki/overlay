EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5,3_6} )

inherit distutils-r1

DESCRIPTION="jubatus_core Python binding"
HOMEPAGE="http://jubat.us/"
LICENSE="LGPL-2"
SRC_URI="https://github.com/jubatus/embedded-jubatus-python/archive/${PV}.tar.gz -> ${P}.tar.gz"

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
