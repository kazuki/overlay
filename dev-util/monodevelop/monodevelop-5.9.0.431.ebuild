# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
inherit fdo-mime gnome2-utils versionator git-r3

DESCRIPTION="Integrated Development Environment for .NET"
HOMEPAGE="http://www.monodevelop.com/"
EGIT_REPO_URI="https://github.com/mono/monodevelop.git"
if [ "${PV}" != "9999" ];then
    EGIT_COMMIT="${P}"
fi

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+subversion +git doc"
export HOME=${T}/home

RDEPEND=">=dev-lang/mono-3.2.8
	>=dev-dotnet/gnome-sharp-2.24.2-r1
	>=dev-dotnet/gtk-sharp-2.12.21
	>=dev-dotnet/mono-addins-1.0[gtk]
	doc? ( dev-util/mono-docbrowser )
	>=dev-dotnet/xsp-2
	dev-util/ctags
	sys-apps/dbus[X]
	subversion? ( dev-vcs/subversion )
	!<dev-util/monodevelop-boo-$(get_version_component_range 1-2)
	!<dev-util/monodevelop-java-$(get_version_component_range 1-2)
	!<dev-util/monodevelop-database-$(get_version_component_range 1-2)
	!<dev-util/monodevelop-debugger-gdb-$(get_version_component_range 1-2)
	!<dev-util/monodevelop-debugger-mdb-$(get_version_component_range 1-2)
	!<dev-util/monodevelop-vala-$(get_version_component_range 1-2)"
DEPEND="${RDEPEND}
	dev-util/intltool
	virtual/pkgconfig
	sys-devel/gettext
	x11-misc/shared-mime-info
	x11-terms/xterm"
MAKEOPTS="${MAKEOPTS} -j1" #nowarn

src_configure() {
    mozroots --import --sync
	./configure --prefix="${EPREFIX}"/usr
}

src_install() {
    addpredict /root/.config/xbuild/pkgconfig-cache-2.xml
    emake DESTDIR="${D}" install
}                        

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
	fdo-mime_mime_database_update
	fdo-mime_desktop_database_update
}

pkg_postrm() {
	gnome2_icon_cache_update
	fdo-mime_mime_database_update
	fdo-mime_desktop_database_update
}
