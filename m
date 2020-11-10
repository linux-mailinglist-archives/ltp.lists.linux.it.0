Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD1A2AD5C7
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 13:00:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D505A3C5363
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 13:00:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 515653C2F57
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 13:00:49 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 308D11A00FE3
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 13:00:47 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 68B46ABCC;
 Tue, 10 Nov 2020 12:00:47 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 10 Nov 2020 13:00:35 +0100
Message-Id: <20201110120035.20543-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] travis: Add libefivar support
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

Travis support for Martin's patchset
https://patchwork.ozlabs.org/project/ltp/list/?series=213179&state=*

Travis CI:
https://travis-ci.org/github/pevik/ltp/builds/742684375

Kind regards,
Petr

 travis/debian.cross-compile.sh | 1 +
 travis/debian.i386.sh          | 1 +
 travis/debian.minimal.sh       | 1 +
 travis/debian.sh               | 1 +
 travis/fedora.sh               | 1 +
 travis/tumbleweed.sh           | 1 +
 6 files changed, 6 insertions(+)

diff --git a/travis/debian.cross-compile.sh b/travis/debian.cross-compile.sh
index 0a7ef7710..e27c6c9bc 100755
--- a/travis/debian.cross-compile.sh
+++ b/travis/debian.cross-compile.sh
@@ -20,5 +20,6 @@ apt update
 apt install -y --no-install-recommends \
 	gcc-${gcc_arch}-linux-gnu \
 	libc6-dev-${ARCH}-cross \
+	libefivar-dev:$ARCH \
 	libmnl-dev:$ARCH \
 	libtirpc-dev:$ARCH
diff --git a/travis/debian.i386.sh b/travis/debian.i386.sh
index 707a23ca6..1cf7734dd 100755
--- a/travis/debian.i386.sh
+++ b/travis/debian.i386.sh
@@ -13,6 +13,7 @@ apt install -y --no-install-recommends \
 	libcap2:i386 \
 	libc6-dev-i386 \
 	libc6:i386 \
+	libefivar-dev:i386 \
 	libkeyutils1:i386 \
 	libnuma1:i386 \
 	libssl-dev:i386 \
diff --git a/travis/debian.minimal.sh b/travis/debian.minimal.sh
index 3f1941969..4b6d65727 100755
--- a/travis/debian.minimal.sh
+++ b/travis/debian.minimal.sh
@@ -8,6 +8,7 @@ apt remove -y \
 	libaio1 \
 	libcap-dev \
 	libcap2 \
+	libefivar-dev \
 	libkeyutils-dev \
 	libkeyutils1 \
 	libmm-dev \
diff --git a/travis/debian.sh b/travis/debian.sh
index b759a9576..dec18189c 100755
--- a/travis/debian.sh
+++ b/travis/debian.sh
@@ -25,6 +25,7 @@ apt install -y --no-install-recommends \
 	libcap2 \
 	libc6 \
 	libc6-dev \
+	libefivar-dev \
 	libkeyutils-dev \
 	libkeyutils1 \
 	libmm-dev \
diff --git a/travis/fedora.sh b/travis/fedora.sh
index 990a84daf..27b979353 100755
--- a/travis/fedora.sh
+++ b/travis/fedora.sh
@@ -9,6 +9,7 @@ yum -y install \
 	clang \
 	gcc \
 	findutils \
+	efivar-devel \
 	libtirpc \
 	libtirpc-devel \
 	pkg-config \
diff --git a/travis/tumbleweed.sh b/travis/tumbleweed.sh
index 4d5e9da79..2ce919426 100755
--- a/travis/tumbleweed.sh
+++ b/travis/tumbleweed.sh
@@ -10,6 +10,7 @@ zypper --non-interactive install --force-resolution --no-recommends \
 	gcc \
 	gzip \
 	make \
+	efivar-devel \
 	kernel-default-devel \
 	keyutils-devel \
 	libacl-devel \
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
