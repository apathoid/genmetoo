# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8


inherit meson git-r3

DESCRIPTION="wmenu - dmenu for Wayland"
HOMEPAGE="https://git.sr.ht/~adnano/wmenu"
EGIT_REPO_URI="https://git.sr.ht/~adnano/wmenu"

#S="${WORKDIR}/${P}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="+man"

DEPEND="
    x11-libs/cairo
    x11-libs/pango
    dev-libs/wayland
    x11-libs/libxkbcommon
    man? ( app-text/scdoc )
"
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
