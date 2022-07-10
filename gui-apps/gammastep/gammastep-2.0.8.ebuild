# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8


inherit autotools systemd

DESCRIPTION="Adjust the color temperature of your screen according to
your surroundings."
HOMEPAGE="https://gitlab.com/chinstrap/gammastep"

SRC_URI="${HOMEPAGE}/-/archive/v${PV}/${PN}-v${PV}.tar.gz -> ${P}.tar.gz"

# License of the package.  This must match the name of file(s) in the
# licenses/ directory.  For complex license combination see the developer
# docs on gentoo.org for details.
LICENSE="GPL-3"
SLOT="0"

KEYWORDS="~amd64"

IUSE="X apparmor appindicator drm geoclue systemd wayland"

S="${WORKDIR}/${PN}-v${PV}"

DEPEND="
	X? (
		>=x11-libs/libX11-1.4
		x11-libs/libXxf86vm
		x11-libs/libxcb
	)
	appindicator? ( dev-libs/libappindicator )
	drm? ( x11-libs/libdrm )
	geoclue? ( app-misc/geoclue:2.0 dev-libs/glib:2 )
	wayland? ( >=dev-libs/wayland-1.21.0 ) 
"

RDEPEND="${DEPEND}"

BDEPEND="
	${COMMON_DEPEND}
	>=dev-util/intltool-0.50
"


src_prepare() {
	default
	eautoreconf
}

src_configure() {
	local systemd_dir=$([ $(use systemd) -eq 0 ] && echo $(systemd_get_userunitdir) || echo no)

	econf \
		$(use_enable drm) \
		$(use_enable X randr) \
		$(use_enable X vidmode) \
		$(use_enable geoclue geoclue2) \
		$(use_enable wayland) \
		$(use_enable apparmor) \
		--with-systemduserunitdir="$systemd_dir"
}

src_install() {
	emake DESTDIR="${D}" UPDATE_ICON_CACHE=/bin/true install
}
