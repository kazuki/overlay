EAPI=5
PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE='threads(+)' # required by waf
inherit python-any-r1 waf-utils

DESCRIPTION="More Succinct Trie Data structure"
HOMEPAGE="http://code.google.com/p/ux-trie/"
SRC_URI="http://ux-trie.googlecode.com/files/${P}.tar.bz2"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

src_configure() {
    # FIXME: quick hack. copy from waf-utils
    : ${WAF_BINARY:="${S}/waf"}
    tc-export AR CC CPP CXX RANLIB
    echo "CCFLAGS=\"${CFLAGS}\" LINKFLAGS=\"${LDFLAGS}\" \"${WAF_BINARY}\" --prefix=${EPREFIX}/usr $@ configure"
    CCFLAGS="${CFLAGS}" LINKFLAGS="${LDFLAGS}" "${WAF_BINARY}" \
    "--prefix=${EPREFIX}/usr" \
    "$@" \
    configure || die "configure failed"

}
