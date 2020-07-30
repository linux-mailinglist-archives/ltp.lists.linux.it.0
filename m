Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF74232A4A
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 05:16:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 74D813C268D
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 05:16:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id D45043C0515
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 05:15:55 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 3F9AB1000B63
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 05:15:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596078952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jNH/ApIsedOwT4mVK+Cp0oieJiXrvR58bwSFIERgdGU=;
 b=fRv5uA+BJJDwoIw2cT/ZdQsWYMjuKKIK9ffIaUpSxfEhCerzLUzr/qIZnau69JnXWxjtWk
 DB8Ap8AuM+WMfgUGLGEM/8luqOYAXYPANWmGTBLRpJNR7OaI5h5Q3XtzLEFcs7pgFz7jOa
 76vUUWv0t5anEuYiBjXynC6BxD5QBGc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-XaPpO7TCMaibomFWy-90Xw-1; Wed, 29 Jul 2020 23:15:50 -0400
X-MC-Unique: XaPpO7TCMaibomFWy-90Xw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6705D801504
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 03:15:49 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 972BF5D992
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 03:15:48 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Thu, 30 Jul 2020 11:15:47 +0800
Message-Id: <20200730031547.24630-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH COMMITTED] futex: take use of the .request_hugepages
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

To get rid of warnings when hugetlbfs is not supported.

  futex_wake04.c:65: CONF: Huge page is not supported.
  safe_file_ops.c:299: WARN: Failed to close FILE '/proc/sys/vm/nr_hugepages' at futex_wake04.c:76: EOPNOTSUPP (95)

Signed-off-by: Li Wang <liwang@redhat.com>
---
 .../kernel/syscalls/futex/futex_wake04.c      | 21 ++++---------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/testcases/kernel/syscalls/futex/futex_wake04.c b/testcases/kernel/syscalls/futex/futex_wake04.c
index 8fae7ced9..f6f571ac4 100644
--- a/testcases/kernel/syscalls/futex/futex_wake04.c
+++ b/testcases/kernel/syscalls/futex/futex_wake04.c
@@ -36,8 +36,6 @@ static futex_t *futex1, *futex2;
 
 static struct tst_ts to;
 
-static long orig_hugepages;
-
 static struct test_variants {
 	enum futex_fn_type fntype;
 	enum tst_ts_type tstype;
@@ -54,26 +52,15 @@ static struct test_variants {
 
 static void setup(void)
 {
+	if (tst_hugepages == 0)
+		tst_brk(TCONF, "No enough hugepages for testing.");
+
 	struct test_variants *tv = &variants[tst_variant];
 
 	tst_res(TINFO, "Testing variant: %s", tv->desc);
 	futex_supported_by_kernel(tv->fntype);
 
 	to = tst_ts_from_ns(tv->tstype, 30 * NSEC_PER_SEC);
-
-	if (access(PATH_HUGEPAGES, F_OK))
-		tst_brk(TCONF, "Huge page is not supported.");
-
-	SAFE_FILE_SCANF(PATH_NR_HPAGES, "%ld", &orig_hugepages);
-
-	if (orig_hugepages <= 0)
-		SAFE_FILE_PRINTF(PATH_NR_HPAGES, "%d", 1);
-}
-
-static void cleanup(void)
-{
-	if (orig_hugepages <= 0)
-		SAFE_FILE_PRINTF(PATH_NR_HPAGES, "%ld", orig_hugepages);
 }
 
 static void *wait_thread1(void *arg LTP_ATTRIBUTE_UNUSED)
@@ -147,10 +134,10 @@ static void wakeup_thread2(void)
 
 static struct tst_test test = {
 	.setup = setup,
-	.cleanup = cleanup,
 	.test_all = wakeup_thread2,
 	.test_variants = ARRAY_SIZE(variants),
 	.needs_root = 1,
 	.min_kver = "2.6.32",
 	.needs_tmpdir = 1,
+	.request_hugepages = 1,
 };
-- 
2.21.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
