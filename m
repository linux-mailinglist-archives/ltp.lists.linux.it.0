Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFD0B2193
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Sep 2019 16:05:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CE4283C2077
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Sep 2019 16:05:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 5D2A83C0030
 for <ltp@lists.linux.it>; Fri, 13 Sep 2019 16:05:45 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8FBBC100049E
 for <ltp@lists.linux.it>; Fri, 13 Sep 2019 16:05:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3E9C4AF5C;
 Fri, 13 Sep 2019 14:05:44 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 13 Sep 2019 16:05:41 +0200
Message-Id: <20190913140541.2753-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] syscalls/madvise09: Workaround failures
 on newer kernels
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

This is a short term workaround that bumps the number of allocated pages
to 128 because which is needed since kernel commit:

1a61ab (mm: memcontrol: replace zone summing with lruvec_page_state())

After a discussion with kernel developers we concluded that in order to
avoid depending on kernel internal implementation details we have to
allocate a dozen of megabytes instead, but that would require a more
complex changes to the test. As we are getting close to a LTP release we
decided to put this workaround in first, then we can rewrite the test
after the release.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Shuang Qiu <shuang.qiu@oracle.com>
Acked-by: Li Wang <liwang@redhat.com>
---
 testcases/kernel/syscalls/madvise/madvise09.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/madvise/madvise09.c b/testcases/kernel/syscalls/madvise/madvise09.c
index 01075f641..cd556920c 100644
--- a/testcases/kernel/syscalls/madvise/madvise09.c
+++ b/testcases/kernel/syscalls/madvise/madvise09.c
@@ -57,7 +57,7 @@ static int sleep_between_faults;
 
 static int swap_accounting_enabled;
 
-#define PAGES 32
+#define PAGES 128
 #define TOUCHED_PAGE1 0
 #define TOUCHED_PAGE2 10
 
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
