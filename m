Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF8A5F391
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 09:26:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EBF8B3C1DD2
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 09:26:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id CED8F3C0596
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 09:26:14 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5FDB61001541
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 09:26:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 230DB30BB559;
 Thu,  4 Jul 2019 07:26:07 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70927176AD;
 Thu,  4 Jul 2019 07:26:05 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Thu,  4 Jul 2019 09:26:02 +0200
Message-Id: <47b8b48060353711ff8d3695a7d3702f1aced12a.1562224996.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Thu, 04 Jul 2019 07:26:12 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] direct_io: diotest4: fix mips MAP_SHARED/MAP_FIXED
 mmap
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hongzhi reports that this test is failing on mips64 with 5.1+:
  diotest4 10 TBROK : diotest4.c:368: can't mmap file: Invalid argument
  diotest4 11 TBROK : diotest4.c:368: Remaining cases broken
I could reproduce it on emulated 5kc-malta, running 5.2.0-rc7.

Test is trying to map in area immediately following heap as MAP_SHARED,
but it's using wrong alignment, because MMAP_GRANULARITY is always
defined as single page - lapi/mmap.h is not including config.h.

Usage of MAP_FIXED in test seems unnecessary, so drop that too
and let the kernel pick an address.

Reported-by: Hongzhi.Song <hongzhi.song@windriver.com>
Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 include/lapi/mmap.h                      | 2 ++
 testcases/kernel/io/direct_io/diotest4.c | 8 ++------
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/include/lapi/mmap.h b/include/lapi/mmap.h
index 18547c0d47ed..98b6ade1e2ab 100644
--- a/include/lapi/mmap.h
+++ b/include/lapi/mmap.h
@@ -19,6 +19,8 @@
 #ifndef LAPI_MMAP_H__
 #define LAPI_MMAP_H__
 
+#include "config.h"
+
 #ifndef MAP_HUGETLB
 # define MAP_HUGETLB 0x40000
 #endif
diff --git a/testcases/kernel/io/direct_io/diotest4.c b/testcases/kernel/io/direct_io/diotest4.c
index e4616e400abd..bf200cd41a27 100644
--- a/testcases/kernel/io/direct_io/diotest4.c
+++ b/testcases/kernel/io/direct_io/diotest4.c
@@ -352,18 +352,14 @@ int main(int argc, char *argv[])
 	total++;
 
 	/* Test-10: read, write to a mmaped file */
-	shm_base = (char *)(((long)sbrk(0) + (shmsz - 1)) & ~(shmsz - 1));
-	if (shm_base == NULL) {
-		tst_brkm(TBROK, cleanup, "sbrk failed: %s", strerror(errno));
-	}
 	offset = 4096;
 	count = bufsize;
 	if ((fd = open(filename, O_DIRECT | O_RDWR)) < 0) {
 		tst_brkm(TBROK, cleanup, "can't open %s: %s",
 			 filename, strerror(errno));
 	}
-	shm_base = mmap(shm_base, 0x100000, PROT_READ | PROT_WRITE,
-			MAP_SHARED | MAP_FIXED, fd, 0);
+	shm_base = mmap(0, 0x100000, PROT_READ | PROT_WRITE,
+			MAP_SHARED, fd, 0);
 	if (shm_base == (caddr_t) - 1) {
 		tst_brkm(TBROK, cleanup, "can't mmap file: %s",
 			 strerror(errno));
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
