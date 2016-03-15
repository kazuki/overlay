EAPI=5
PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE='threads(+)' # required by waf
inherit python-any-r1 waf-utils eutils flag-o-matic

DESCRIPTION="Distributed Online Machine Learning Framework"
HOMEPAGE="http://jubat.us/"
SRC_URI="https://github.com/jubatus/jubatus/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64"
IUSE="zookeeper mecab ux patch"

DEPEND=">=dev-cpp/jubatus-mpio-0.4.1
        >=sci-calculators/jubatus-core-0.2.7[patch=]
        >=dev-cpp/jubatus-msgpack-rpc-0.4.1[patch=]
        >=dev-libs/log4cxx-0.10.0
        zookeeper? ( >=sys-cluster/apache-zookeeper-3.4.0 )
        mecab? ( >=app-text/mecab-0.99 )
        ux? ( dev-libs/ux )"

src_prepare() {
    if use patch ; then
        epatch "${FILESDIR}/msgpack-1.1.patch"
        epatch "${FILESDIR}/cpp11.patch"
    fi
}

src_configure() {
    use patch && append-cppflags "-std=c++11"
    waf-utils_src_configure \
        $(use zookeeper && printf -- "--enable-zookeeper") \
        $(use mecab && printf -- "--enable-mecab") \
        $(use ux && printf -- "--enable-ux") || die "configure failed"
}
