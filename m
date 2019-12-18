Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 58ABE1241A4
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Dec 2019 09:28:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EA5B33C2374
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Dec 2019 09:28:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 0D2223C133E
 for <ltp@lists.linux.it>; Wed, 18 Dec 2019 09:28:41 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 6C62214012A9
 for <ltp@lists.linux.it>; Wed, 18 Dec 2019 09:28:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576657718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=je3+0M14UKwFwuMk1FdtFOCbvWFxe38lbVitILVqCxo=;
 b=ZLo7xgyle1WJ2siK7MYlfDgXDAKOSgaZg36SjI37myc8r5prRMc0A53hfB3jby//tFPEey
 tRlnSrZw/JzdPEa+7SvEY665sMNq6KHPB3LNmXoaRLb24c9/cLU0oENjoXku2hzVU1J4e0
 uKhQ0oqUaJ0uESIminVIchY1o7C5AbI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-2XCc6x0mPk2XiudeNZAdbg-1; Wed, 18 Dec 2019 03:28:35 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05B30DBA3;
 Wed, 18 Dec 2019 08:28:34 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB47B5C28D;
 Wed, 18 Dec 2019 08:28:32 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Wed, 18 Dec 2019 16:28:26 +0800
Message-Id: <20191218082826.25083-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 2XCc6x0mPk2XiudeNZAdbg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH RFC] sync_file_range02: remove the toplimit of write
 back
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

Test tries to sync a range of $BYTES bytes, and then makes sure that
between $BYTES and $BYTES+10% was written to disk. But sometimes, more
than $BYTES+10% hit the disk: "Synced 39843840, expected 33554432" so
it failed as below.

  tst_test.c:1179: INFO: Testing on ext4
  sync_file_range02.c:74: FAIL: Sync equals write: Synced 39843840,
                          expected 33554432
  sync_file_range02.c:74: FAIL: Sync inside of write: Synced 18612224,
                          expected 16777216

From FS dev's view:

" The test's assumptions are fundamentally false; it thinks it can look
at IO counters (tst_dev_bytes_written) for a disk before and after a
system call, and attribute all of the IO seen to the system call that
was made - this isn't necessarily correct. Other processes may generate
IO in the background.

ext4 defers a lot of IO on a freshly made filesystem to the kernel -
for example it will initialize the journal and inode tables after the
mount, and this will cause extra IO.

Creating ext4 filesystems with the options: "-E lazy_itable_init=0,
lazy_journal_init=0" might help.

Another option would be to raise the threshold. Essentially, the report
here is that the test is failing because the filesystem wrote "too much"
as a result of the sync. How much is "too much?" ..."

Let's remove the toplimit of write back, and think as long as we synced
at least the expected amount, the test passes. The +10% limit seems arbitrary.

Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Sumit Garg <sumit.garg@linaro.org>
---
 testcases/kernel/syscalls/sync_file_range/sync_file_range02.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
index eb08143c3..643be14fa 100644
--- a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
+++ b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
@@ -66,8 +66,7 @@ static void verify_sync_file_range(struct testcase *tc)
 
 	SAFE_CLOSE(fd);
 
-	if ((written >= tc->exp_sync_size) &&
-	    (written <= (tc->exp_sync_size + tc->exp_sync_size/10)))
+	if ((written >= tc->exp_sync_size))
 		tst_res(TPASS, "%s", tc->desc);
 	else
 		tst_res(TFAIL, "%s: Synced %li, expected %li", tc->desc,
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
