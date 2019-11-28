Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2751010C347
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 05:55:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A7FC53C2354
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 05:55:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 460A53C13DC
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 05:55:39 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 25DED1A01018
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 05:55:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574916935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CPa/w4AloAbTRoTN5JnuJsaSTvIwo3EBF9T8Sj4Cics=;
 b=K5YfFya+HK5rqojlMJMtRcADcfJZs7hiYhGZGH8AtxN5X5v1sDtrQe2Mh/HnuCMx6QeRPL
 35F4e6feN5mgIzushgM8KqvhGFxVU6PFQ2GACW+KP6qsEi4UmXDT6dloKWb3CBfeypQC+9
 28HVS99WZUTZBvC0Q64GD7HZGZtSiDE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-vOh_tG-INpq67JtnILB_4A-1; Wed, 27 Nov 2019 23:55:34 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8B15107ACC4
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 04:55:32 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DDA6600C8;
 Thu, 28 Nov 2019 04:55:28 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Thu, 28 Nov 2019 12:55:25 +0800
Message-Id: <20191128045525.15454-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: vOh_tG-INpq67JtnILB_4A-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] mtest01: correct the ALLOC_THRESHOLD definition on
 s390x
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

mtest01 hits a problem on s390x platform. The situation is that if children's
memory allocating is ongoing and the test remaining time is in an emergency, the
parent will break from the while loop and try to revoke children, obviously, it
doesn't have enough time to wait for the children's status change to 'T'. Then it
occurs timeout issue as below:

  mtest01.c:134: INFO: Filling up 80% of free ram which is 5868864 kbytes
  mtest01.c:149: INFO: ... child 38289 starting
  mtest01.c:149: INFO: ... child 38288 starting
  mtest01.c:208: WARN: the remaininig time is not enough for testing
  mtest01.c:218: FAIL: kbytes allocated (and written to) less than expected 5868864
  Test timeouted, sending SIGKILL!

The immediate cause is the memory allocating is too slow to finish fleetly on such
a small virtual s390x machine, because ALLOC_THRESHOLD does not take real effort.
Here let's correct the allocating threshold definition to make sure each child
allocates less memory.

And, another fix for the fail handling. In case children are still on memory
allocating, the remaining 15 seconds is not enough to wait for process status
change. We kill them directly to avoid test timeout occurring.

Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Rachel Sibley <rasibley@redhat.com>
---
 testcases/kernel/mem/mtest01/mtest01.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/mem/mtest01/mtest01.c b/testcases/kernel/mem/mtest01/mtest01.c
index 960a2cef8..446d26897 100644
--- a/testcases/kernel/mem/mtest01/mtest01.c
+++ b/testcases/kernel/mem/mtest01/mtest01.c
@@ -33,7 +33,7 @@
 
 #define FIVE_HUNDRED_MB         (500ULL*1024*1024)
 
-#if defined(_s390_)
+#if defined(__s390__) || defined(__s390x__)
 #define ALLOC_THRESHOLD		FIVE_HUNDRED_MB
 #elif defined(TST_ABI32)
 #define ALLOC_THRESHOLD		(2*FIVE_HUNDRED_MB)
@@ -216,11 +216,16 @@ static void mem_test(void)
 	if (children_done < pid_cntr) {
 		tst_res(TFAIL, "kbytes allocated %sless than expected %llu",
 				write_msg, alloc_maxbytes / 1024);
-	} else {
-		tst_res(TPASS, "%llu kbytes allocated %s",
-				alloc_maxbytes / 1024, write_msg);
+
+		for (i = 0; i < pid_cntr; i++)
+			kill(pid_list[i], SIGKILL);
+
+		return;
 	}
 
+	tst_res(TPASS, "%llu kbytes allocated %s",
+			alloc_maxbytes / 1024, write_msg);
+
 	for (i = 0; i < pid_cntr; i++) {
 		TST_PROCESS_STATE_WAIT(pid_list[i], 'T');
 		kill(pid_list[i], SIGCONT);
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
