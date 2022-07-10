# Copyright 2018-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 meson

DESCRIPTION="An xrandr clone for wlroots compositors"
HOMEPAGE="https://git.sr.ht/~emersion/wlr-randr"
EGIT_REPO_URI="https://git.sr.ht/~emersion/wlr-randr"

KEYWORDS="~amd64"

LICENSE="MIT"
SLOT="0"

DEPEND="dev-libs/wayland"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/meson"

src_configure() {
	meson_src_configure
}
