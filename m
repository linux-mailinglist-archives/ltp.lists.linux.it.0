Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4609133F5B
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jan 2020 11:35:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 97A0F3C2466
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jan 2020 11:35:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 4EC883C2093
 for <ltp@lists.linux.it>; Wed,  8 Jan 2020 11:35:23 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 45ACE6009FB
 for <ltp@lists.linux.it>; Wed,  8 Jan 2020 11:35:22 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8DD7FAD79;
 Wed,  8 Jan 2020 10:35:20 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  8 Jan 2020 11:34:13 +0100
Message-Id: <20200108103413.29096-5-pvorel@suse.cz>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108103413.29096-1-pvorel@suse.cz>
References: <20200108103413.29096-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 4/4] travis: Test also libntirpc
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

in some builds in distros which ship it (Debian and Fedora).

Also test builds in Debian stable and oldstable without lib{n,}tirpc
(on stable results as no TI-RPC, oldstable will test glibc TI-RPC).

+ cleanup .travis.yml.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 .travis.yml                    | 24 ++++++++++++------------
 travis/debian.cross-compile.sh | 10 ++++++++--
 travis/debian.sh               | 10 ++++++++--
 travis/fedora.sh               | 11 ++++++++---
 4 files changed, 36 insertions(+), 19 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index d777a94c6..40a7d861a 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -12,11 +12,11 @@ matrix:
 
         # cross compilation builds
         - os: linux
-          env: DISTRO=debian:stable VARIANT=cross-compile ARCH=ppc64el TREE="out"
+          env: DISTRO=debian:stable VARIANT=cross-compile ARCH=ppc64el TREE=out
           compiler: powerpc64le-linux-gnu-gcc
 
         - os: linux
-          env: DISTRO=debian:stable VARIANT=cross-compile ARCH=arm64 TREE="out"
+          env: DISTRO=debian:stable VARIANT=cross-compile ARCH=arm64 TREE=out RPC=libntirpc
           compiler: aarch64-linux-gnu-gcc
 
         # musl (native)
@@ -28,14 +28,14 @@ matrix:
 
         # build with minimal dependencies
         - os: linux
-          env: DISTRO=debian:stable VARIANT=minimal TREE="out"
+          env: DISTRO=debian:stable VARIANT=minimal TREE=out RPC=none
           compiler: clang
 
         # native non-intel
         - os: linux
           arch: ppc64le
           compiler: gcc
-          env: DISTRO=debian:testing
+          env: DISTRO=debian:testing RPC=libntirpc
 
         - os: linux
           arch: s390x
@@ -44,11 +44,11 @@ matrix:
 
         # other builds
         - os: linux
-          env: DISTRO=fedora:latest
+          env: DISTRO=fedora:latest RPC=libntirpc
           compiler: clang
 
         - os: linux
-          env: DISTRO=centos:6 TREE="out"
+          env: DISTRO=centos:6 TREE=out
           compiler: gcc
 
         - os: linux
@@ -56,7 +56,7 @@ matrix:
           compiler: gcc
 
         - os: linux
-          env: DISTRO=debian:oldstable
+          env: DISTRO=debian:oldstable RPC=none
           compiler: clang
 
         - os: linux
@@ -72,15 +72,15 @@ matrix:
           compiler: gcc
 
         - os: linux
-          env: DISTRO=debian:testing
+          env: DISTRO=debian:testing RPC=libntirpc
           compiler: clang
 
         - os: linux
-          env: DISTRO=ubuntu:latest TREE="out"
+          env: DISTRO=ubuntu:latest TREE=out
           compiler: gcc
 
         - os: linux
-          env: DISTRO=ubuntu:xenial
+          env: DISTRO=ubuntu:xenial RPC=libntirpc
           compiler: gcc
 
         - os: linux
@@ -90,7 +90,7 @@ matrix:
 before_install:
     - DIR="/usr/src/ltp"
     - printf "FROM $DISTRO\nRUN mkdir -p $DIR\nWORKDIR $DIR\nCOPY . $DIR\n" > Dockerfile
-    - echo "cat Dockerfile"; cat Dockerfile; echo "=====" # FIXME: debug
+    - echo "cat Dockerfile"; cat Dockerfile; echo "====="
     - docker build -t ltp .
 
 script:
@@ -98,4 +98,4 @@ script:
     - INSTALL="${INSTALL%%/*}"
     - if [ ! "$TREE" ]; then TREE="in"; fi
     - case $VARIANT in cross-compile*) BUILD="cross";; i386) BUILD="32";; *) BUILD="native";; esac
-    - docker run -t ltp /bin/sh -c "cd travis && ./$INSTALL.sh && if [ \"$VARIANT\" ]; then ARCH=\"$ARCH\" ./$INSTALL.$VARIANT.sh; fi && ../build.sh -o $TREE -t $BUILD -c $CC"
+    - docker run -t ltp /bin/sh -c "cd travis && RPC=\"$RPC\" ./$INSTALL.sh && if [ \"$VARIANT\" ]; then ARCH=\"$ARCH\" RPC=\"$RPC\" ./$INSTALL.$VARIANT.sh; fi && ../build.sh -o $TREE -t $BUILD -c $CC"
diff --git a/travis/debian.cross-compile.sh b/travis/debian.cross-compile.sh
index 2d2e609be..2f2b7a70c 100755
--- a/travis/debian.cross-compile.sh
+++ b/travis/debian.cross-compile.sh
@@ -2,7 +2,7 @@
 # Copyright (c) 2018-2020 Petr Vorel <pvorel@suse.cz>
 set -e
 
-if [ -z "$ARCH" ];
+if [ -z "$ARCH" ]; then
 	echo "missing \$ARCH!"
 	exit 1
 fi
@@ -10,7 +10,13 @@ fi
 dpkg --add-architecture $ARCH
 apt update
 
+EXTRA_PACKAGES="libtirpc-dev:$ARCH"
+case "$RPC" in
+libntirpc) EXTRA_PACKAGES="libntirpc-dev:$ARCH";;
+none) EXTRA_PACKAGES=;;
+esac
+
 apt install -y --no-install-recommends \
 	gcc-${ARCH}-linux-gnu \
 	libc6-dev-${ARCH}-cross \
-	libtirpc-dev:${ARCH}
+	$EXTRA_PACKAGES
diff --git a/travis/debian.sh b/travis/debian.sh
index c8ec9429c..e6ca72ab2 100755
--- a/travis/debian.sh
+++ b/travis/debian.sh
@@ -8,6 +8,12 @@ grep -v oldstable-updates /etc/apt/sources.list > /tmp/sources.list && mv /tmp/s
 
 apt update
 
+EXTRA_PACKAGES="libtirpc-dev"
+case "$RPC" in
+libntirpc) EXTRA_PACKAGES="libntirpc-dev";;
+none) EXTRA_PACKAGES=;;
+esac
+
 apt install -y --no-install-recommends \
 	acl-dev \
 	autoconf \
@@ -33,7 +39,7 @@ apt install -y --no-install-recommends \
 	libselinux1-dev \
 	libsepol1-dev \
 	libssl-dev \
-	libtirpc-dev \
 	linux-libc-dev \
 	lsb-release \
-	pkg-config
+	pkg-config \
+	$EXTRA_PACKAGES
diff --git a/travis/fedora.sh b/travis/fedora.sh
index 768aec762..08feedbd1 100755
--- a/travis/fedora.sh
+++ b/travis/fedora.sh
@@ -2,6 +2,12 @@
 # Copyright (c) 2018-2020 Petr Vorel <pvorel@suse.cz>
 set -e
 
+EXTRA_PACKAGES="libtirpc-devel"
+case "$RPC" in
+libntirpc) EXTRA_PACKAGES="libntirpc-devel";;
+none) EXTRA_PACKAGES=;;
+esac
+
 yum -y install \
 	autoconf \
 	automake \
@@ -9,7 +15,6 @@ yum -y install \
 	clang \
 	gcc \
 	findutils \
-	libtirpc \
-	libtirpc-devel \
 	pkg-config \
-	redhat-lsb-core
+	redhat-lsb-core \
+	$EXTRA_PACKAGES
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
