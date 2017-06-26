EAPI=5
PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )
PYTHON_REQ_USE='threads(+)' # required by waf
inherit python-any-r1 waf-utils eutils flag-o-matic

DESCRIPTION="Distributed Online Machine Learning Framework"
HOMEPAGE="http://jubat.us/"
SRC_URI="https://github.com/jubatus/jubatus/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64"
IUSE="zookeeper mecab ux opencv"

DEPEND=">=dev-cpp/jubatus-mpio-0.4.1
        =sci-calculators/jubatus-core-${PV}
        >=dev-cpp/jubatus-msgpack-rpc-0.4.1
        >=dev-libs/log4cxx-0.10.0
        zookeeper? ( >=sys-cluster/apache-zookeeper-3.4.0 )
        mecab? ( >=app-text/mecab-0.99 )
        ux? ( dev-libs/ux )
        opencv? ( >=media-libs/opencv-2.0.0 )"

src_configure() {
    waf-utils_src_configure \
        $(use zookeeper && printf -- "--enable-zookeeper") \
        $(use mecab && printf -- "--enable-mecab") \
        $(use ux && printf -- "--enable-ux") \
        $(use opencv && printf -- "--enable-opencv") \
        || die "configure failed"
}
