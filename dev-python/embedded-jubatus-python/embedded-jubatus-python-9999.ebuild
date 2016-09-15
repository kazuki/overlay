EAPI=5
PYTHON_COMPAT=( python2_7 python{3_3,3_4,3_5} )

inherit distutils-r1 git-2

DESCRIPTION="jubatus_core Python binding"
HOMEPAGE="http://jubat.us/"
LICENSE="LGPL-2"
EGIT_REPO_URI="https://github.com/jubatus/embedded-jubatus-python.git"

SLOT="0"
KEYWORDS="~amd64"
IUSE="numpy"

RDEPEND="dev-python/jubatus-python-client"
DEPEND="${RDEPEND}
    >=dev-python/cython-0.22
    numpy? ( dev-python/numpy )"
