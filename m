Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1288B8373B
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Aug 2019 18:45:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D2A7E3C1CDE
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Aug 2019 18:45:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 3AAE33C18F7
 for <ltp@lists.linux.it>; Tue,  6 Aug 2019 18:45:35 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id F28F61A0015C
 for <ltp@lists.linux.it>; Tue,  6 Aug 2019 18:45:33 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3B16EAD12;
 Tue,  6 Aug 2019 16:45:33 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  6 Aug 2019 18:45:23 +0200
Message-Id: <20190806164523.557-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3 4/4] build: Move
 -Werror-implicit-function-declaration from make to build.sh
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

Previously it was passed only to Android build. Generally Werror flags
should be on for development but disabled for releases and production.
We don't have any configure flag stating development build, so using it
in build.sh should be sufficient as it can be used in both Travis CI
builds and local development.

+ respect CC variable in build.sh (for these lazy to pass it via -c flag)

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Change v2->v3:
* move flag to build.sh, so it can be reused for local development
* respect CC

 build.sh               | 4 +++-
 include/mk/env_post.mk | 4 ----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/build.sh b/build.sh
index 3da2adf55..78845bf95 100755
--- a/build.sh
+++ b/build.sh
@@ -9,6 +9,9 @@
 
 set -e
 
+CFLAGS="${CFLAGS:--Werror-implicit-function-declaration}"
+CC="${CC:-gcc}"
+
 DEFAULT_PREFIX="$HOME/ltp-install"
 DEFAULT_BUILD="native"
 DEFAULT_TREE="in"
@@ -16,7 +19,6 @@ CONFIGURE_OPTS_IN_TREE="--with-open-posix-testsuite --with-realtime-testsuite"
 # TODO: open posix testsuite is currently broken in out-tree-build. Enable it once it's fixed.
 CONFIGURE_OPTS_OUT_TREE="--with-realtime-testsuite"
 MAKE_OPTS="-j$(getconf _NPROCESSORS_ONLN)"
-CC=gcc
 
 build_32()
 {
diff --git a/include/mk/env_post.mk b/include/mk/env_post.mk
index 913bdf5d1..f4169ad66 100644
--- a/include/mk/env_post.mk
+++ b/include/mk/env_post.mk
@@ -42,10 +42,6 @@ CPPFLAGS			+= -D__UCLIBC__ -DUCLINUX
 endif
 
 ifeq ($(ANDROID),1)
-# There are many undeclared functions, it's best not to accidentally overlook
-# them.
-CFLAGS				+= -Werror-implicit-function-declaration
-
 LDFLAGS				+= -L$(top_builddir)/lib/android_libpthread
 LDFLAGS				+= -L$(top_builddir)/lib/android_librt
 endif
-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
