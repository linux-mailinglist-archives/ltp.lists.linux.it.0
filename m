Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C64E596FEA
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Aug 2022 15:38:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 233763C9BA4
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Aug 2022 15:38:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 501F13C9E39
 for <ltp@lists.linux.it>; Wed, 17 Aug 2022 15:38:26 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 5DA052009E2
 for <ltp@lists.linux.it>; Wed, 17 Aug 2022 15:38:25 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D30EE152B;
 Wed, 17 Aug 2022 06:38:24 -0700 (PDT)
Received: from e129169.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E8BE3F67D;
 Wed, 17 Aug 2022 06:38:23 -0700 (PDT)
From: Tudor Cretu <tudor.cretu@arm.com>
To: ltp@lists.linux.it
Date: Wed, 17 Aug 2022 14:39:29 +0100
Message-Id: <20220817133929.234873-3-tudor.cretu@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220817133929.234873-1-tudor.cretu@arm.com>
References: <20220817133929.234873-1-tudor.cretu@arm.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] build.sh: Allow specifying additional make options
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

This enables build.sh to use make options such as TST_NEWER_64_SYSCALL or
TST_COMPAT_16_SYSCALL, e.g.:

MAKE_OPTS="TST_NEWER_64_SYSCALL=no TST_COMPAT_16_SYSCALL=no" ./build.sh ...

Signed-off-by: Tudor Cretu <tudor.cretu@arm.com>
---
 build.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/build.sh b/build.sh
index 1767cc21b..42c89ad97 100755
--- a/build.sh
+++ b/build.sh
@@ -18,7 +18,7 @@ CONFIGURE_OPTS_OUT_TREE="--with-realtime-testsuite $CONFIGURE_OPT_EXTRA"
 SRC_DIR="$(cd $(dirname $0); pwd)"
 BUILD_DIR="$SRC_DIR/../ltp-build"
 
-MAKE_OPTS="-j$(getconf _NPROCESSORS_ONLN)"
+MAKE_OPTS="-j$(getconf _NPROCESSORS_ONLN) $MAKE_OPTS"
 MAKE_OPTS_OUT_TREE="$MAKE_OPTS -C $BUILD_DIR -f $SRC_DIR/Makefile top_srcdir=$SRC_DIR top_builddir=$BUILD_DIR"
 
 run_configure()
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
