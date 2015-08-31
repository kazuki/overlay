# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
XORG_DRI="always"
inherit linux-info xorg-2

EGIT_REPO_URI="git://anongit.freedesktop.org/git/xorg/driver/xf86-video-amdgpu.git"
EGIT_BRANCH="master"

DESCRIPTION="AMD Xorg video driver"
HOMEPAGE="http://cgit.freedesktop.org/xorg/driver/xf86-video-amdgpu"
SRC_URI=""

KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

RDEPEND=">=x11-libs/libdrm-2.4.64[video_cards_radeon]"
DEPEND="${RDEPEND}"
