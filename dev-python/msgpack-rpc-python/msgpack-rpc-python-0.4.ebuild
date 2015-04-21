EAPI=5

PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="MessagePack RPC for Python"
HOMEPAGE="https://github.com/msgpack-rpc/msgpack-rpc-python"
SRC_URI="https://pypi.python.org/packages/source/m/msgpack-rpc-python/msgpack-rpc-python-${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Apache"

SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="dev-python/msgpack
         >=www-servers/tornado-3.0.0"
DEPEND="${RDEPEND}"
