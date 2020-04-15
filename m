Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 826341A9C3C
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 13:27:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0C7743C2B26
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 13:27:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id A6CBD3C2B04
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 13:26:44 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 21C50600D78
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 13:26:44 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 17794AE7B;
 Wed, 15 Apr 2020 11:26:43 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 15 Apr 2020 13:26:34 +0200
Message-Id: <20200415112635.14144-9-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200415112635.14144-1-pvorel@suse.cz>
References: <20200415112635.14144-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 8/9] realtime: Fix linking error with -fno-common
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

by declaring iters_per_us as static and moving from header into
C source.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/realtime/include/librttest.h | 1 -
 testcases/realtime/lib/librttest.c     | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/realtime/include/librttest.h b/testcases/realtime/include/librttest.h
index c18236200..b829f4089 100644
--- a/testcases/realtime/include/librttest.h
+++ b/testcases/realtime/include/librttest.h
@@ -66,7 +66,6 @@ extern char *optarg;
 
 #define _MAXTHREADS 256
 #define CALIBRATE_LOOPS 100000
-unsigned long iters_per_us;
 
 #define NS_PER_MS 1000000
 #define NS_PER_US 1000
diff --git a/testcases/realtime/lib/librttest.c b/testcases/realtime/lib/librttest.c
index 36790581e..722d99d50 100644
--- a/testcases/realtime/lib/librttest.c
+++ b/testcases/realtime/lib/librttest.c
@@ -63,6 +63,7 @@
 
 static LIST_HEAD(_threads);
 static atomic_t _thread_count = { -1 };
+static unsigned long iters_per_us;
 
 pthread_mutex_t _buffer_mutex;
 char *_print_buffer = NULL;
-- 
2.26.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
