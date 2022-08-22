Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 492CA59BEA7
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Aug 2022 13:38:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 01A6E3CA33A
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Aug 2022 13:38:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B83843C9A44
 for <ltp@lists.linux.it>; Mon, 22 Aug 2022 13:38:40 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id EE2586007A5
 for <ltp@lists.linux.it>; Mon, 22 Aug 2022 13:38:39 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 043F413D5;
 Mon, 22 Aug 2022 04:38:42 -0700 (PDT)
Received: from e129169.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 319913F718;
 Mon, 22 Aug 2022 04:38:38 -0700 (PDT)
From: Tudor Cretu <tudor.cretu@arm.com>
To: ltp@lists.linux.it
Date: Mon, 22 Aug 2022 12:39:16 +0100
Message-Id: <20220822113919.196953-2-tudor.cretu@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822113919.196953-1-tudor.cretu@arm.com>
References: <20220822113919.196953-1-tudor.cretu@arm.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/4] lib: Fix initialization of recursive mutex
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

For any libc that doesn't define PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP
(e.g. Musl [1]), don't assume that the type of the mutex is the first
member. Use a runtime initializer instead.

[1] https://www.openwall.com/lists/musl/2017/02/20/5

Signed-off-by: Tudor Cretu <tudor.cretu@arm.com>
---
 lib/tst_res.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/lib/tst_res.c b/lib/tst_res.c
index 8d86b48a4..e0896eb05 100644
--- a/lib/tst_res.c
+++ b/lib/tst_res.c
@@ -82,17 +82,26 @@ void *TST_RET_PTR;
 	assert(strlen(buf) > 0);		\
 } while (0)
 
-#ifndef PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP
-# ifdef __ANDROID__
-#  define PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP \
-	PTHREAD_RECURSIVE_MUTEX_INITIALIZER
-# else
-/* MUSL: http://www.openwall.com/lists/musl/2017/02/20/5 */
-#  define PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP  { {PTHREAD_MUTEX_RECURSIVE} }
-# endif
+#if !defined(PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP) && defined(__ANDROID__)
+#define PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP PTHREAD_RECURSIVE_MUTEX_INITIALIZER
 #endif
 
+#ifdef PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP
 static pthread_mutex_t tmutex = PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP;
+#else
+static pthread_mutex_t tmutex;
+
+__attribute__((constructor))
+static void init_tmutex(void)
+{
+	pthread_mutexattr_t mutattr = {0};
+
+	pthread_mutexattr_init(&mutattr);
+	pthread_mutexattr_settype(&mutattr, PTHREAD_MUTEX_RECURSIVE);
+	pthread_mutex_init(&tmutex, &mutattr);
+	pthread_mutexattr_destroy(&mutattr);
+}
+#endif
 
 static void check_env(void);
 static void tst_condense(int tnum, int ttype, const char *tmesg);
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
