# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2


EAPI="8"

DESCRIPTION="
	Tuta is an email service with a strong focus on security and privacy that lets you encrypt emails,
	contacts and calendar entries on all your devices."
HOMEPAGE="https://tuta.com/
	https://github.com/tutao/tutanota"
SRC_URI="https://github.com/tutao/tutanota/releases/download/${PN}-release-${PV}/${P}-unpacked-linux.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"


RDEPEND="
	app-crypt/libsecret[crypt]
	dev-libs/nss
"


S="${WORKDIR}/linux-unpacked"
PKG_DIR="/opt/${PN}"

src_install() {
	cd "${S}"

	dodir "${PKG_DIR}"
	cp -r . "${ED}/${PKG_DIR}"

	cd "${ED}/${PKG_DIR}"

	chmod 4755 chrome-sandbox
	dosym -r "${PKG_DIR}/${PN}" "/usr/bin/${PN}"

	for icon_size in 16x16 32x32 128x128 256x256 512x512; do
		dodir "/usr/share/icons/hicolor/${icon_size}/apps"
		cp "resources/icons/logo-solo-red.png.iconset/icon_${icon_size}.png" \
			"${ED}/usr/share/icons/hicolor/${icon_size}/apps/${PN}.png"
	done

	dodir "/usr/share/applications"
	cp "${FILESDIR}/${PN}.desktop" "${ED}/usr/share/applications"
}
