# Copyright 2018-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/LemonBoy/bar.git"
fi

DESCRIPTION="A featherweight, lemon-scented, bar based on xcb"
HOMEPAGE="https://github.com/LemonBoy/bar"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="https://github.com/drscream/lemonbar-xft/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"

DEPEND="x11-libs/libxcb x11-libs/libXft"
RDEPEND="${DEPEND}
	dev-lang/perl
"
BDEPEND=""

if [[ ${PV} != *9999 ]]; then
	S="${WORKDIR}/lemonbar-xft-${PV}"
fi
