EAPI="3"

PYTHON_DEPEND="2 3"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS=""

inherit distutils

DESCRIPTION="Jubatus's Python client"
HOMEPAGE="http://jubat.us/"
SRC_URI="https://github.com/jubatus/jubatus-python-client/tarball/${PV} -> ${P}.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="dev-python/msgpack"
DEPEND="${RDEPEND}"

src_unpack() {
    unpack ${A}

    # Rename github packaged dir name to standard dir name
    mv ${WORKDIR}/jubatus-jubatus-python-client-* ${WORKDIR}/${P}
}

src_compile() {
	distutils_src_compile
}

src_install() {
	distutils_src_install
}

pkg_postinst() {
	distutils_pkg_postinst
}
