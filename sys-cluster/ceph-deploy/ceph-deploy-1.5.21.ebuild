EAPI="5"

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Deploy Ceph with minimal infrastructure, using just SSH access"
HOMEPAGE="https://github.com/ceph/ceph-deploy"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
       "
RDEPEND="${DEPEND}"
