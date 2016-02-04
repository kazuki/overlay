EAPI=5

DESCRIPTION="Apache Mesos is a cluster manager that provides efficient resource isolation and sharing across distributed applications, or frameworks. It can run Hadoop, MPI, Hypertable, Spark, and other frameworks on a dynamically shared pool of nodes."
HOMEPAGE="http://mesos.apache.org/"
SRC_URI="http://www.apache.org/dist/mesos/${PV}/mesos-${PV}.tar.gz"

SLOT="0"
KEYWORDS="~amd64"
IUSE="java python"
DEPEND="
    java? ( dev-java/maven-bin )
    dev-libs/cyrus-sasl
    dev-libs/apr
    dev-vcs/subversion
    net-misc/curl
    >=dev-libs/boost-1.56.0
"
RDEPEND="${DEPEND}"

src_configure() {
    LDFLAGS="-std=c++11 $LDFLAGS" \
    CXXFLAGS="-std=c++11 $CXXFLAGS" \
    econf --without-boost \
        $(use_enable java) \
        $(use_enable python) \
        || die "configure failed"
}
