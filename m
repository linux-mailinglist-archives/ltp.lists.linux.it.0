Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE2D155B6B
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Feb 2020 17:08:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 667A63C23C6
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Feb 2020 17:08:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id C345F3C2384
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 17:08:39 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 047AB600052
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 17:08:38 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 65B73AF65
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 16:08:38 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  7 Feb 2020 17:08:31 +0100
Message-Id: <20200207160831.27493-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] build: Disable make install for most of builds
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

build.sh: add -i option which enables make install (default off)
Enable it in Debian powerpc64le cross-compilation (out of tree)
and latest Fedora.

This 1) speedup builds 2) fixes often "No space left on device" on s390x.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 .travis.yml |  7 ++++---
 build.sh    | 32 +++++++++++++++++++++++---------
 2 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 3ef42f029..df233f43e 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -14,7 +14,7 @@ matrix:
 
         # cross compilation builds
         - os: linux
-          env: DISTRO=debian:stable VARIANT=cross-compile.ppc64le TREE=out
+          env: DISTRO=debian:stable VARIANT=cross-compile.ppc64le TREE=out MAKE_INSTALL=1
           compiler: powerpc64le-linux-gnu-gcc
 
         - os: linux
@@ -46,7 +46,7 @@ matrix:
 
         # other builds
         - os: linux
-          env: DISTRO=fedora:latest
+          env: DISTRO=fedora:latest MAKE_INSTALL=1
           compiler: clang
 
         - os: linux
@@ -99,6 +99,7 @@ before_install:
 script:
     - INSTALL="${DISTRO%%:*}"
     - INSTALL="${INSTALL%%/*}"
+    - if [ "$MAKE_INSTALL" = 1 ]; then INSTALL_OPT="-i"; fi
     - if [ ! "$TREE" ]; then TREE="in"; fi
     - case $VARIANT in cross-compile*) BUILD="cross";; i386) BUILD="32";; *) BUILD="native";; esac
-    - docker run -t ltp /bin/sh -c "cd travis && ./$INSTALL.sh && if [ \"$VARIANT\" ]; then ./$INSTALL.$VARIANT.sh; fi && ../build.sh -o $TREE -t $BUILD -c $CC"
+    - docker run -t ltp /bin/sh -c "cd travis && ./$INSTALL.sh && if [ \"$VARIANT\" ]; then ./$INSTALL.$VARIANT.sh; fi && ../build.sh -o $TREE -t $BUILD -c $CC $INSTALL_OPT"
diff --git a/build.sh b/build.sh
index c6d146335..e12a0b27d 100755
--- a/build.sh
+++ b/build.sh
@@ -46,20 +46,24 @@ build_cross()
 build()
 {
 	local tree="$1"
-	shift
+	local install="$2"
+	shift 2
 
 	echo "=== autotools ==="
 	make autotools
 
 	if [ "$tree" = "in" ]; then
-		build_in_tree $@
+		build_in_tree $install $@
 	else
-		build_out_tree $@
+		build_out_tree $install $@
 	fi
 }
 
 build_out_tree()
 {
+	local install="$1"
+	shift
+
 	local tree="$PWD"
 	local build="$tree/../ltp-build"
 	local make_opts="$MAKE_OPTS -C $build -f $tree/Makefile top_srcdir=$tree top_builddir=$build"
@@ -71,8 +75,12 @@ build_out_tree()
 	echo "=== build ==="
 	make $make_opts
 
-	echo "=== install ==="
-	make $make_opts DESTDIR="$PREFIX" SKIP_IDCHECK=1 install
+	if [ "$install" = 1 ]; then
+		echo "=== install ==="
+		make $make_opts DESTDIR="$PREFIX" SKIP_IDCHECK=1 install
+	else
+		echo "make install skipped, use -i to run it"
+	fi
 }
 
 build_in_tree()
@@ -82,8 +90,12 @@ build_in_tree()
 	echo "=== build ==="
 	make $MAKE_OPTS
 
-	echo "=== install ==="
-	make $MAKE_OPTS install
+	if [ "$install" = 1 ]; then
+		echo "=== install ==="
+		make $MAKE_OPTS install
+	else
+		echo "make install skipped, use -i to run it"
+	fi
 }
 
 run_configure()
@@ -139,11 +151,13 @@ EOF
 PREFIX="$DEFAULT_PREFIX"
 build="$DEFAULT_BUILD"
 tree="$DEFAULT_TREE"
+install=0
 
-while getopts "c:ho:p:t:" opt; do
+while getopts "c:hio:p:t:" opt; do
 	case "$opt" in
 	c) CC="$OPTARG";;
 	h) usage; exit 0;;
+	i) install=1;;
 	o) case "$OPTARG" in
 		in|out) tree="$OPTARG";;
 		*) echo "Wrong build tree '$OPTARG'" >&2; usage; exit 1;;
@@ -166,4 +180,4 @@ echo
 echo "=== compiler version ==="
 $CC --version
 
-eval build_$build $tree
+eval build_$build $tree $install
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
