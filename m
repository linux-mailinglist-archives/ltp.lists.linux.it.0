Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FC512E18C
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jan 2020 02:52:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C004F3C23D2
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jan 2020 02:52:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 8A9413C23B2
 for <ltp@lists.linux.it>; Thu,  2 Jan 2020 02:52:48 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id C6BA6200058
 for <ltp@lists.linux.it>; Thu,  2 Jan 2020 02:52:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577929966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TJE2mjbiCgkXD5LrQ1St4lwAlp1yULAwSFqrXpPtjU4=;
 b=APzW4iPVIwc3Om5LvFaS5LpWCag+gvdpFrPUBI1bpzHOIW4cNH3wIPIeHAwY1neUViPE7w
 LR1ecGhYuOe8C+oCjXzHZYRr9HSNPY/G+Y5aCOGUoXUBTUCCVevznGYCUh0FXXyJsPxSTg
 Qy4f4o6Fytond9bW9iSNgHRbm6VbHWE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-7hjMjtJhP1GIJnn9o3_6nQ-1; Wed, 01 Jan 2020 20:52:44 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E4CADB60;
 Thu,  2 Jan 2020 01:52:43 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2FA119C5B;
 Thu,  2 Jan 2020 01:52:41 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Thu,  2 Jan 2020 09:52:36 +0800
Message-Id: <20200102015236.7400-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 7hjMjtJhP1GIJnn9o3_6nQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH COMMITTED] tst_device: do sync() before reading test
 block device stat file
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

To avoid FS deferred IO metadata/cache interferes test result, so we
do sync simply before the tst_dev_bytes_written invocation.

Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Sumit Garg <sumit.garg@linaro.org>
Cc: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/fdatasync/fdatasync03.c | 2 ++
 testcases/kernel/syscalls/fsync/fsync04.c         | 2 ++
 testcases/kernel/syscalls/sync/sync03.c           | 2 ++
 testcases/kernel/syscalls/syncfs/syncfs01.c       | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/testcases/kernel/syscalls/fdatasync/fdatasync03.c b/testcases/kernel/syscalls/fdatasync/fdatasync03.c
index ee50e75c9..032ac4b58 100644
--- a/testcases/kernel/syscalls/fdatasync/fdatasync03.c
+++ b/testcases/kernel/syscalls/fdatasync/fdatasync03.c
@@ -32,6 +32,8 @@ static void verify_fdatasync(void)
 
 	fd = SAFE_OPEN(FNAME, O_RDWR|O_CREAT, MODE);
 
+	sync();
+
 	tst_dev_bytes_written(tst_device->dev);
 
 	tst_fill_fd(fd, 0, TST_MB, FILE_SIZE_MB);
diff --git a/testcases/kernel/syscalls/fsync/fsync04.c b/testcases/kernel/syscalls/fsync/fsync04.c
index c67fc5692..3c1f45e94 100644
--- a/testcases/kernel/syscalls/fsync/fsync04.c
+++ b/testcases/kernel/syscalls/fsync/fsync04.c
@@ -32,6 +32,8 @@ static void verify_fsync(void)
 
 	fd = SAFE_OPEN(FNAME, O_RDWR|O_CREAT, MODE);
 
+	sync();
+
 	tst_dev_bytes_written(tst_device->dev);
 
 	tst_fill_fd(fd, 0, TST_MB, FILE_SIZE_MB);
diff --git a/testcases/kernel/syscalls/sync/sync03.c b/testcases/kernel/syscalls/sync/sync03.c
index a6f72d2ed..085ccfdeb 100644
--- a/testcases/kernel/syscalls/sync/sync03.c
+++ b/testcases/kernel/syscalls/sync/sync03.c
@@ -32,6 +32,8 @@ static void verify_sync(void)
 
 	fd = SAFE_OPEN(FNAME, O_RDWR|O_CREAT, MODE);
 
+	sync();
+
 	tst_dev_bytes_written(tst_device->dev);
 
 	tst_fill_fd(fd, 0, TST_MB, FILE_SIZE_MB);
diff --git a/testcases/kernel/syscalls/syncfs/syncfs01.c b/testcases/kernel/syscalls/syncfs/syncfs01.c
index 051a19ea6..3cf404450 100644
--- a/testcases/kernel/syscalls/syncfs/syncfs01.c
+++ b/testcases/kernel/syscalls/syncfs/syncfs01.c
@@ -33,6 +33,8 @@ static void verify_syncfs(void)
 
 	fd = SAFE_OPEN(FNAME, O_RDWR|O_CREAT, MODE);
 
+	sync();
+
 	tst_dev_bytes_written(tst_device->dev);
 
 	tst_fill_fd(fd, 0, TST_MB, FILE_SIZE_MB);
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
