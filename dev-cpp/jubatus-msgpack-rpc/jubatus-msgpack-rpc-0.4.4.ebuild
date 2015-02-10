EAPI="3"

DESCRIPTION="msgpack-rpc for Jubatus"
HOMEPAGE="http://jubat.us/"
SRC_URI="https://github.com/jubatus/jubatus-msgpack-rpc/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-libs/msgpack-0.5.2
        >=dev-cpp/jubatus-mpio-0.4.0
        dev-lang/ruby"

src_configure() {
    cd cpp && ./bootstrap && econf || die "configure failed"
}

src_compile() {
    cd cpp && emake || die "make failed"
}

src_install() {
    cd cpp && emake DESTDIR="${D}" install || die "install failed"
}
