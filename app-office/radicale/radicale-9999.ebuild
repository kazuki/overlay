# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
PYTHON_DEPEND="*:2.6"
SUPPORT_PYTHON_ABIS=1

inherit distutils git-2 autotools eutils

EGIT_REPO_URI="git://github.com/Kozea/Radicale.git"

MY_PN="Radicale"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A simple CalDAV/CardDAV server"
HOMEPAGE="http://www.radicale.org/"
#SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="fastcgi ldap logrotate ssl"

# the '>=' goes ok, as radicale supports _all_ other python version
# this includes all 3.* versions
RDEPEND="ssl? ( >=dev-lang/python-2.6.6[ssl] )
                ldap? ( dev-python/python-ldap )
                fastcgi? ( dev-python/flup )"

S=${WORKDIR}/${MY_P}
RHOMEDIR=/var/lib/radicale
RLOGDIR=/var/log/radicale

pkg_setup() {
        # Create radicale user
        if egetent passwd radicale >/dev/null ; then
                einfo "Creating new user \"radicale\""
                enewuser radicale -1 -1 /var/lib/radicale || die
        fi
}

src_unpack() {
        git-2_src_unpack
        cd "${S}"
}

src_prepare() {
        sed -i -e "s:^folder = .*$:folder = ${RHOMEDIR}:g" \
                config || die
}

src_install() {
        # delete the useless .rst, so that it is not installed
        rm README.rst

        distutils_src_install

        # init file
        newinitd "${FILESDIR}"/radicale.init.d radicale || die

        # config file
        insinto /etc/${PN}
        doins config logging || die

        # fcgi and wsgi files
        insinto /usr/share/${PN}
        doins radicale.wsgi
        use fastcgi && doins radicale.fcgi

        # logrotate config
        if use logrotate ; then
                insinto /etc/logrotate.d
                newins "${FILESDIR}"/radicale.logrotate radicale || die
        fi

        # Creating necessary directories
        diropts -m0750
        dodir /var/lib/radicale; fowners radicale:root ${RHOMEDIR}
        dodir /var/log/radicale; fowners radicale:root ${RLOGDIR}
}

pkg_postinst() {
        einfo "Please review config files \"config\" and \"logging\""
        einfo "in \"/etc/radicale\" directory before starting radicale."
        einfo "Radicale now supports WSGI."
        einfo "A sample wsgi-script has been put into ${ROOT}usr/share/${PN}."
        use fastcgi && einfo "You will also find there an example fcgi-script."
}
