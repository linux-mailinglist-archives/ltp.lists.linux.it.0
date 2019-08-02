Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB597FCF7
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 17:05:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7EC6E3C2070
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 17:05:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 418A53C2025
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 17:04:54 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7C5001401837
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 17:04:54 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 29D43B607;
 Fri,  2 Aug 2019 15:04:54 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  2 Aug 2019 17:04:45 +0200
Message-Id: <20190802150445.10984-5-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802150445.10984-1-pvorel@suse.cz>
References: <20190802150445.10984-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 4/4] make,
 travis: Remove -Werror-implicit-function-declaration
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

and add it to Travis CI builds.

Previously it was passed only to Android build. Generally Werror flags
should be on for development but disabled for releases and production.
We don't have any configure flag stating development build, so using it
only in Travis CI should be sufficient (although we lost lost this check
for Android as we don't test it in our Travis CI setup).

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Travis build: https://travis-ci.org/pevik/ltp/builds/566982062

 .travis.yml            | 3 ++-
 include/mk/env_post.mk | 4 ----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index a29551650..dcb5affb5 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -79,5 +79,6 @@ script:
     - INSTALL="${DISTRO%%:*}"
     - INSTALL="${INSTALL%%/*}"
     - if [ ! "$TREE" ]; then TREE="in"; fi
+    - CFLAGS="-Werror-implicit-function-declaration"
     - case $VARIANT in cross-compile*) BUILD="cross";; i386) BUILD="32";; *) BUILD="native";; esac
-    - docker run -it ltp /bin/sh -c "cd travis && ./$INSTALL.sh && if [ \"$VARIANT\" ]; then ./$INSTALL.$VARIANT.sh; fi && ../build.sh -o $TREE -t $BUILD -c $CC"
+    - docker run -it ltp /bin/sh -c "cd travis && ./$INSTALL.sh && if [ \"$VARIANT\" ]; then ./$INSTALL.$VARIANT.sh; fi && CFLAGS='$CFLAGS' ../build.sh -o $TREE -t $BUILD -c $CC"
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
