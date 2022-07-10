# Copyright 2018-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 meson

DESCRIPTION="Day/night gamma adjustments for Wayland"
HOMEPAGE="https://git.sr.ht/~kennylevinsen/wlsunset"
EGIT_REPO_URI="https://git.sr.ht/~kennylevinsen/wlsunset"

KEYWORDS="~amd64"

LICENSE="MIT"
SLOT="0"

IUSE="man"

DEPEND="dev-libs/wayland"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-util/meson
	man? ( app-text/scdoc )
"

src_configure() {
	local emesonargs=(
		$(meson_features man man-pages)
	)
	meson_src_configure
}
