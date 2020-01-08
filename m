Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6686B133F5C
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jan 2020 11:35:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 31A053C24DE
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jan 2020 11:35:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id CA0B63C2093
 for <ltp@lists.linux.it>; Wed,  8 Jan 2020 11:35:23 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 31F132013A2
 for <ltp@lists.linux.it>; Wed,  8 Jan 2020 11:35:22 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8EF40AD8E;
 Wed,  8 Jan 2020 10:35:20 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  8 Jan 2020 11:34:12 +0100
Message-Id: <20200108103413.29096-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108103413.29096-1-pvorel@suse.cz>
References: <20200108103413.29096-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 3/4] travis: Merge debian.cross-compile.*.sh
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
 travis/debian.cross-compile.sh         | 16 ++++++++++++++++
 4 files changed, 19 insertions(+), 25 deletions(-)
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
index 000000000..2d2e609be
--- /dev/null
+++ b/travis/debian.cross-compile.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+# Copyright (c) 2018-2020 Petr Vorel <pvorel@suse.cz>
+set -e
+
+if [ -z "$ARCH" ];
+	echo "missing \$ARCH!"
+	exit 1
+fi
+
+dpkg --add-architecture $ARCH
+apt update
+
+apt install -y --no-install-recommends \
+	gcc-${ARCH}-linux-gnu \
+	libc6-dev-${ARCH}-cross \
+	libtirpc-dev:${ARCH}
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
