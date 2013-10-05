EAPI="5"

PYTHON_COMPAT=( python3_1 python3_2 python3_3 )

inherit distutils-r1

DESCRIPTION="Pure python memcached client"
HOMEPAGE="https://github.com/eguven/python3-memcached"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="OSL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""
