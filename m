Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B5F3965EE
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 18:51:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 762843C90C8
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 18:51:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D7DFE3C805F
 for <ltp@lists.linux.it>; Mon, 31 May 2021 18:51:00 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 37AF9600648
 for <ltp@lists.linux.it>; Mon, 31 May 2021 18:50:59 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 946A41FD2D;
 Mon, 31 May 2021 16:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622479859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=obW5USZnjPKEwMTjulgG1pEwmyuxnrs5q8oqP1/uuY4=;
 b=jgzJpVw5m2qZ1SLnBKLk2oV1ILTb5eHEooC7ZzhkDfxcMfyFuL9zdPi9w+wCtO9Q0vNOHY
 zrJaegqMxF2Kk6ZLv2MtBdhBeqj+oPusamXwk4BfO6AcRXZ74HdzZzECfB7a6dNZ6Qd5DE
 fl2oF9rQQYRRy9EkSFkIzvMm2xxSauY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622479859;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=obW5USZnjPKEwMTjulgG1pEwmyuxnrs5q8oqP1/uuY4=;
 b=y3+GgkFubuXw7WuEe2Z0W5GFblW7uP6Yg9eXMdbdcjpeN7vrlKlvkDXl0ShXaC2c9Ongjg
 wTBi+NCN9Xft0/Dg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id ED73111A98;
 Mon, 31 May 2021 16:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622479859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=obW5USZnjPKEwMTjulgG1pEwmyuxnrs5q8oqP1/uuY4=;
 b=jgzJpVw5m2qZ1SLnBKLk2oV1ILTb5eHEooC7ZzhkDfxcMfyFuL9zdPi9w+wCtO9Q0vNOHY
 zrJaegqMxF2Kk6ZLv2MtBdhBeqj+oPusamXwk4BfO6AcRXZ74HdzZzECfB7a6dNZ6Qd5DE
 fl2oF9rQQYRRy9EkSFkIzvMm2xxSauY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622479859;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=obW5USZnjPKEwMTjulgG1pEwmyuxnrs5q8oqP1/uuY4=;
 b=y3+GgkFubuXw7WuEe2Z0W5GFblW7uP6Yg9eXMdbdcjpeN7vrlKlvkDXl0ShXaC2c9Ongjg
 wTBi+NCN9Xft0/Dg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id MKLbOPITtWBISQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 31 May 2021 16:50:58 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 31 May 2021 18:50:50 +0200
Message-Id: <20210531165052.8731-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210531165052.8731-1-pvorel@suse.cz>
References: <20210531165052.8731-1-pvorel@suse.cz>
MIME-Version: 1.0
Authentication-Results: imap.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.00
X-Spamd-Result: default: False [0.00 / 100.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 REPLY(-4.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; RCPT_COUNT_SEVEN(0.00)[7];
 MID_CONTAINS_FROM(1.00)[]; RCVD_NO_TLS_LAST(0.10)[];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_COUNT_TWO(0.00)[2]
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] build.sh: Rewrite to allow running certain step
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
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

i.e. only autotools / configure / make / make install

Required for GitHub Actions CI.

+ add missing -i in docs.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 build.sh | 195 +++++++++++++++++++++++++++++++------------------------
 1 file changed, 110 insertions(+), 85 deletions(-)

diff --git a/build.sh b/build.sh
index 9335595ca..b3b1eb962 100755
--- a/build.sh
+++ b/build.sh
@@ -15,17 +15,56 @@ CC="${CC:-gcc}"
 DEFAULT_PREFIX="$HOME/ltp-install"
 DEFAULT_BUILD="native"
 DEFAULT_TREE="in"
+
 CONFIGURE_OPTS_IN_TREE="--with-open-posix-testsuite --with-realtime-testsuite $CONFIGURE_OPT_EXTRA"
 # TODO: open posix testsuite is currently broken in out-tree-build. Enable it once it's fixed.
 CONFIGURE_OPTS_OUT_TREE="--with-realtime-testsuite $CONFIGURE_OPT_EXTRA"
+
+SRC_DIR="$(cd $(dirname $0); pwd)"
+BUILD_DIR="$SRC_DIR/../ltp-build"
+
 MAKE_OPTS="-j$(getconf _NPROCESSORS_ONLN)"
+MAKE_OPTS_OUT_TREE="$MAKE_OPTS -C $BUILD_DIR -f $SRC_DIR/Makefile top_srcdir=$SRC_DIR top_builddir=$BUILD_DIR"
 
-build_32()
+run_configure()
 {
-	local dir
+	local configure="$1"
+	shift
+
+	export CC CFLAGS LDFLAGS PKG_CONFIG_LIBDIR
+	echo "CC='$CC' CFLAGS='$CFLAGS' LDFLAGS='$LDFLAGS' PKG_CONFIG_LIBDIR='$PKG_CONFIG_LIBDIR'"
+
+	echo "=== configure $configure $@ ==="
+	if ! $configure $@; then
+		echo "== ERROR: configure failed, config.log =="
+		cat config.log
+		exit 1
+	fi
+
+	echo "== include/config.h =="
+	cat include/config.h
+}
+
+configure_in_tree()
+{
+	run_configure ./configure $CONFIGURE_OPTS_IN_TREE --prefix=$prefix $@
+}
+
+configure_out_tree()
+{
+	mkdir -p $BUILD_DIR
+	cd $BUILD_DIR
+	run_configure $SRC_DIR/configure $CONFIGURE_OPTS_OUT_TREE $@
+}
+
+configure_32()
+{
+	local tree="$1"
+	local prefix="$2"
 	local arch="$(uname -m)"
+	local dir
 
-	echo "===== 32-bit ${1}-tree build into $PREFIX ====="
+	echo "===== 32-bit ${tree}-tree build into $prefix ====="
 
 	if [ -z "$PKG_CONFIG_LIBDIR" ]; then
 		if [ "$arch" != "x86_64" ]; then
@@ -46,114 +85,67 @@ build_32()
 	fi
 
 	CFLAGS="-m32 $CFLAGS" LDFLAGS="-m32 $LDFLAGS"
-	build $1 $2
+
+	eval configure_${tree}_tree
 }
 
-build_native()
+configure_native()
 {
-	echo "===== native ${1}-tree build into $PREFIX ====="
-	build $1 $2
+	local tree="$1"
+	local prefix="$2"
+
+	echo "===== native ${tree}-tree build into $prefix ====="
+	eval configure_${tree}_tree
 }
 
-build_cross()
+configure_cross()
 {
+	local tree="$1"
+	local prefix="$2"
 	local host=$(basename "${CC%-gcc}")
+
 	if [ "$host" = "gcc" ]; then
 		echo "Invalid CC variable for cross compilation: $CC (clang not supported)" >&2
 		exit 1
 	fi
 
-	echo "===== cross-compile ${host} ${1}-tree build into $PREFIX ====="
-	build $1 $2 "--host=$host"
+	echo "===== cross-compile ${host} ${1}-tree build into $prefix ====="
+	eval configure_${tree}_tree "--host=$host"
 }
 
-build()
+build_in_tree()
 {
-	local tree="$1"
-	local install="$2"
-	shift 2
-
-	echo "=== autotools ==="
-	make autotools
-
-	if [ "$tree" = "in" ]; then
-		build_in_tree $install $@
-	else
-		build_out_tree $install $@
-	fi
+	make $MAKE_OPTS
 }
 
 build_out_tree()
 {
-	local install="$1"
-	shift
-
-	local tree="$PWD"
-	local build="$tree/../ltp-build"
-	local make_opts="$MAKE_OPTS -C $build -f $tree/Makefile top_srcdir=$tree top_builddir=$build"
-
-	mkdir -p $build
-	cd $build
-	run_configure $tree/configure $CONFIGURE_OPTS_OUT_TREE $@
-
-	echo "=== build ==="
-	make $make_opts
-
-	if [ "$install" = 1 ]; then
-		echo "=== install ==="
-		make $make_opts DESTDIR="$PREFIX" SKIP_IDCHECK=1 install
-	else
-		echo "make install skipped, use -i to run it"
-	fi
+	cd $BUILD_DIR
+	make $MAKE_OPTS_OUT_TREE
 }
 
-build_in_tree()
+install_in_tree()
 {
-	local install="$1"
-	shift
-
-	run_configure ./configure $CONFIGURE_OPTS_IN_TREE --prefix=$PREFIX $@
-
-	echo "=== build ==="
-	make $MAKE_OPTS
-
-	if [ "$install" = 1 ]; then
-		echo "=== install ==="
-		make $MAKE_OPTS install
-	else
-		echo "make install skipped, use -i to run it"
-	fi
+	make $MAKE_OPTS install
 }
 
-run_configure()
+install_out_tree()
 {
-	local configure=$1
-	shift
-
-	export CC CFLAGS LDFLAGS PKG_CONFIG_LIBDIR
-	echo "CC='$CC' CFLAGS='$CFLAGS' LDFLAGS='$LDFLAGS' PKG_CONFIG_LIBDIR='$PKG_CONFIG_LIBDIR'"
-
-	echo "=== configure $configure $@ ==="
-	if ! $configure $@; then
-		echo "== ERROR: configure failed, config.log =="
-		cat config.log
-		exit 1
-	fi
-
-	echo "== include/config.h =="
-	cat include/config.h
+	cd $BUILD_DIR
+	make $MAKE_OPTS_OUT_TREE DESTDIR="$prefix" SKIP_IDCHECK=1 install
 }
 
 usage()
 {
 	cat << EOF
 Usage:
-$0 [ -c CC ] [ -o TREE ] [ -p DIR ] [ -t TYPE ]
+$0 [ -c CC ] [ -i ] [ -o TREE ] [ -p DIR ] [-r RUN ] [ -t TYPE ]
 $0 -h
 
 Options:
 -h       Print this help
--c CC    Define compiler (\$CC variable)
+-c CC    Define compiler (\$CC variable), needed only for configure step
+-i       Run 'make install', needed only for install step
 -o TREE  Specify build tree, default: $DEFAULT_TREE
 -p DIR   Change installation directory. For in-tree build is this value passed
          to --prefix option of configure script. For out-of-tree build is this
@@ -162,17 +154,24 @@ Options:
          DIR/PREFIX (i.e. DIR/opt/ltp).
          Default for in-tree build: '$DEFAULT_PREFIX'
          Default for out-of-tree build: '$DEFAULT_PREFIX/opt/ltp'
--t TYPE  Specify build type, default: $DEFAULT_BUILD
+-r RUN   Run only certain step (usable for CI), default: all
+-t TYPE  Specify build type, default: $DEFAULT_BUILD, only for configure step
 
-BUILD TREE:
+TREE:
 in       in-tree build
 out      out-of-tree build
 
-BUILD TYPES:
+TYPES:
 32       32-bit build (PKG_CONFIG_LIBDIR auto-detection for x86_64)
 cross    cross-compile build (requires set compiler via -c switch)
 native   native build
 
+RUN:
+autotools   run only 'make autotools'
+configure   run only 'configure'
+build       run only 'make'
+install     run only 'make install'
+
 Default configure options:
 in-tree:    $CONFIGURE_OPTS_IN_TREE
 out-of-tree $CONFIGURE_OPTS_OUT_TREE
@@ -181,12 +180,13 @@ configure options can extend the default with \$CONFIGURE_OPT_EXTRA environment
 EOF
 }
 
-PREFIX="$DEFAULT_PREFIX"
+prefix="$DEFAULT_PREFIX"
 build="$DEFAULT_BUILD"
 tree="$DEFAULT_TREE"
-install=0
+install=
+run=
 
-while getopts "c:hio:p:t:" opt; do
+while getopts "c:hio:p:r:t:" opt; do
 	case "$opt" in
 	c) CC="$OPTARG";;
 	h) usage; exit 0;;
@@ -195,7 +195,11 @@ while getopts "c:hio:p:t:" opt; do
 		in|out) tree="$OPTARG";;
 		*) echo "Wrong build tree '$OPTARG'" >&2; usage; exit 1;;
 		esac;;
-	p) PREFIX="$OPTARG";;
+	p) prefix="$OPTARG";;
+	r) case "$OPTARG" in
+		autotools|configure|build|install) run="$OPTARG";;
+		*) echo "Wrong run type '$OPTARG'" >&2; usage; exit 1;;
+		esac;;
 	t) case "$OPTARG" in
 		32|cross|native) build="$OPTARG";;
 		*) echo "Wrong build type '$OPTARG'" >&2; usage; exit 1;;
@@ -204,7 +208,7 @@ while getopts "c:hio:p:t:" opt; do
 	esac
 done
 
-cd `dirname $0`
+cd $SRC_DIR
 
 echo "=== ver_linux ==="
 ./ver_linux
@@ -213,4 +217,25 @@ echo
 echo "=== compiler version ==="
 $CC --version
 
-eval build_$build $tree $install
+if [ -z "$run" -o "$run" = "autotools" ]; then
+	make autotools
+fi
+
+if [ -z "$run" -o "$run" = "configure" ]; then
+	eval configure_$build $tree $prefix
+fi
+
+if [ -z "$run" -o "$run" = "build" ]; then
+	echo "=== build ==="
+	eval build_${tree}_tree
+fi
+
+if [ -z "$run" -o "$run" = "install" ]; then
+	if [ "$install" = 1 ]; then
+		eval install_${tree}_tree
+	else
+		echo "make install skipped, use -i to run it"
+	fi
+fi
+
+exit $?
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
