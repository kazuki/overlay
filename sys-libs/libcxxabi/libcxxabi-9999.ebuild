# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

ESVN_REPO_URI="http://llvm.org/svn/llvm-project/libcxxabi/trunk"

[ "${PV%9999}" != "${PV}" ] && SCM="subversion" || SCM=""

inherit ${SCM} eutils

DESCRIPTION="New implementation of the C++ ABI, targeting C++0X"
HOMEPAGE="http://libcxxabi.llvm.org/"
if [ "${PV%9999}" = "${PV}" ] ; then
        SRC_URI="mirror://gentoo/${P}.tar.xz"
else
        SRC_URI=""
fi

LICENSE="|| ( UoI-NCSA MIT )"
SLOT="0"
if [ "${PV%9999}" = "${PV}" ] ; then
        KEYWORDS="~amd64"
else
        KEYWORDS=""
fi
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
        sys-libs/libunwind
        sys-devel/clang"

#src_prepare() {
#        epatch "${FILESDIR}/fix-buildit.patch"
#}

src_compile() {
        pushd "${S}"/lib
        ./buildit || die
        popd
}

src_install() {
        pushd "${S}"

        pushd lib
        dolib.so lib*.so* || die
        dosym libc++abi.so.1.0 ${DESTTREE}/$(get_libdir)/libc++abi.so.1
        dosym libc++abi.so.1 ${DESTTREE}/$(get_libdir)/libc++abi.so
        popd

        insinto /usr/include
        doins include/*

        dodoc CREDITS.TXT

        popd
}
