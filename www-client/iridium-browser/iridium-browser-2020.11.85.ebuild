# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Note taking and to-do application"
HOMEPAGE="https://iridiumbrowser.de/"
SRC_URI="https://downloads.iridiumbrowser.de/epel8/iridium-browser-${PV}-1.el8.x86_64.rpm"

LICENSE="BSD-3-Clause License"
SLOT="0"

DEPEND="app-arch/rpm2targz"

KEYWORDS="~amd64"

src_unpack() {
	rpmunpack ${PORTAGE_TMPDIR}/portage/${CATEGORY}/${PF}/distdir/${A}

	S=${S}-1.el8.x86_64
}

src_install() {
	cp -r ${S}/usr ${D}/
	cp -r ${S}/etc ${D}/
}
