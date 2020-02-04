Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7556F151D26
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Feb 2020 16:25:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 070FC3C2581
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Feb 2020 16:25:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 34BEB3C244B
 for <ltp@lists.linux.it>; Tue,  4 Feb 2020 16:24:41 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C4EC82010EC
 for <ltp@lists.linux.it>; Tue,  4 Feb 2020 16:24:40 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 382E1ADA1;
 Tue,  4 Feb 2020 15:24:40 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  4 Feb 2020 16:24:29 +0100
Message-Id: <20200204152430.10935-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200204152430.10935-1-pvorel@suse.cz>
References: <20200204152430.10935-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [RFC PATCH v2 3/4] travis: Merge debian.cross-compile.*.sh
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
Cc: Mike Frysinger <vapier@gentoo.org>, Steve Dickson <SteveD@RedHat.com>,
 libtirpc-devel@lists.sourceforge.net, Daniel Gryniewicz <dang@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 .travis.yml                            |  6 +++---
 travis/debian.cross-compile.aarch64.sh | 11 -----------
 travis/debian.cross-compile.ppc64le.sh | 11 -----------
 travis/debian.cross-compile.sh         | 22 ++++++++++++++++++++++
 4 files changed, 25 insertions(+), 25 deletions(-)
 delete mode 100755 travis/debian.cross-compile.aarch64.sh
 delete mode 100755 travis/debian.cross-compile.ppc64le.sh
 create mode 100755 travis/debian.cross-compile.sh

diff --git a/.travis.yml b/.travis.yml
index 51efa22e3..d777a94c6 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -12,11 +12,11 @@ matrix:
 
         # cross compilation builds
         - os: linux
-          env: DISTRO=debian:stable VARIANT=cross-compile.ppc64le TREE="out"
+          env: DISTRO=debian:stable VARIANT=cross-compile ARCH=ppc64el TREE="out"
           compiler: powerpc64le-linux-gnu-gcc
 
         - os: linux
-          env: DISTRO=debian:stable VARIANT=cross-compile.aarch64 TREE="out"
+          env: DISTRO=debian:stable VARIANT=cross-compile ARCH=arm64 TREE="out"
           compiler: aarch64-linux-gnu-gcc
 
         # musl (native)
@@ -98,4 +98,4 @@ script:
     - INSTALL="${INSTALL%%/*}"
     - if [ ! "$TREE" ]; then TREE="in"; fi
     - case $VARIANT in cross-compile*) BUILD="cross";; i386) BUILD="32";; *) BUILD="native";; esac
-    - docker run -t ltp /bin/sh -c "cd travis && ./$INSTALL.sh && if [ \"$VARIANT\" ]; then ./$INSTALL.$VARIANT.sh; fi && ../build.sh -o $TREE -t $BUILD -c $CC"
+    - docker run -t ltp /bin/sh -c "cd travis && ./$INSTALL.sh && if [ \"$VARIANT\" ]; then ARCH=\"$ARCH\" ./$INSTALL.$VARIANT.sh; fi && ../build.sh -o $TREE -t $BUILD -c $CC"
diff --git a/travis/debian.cross-compile.aarch64.sh b/travis/debian.cross-compile.aarch64.sh
deleted file mode 100755
index cc1eda5b5..000000000
--- a/travis/debian.cross-compile.aarch64.sh
+++ /dev/null
@@ -1,11 +0,0 @@
-#!/bin/sh
-# Copyright (c) 2018-2020 Petr Vorel <pvorel@suse.cz>
-set -e
-
-dpkg --add-architecture arm64
-apt update
-
-apt install -y --no-install-recommends \
-	gcc-aarch64-linux-gnu \
-	libc6-dev-arm64-cross \
-	libtirpc-dev:arm64
diff --git a/travis/debian.cross-compile.ppc64le.sh b/travis/debian.cross-compile.ppc64le.sh
deleted file mode 100755
index 671867d31..000000000
--- a/travis/debian.cross-compile.ppc64le.sh
+++ /dev/null
@@ -1,11 +0,0 @@
-#!/bin/sh
-# Copyright (c) 2018-2020 Petr Vorel <pvorel@suse.cz>
-set -e
-
-dpkg --add-architecture ppc64el
-apt update
-
-apt install -y --no-install-recommends \
-	gcc-powerpc64le-linux-gnu \
-	libc6-dev-ppc64el-cross \
-	libtirpc-dev:ppc64el
diff --git a/travis/debian.cross-compile.sh b/travis/debian.cross-compile.sh
new file mode 100755
index 000000000..ea04c8862
--- /dev/null
+++ b/travis/debian.cross-compile.sh
@@ -0,0 +1,22 @@
+#!/bin/sh
+# Copyright (c) 2018-2020 Petr Vorel <pvorel@suse.cz>
+set -e
+
+if [ -z "$ARCH" ]; then
+	echo "missing \$ARCH!" >&2
+	exit 1
+fi
+
+case "$ARCH" in
+arm64) gcc_arch="aarch64";;
+ppc64el) gcc_arch="powerpc64le";;
+*) echo "unsupported arch: '$1'!" >&2; exit 1;;
+esac
+
+dpkg --add-architecture $ARCH
+apt update
+
+apt install -y --no-install-recommends \
+	gcc-${gcc_arch}-linux-gnu \
+	libc6-dev-${ARCH}-cross \
+	libtirpc-dev:$ARCH
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
