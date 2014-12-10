# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )

inherit distutils-r1 git-2

DESCRIPTION="Tool to submit code to Gerrit"
HOMEPAGE="https://launchpad.net/git-review"
EGIT_REPO_URI=https://github.com/openstack-infra/git-review.git

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools
        >=dev-python/requests-1.1
"
RDEPEND="${DEPEND}
	dev-vcs/git"
