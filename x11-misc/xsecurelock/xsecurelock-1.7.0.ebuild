# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="X11 screen lock utility with security in mind"
HOMEPAGE="https://github.com/google/xsecurelock"
SRC_URI="https://github.com/google/xsecurelock/releases/download/v${PV}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"

IUSE="mplayer mpv xscreensaver +xss"

RDEPEND="
	mplayer? ( media-video/mplayer )
	mpv? ( media-video/mpv )
	xscreensaver? ( x11-misc/xscreensaver )
	xss? ( x11-misc/xss-lock )
	sys-devel/binutils
	sys-devel/gcc
	sys-libs/pam
	x11-libs/libX11
	x11-libs/libXcomposite
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXft
	x11-libs/libXmu
	x11-libs/libXrandr
	x11-libs/libXScrnSaver
"

DEPEND="
	${RDEPEND}
	x11-base/xorg-proto
"

BDEPEND="virtual/pkgconfig"


src_prepare() {
	default
	eautoreconf
}

src_configure() {
	local econfargs=(
		--prefix="${EPREFIX}"/usr
		--with-pam-service-name=system-auth
		--without-pamtester
		$(use_with mplayer)
		$(use_with mpv)
		$(use_with xscreensaver)
	)

	econf "${econfargs[@]}"
}
