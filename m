Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C8A2CEEA3
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 14:09:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B21F03C4C12
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 14:09:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 545D73C2B6E
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 14:09:31 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CFAF4100044B
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 14:09:30 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 04030AC9A
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 13:09:30 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  4 Dec 2020 14:09:23 +0100
Message-Id: <20201204130923.14693-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] build.sh: PKG_CONFIG_LIBDIR auto-detection for
 x86_64
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

That allows not having to remove 64bit pkg-config
on distros which support both (or define PKG_CONFIG_LIBDIR itself).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Tested:
https://travis-ci.org/github/pevik/ltp/builds/747398921

Kind regards,
Petr

 build.sh | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/build.sh b/build.sh
index 45669bd91..452cc6f4c 100755
--- a/build.sh
+++ b/build.sh
@@ -22,7 +22,29 @@ MAKE_OPTS="-j$(getconf _NPROCESSORS_ONLN)"
 
 build_32()
 {
+	local dir
+	local arch="$(uname -m)"
+
 	echo "===== 32-bit ${1}-tree build into $PREFIX ====="
+
+	if [ -z "$PKG_CONFIG_LIBDIR" ]; then
+		if [ "$arch" != "x86_64" ]; then
+			echo "ERROR: auto-detection not supported platform $arch, export PKG_CONFIG_LIBDIR!"
+			exit 1
+		fi
+
+		for dir in /usr/lib/i386-linux-gnu/pkgconfig \
+			/usr/lib32/pkgconfig /usr/lib/pkgconfig; do
+			if [ -d "$dir" ]; then
+				PKG_CONFIG_LIBDIR="$dir"
+				break
+			fi
+		done
+		if [ -z "$PKG_CONFIG_LIBDIR" ]; then
+			echo "WARNING: PKG_CONFIG_LIBDIR not found, build might fail"
+		fi
+	fi
+
 	CFLAGS="-m32 $CFLAGS" LDFLAGS="-m32 $LDFLAGS"
 	build $1 $2
 }
@@ -108,8 +130,8 @@ run_configure()
 	local configure=$1
 	shift
 
-	export CC CFLAGS LDFLAGS
-	echo "CC='$CC' CFLAGS='$CFLAGS' LDFLAGS='$LDFLAGS'"
+	export CC CFLAGS LDFLAGS PKG_CONFIG_LIBDIR
+	echo "CC='$CC' CFLAGS='$CFLAGS' LDFLAGS='$LDFLAGS' PKG_CONFIG_LIBDIR='$PKG_CONFIG_LIBDIR'"
 
 	echo "=== configure $configure $@ ==="
 	if ! $configure $@; then
@@ -147,7 +169,7 @@ in       in-tree build
 out      out-of-tree build
 
 BUILD TYPES:
-32       32-bit build
+32       32-bit build (PKG_CONFIG_LIBDIR auto-detection for x86_64)
 cross    cross-compile build (requires set compiler via -c switch)
 native   native build
 EOF
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
