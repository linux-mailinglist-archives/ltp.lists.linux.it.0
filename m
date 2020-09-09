Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFE8262ECF
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 14:58:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A4AAD3C26DF
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 14:58:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 84D8E3C21AE
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 14:58:40 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id C0EA4200B8E
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 14:58:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599656318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EYka2dP1va+rmYYc15c/0yx3FX6Q6iTRbsT/2BrFPmQ=;
 b=bC3THNAdchWqvChePTfkwsq6e1bglwifjI9GavFLOTR99GybbBATqdoKWy6+GEb7DJ2jzw
 lHmjciOl7L5y33/1+8G4yOUBb3JrTygo5CMcIKPzD/iZlSM1S2dJlKYAYaR2noHcwck+zI
 Ejv3ou9nFZV7QYO/Lh7ZU9h+ikxzIL8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-wLbpdLIiNWSwiQWarRwxUA-1; Wed, 09 Sep 2020 08:58:36 -0400
X-MC-Unique: wLbpdLIiNWSwiQWarRwxUA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07AEF10BBEE5;
 Wed,  9 Sep 2020 12:57:56 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 641FB838BF;
 Wed,  9 Sep 2020 12:57:54 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Wed,  9 Sep 2020 12:57:53 +0000
Message-Id: <20200909125753.7724-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [Patch v2] ioctl: take use of TST_RETRY_FN* macro
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

To avoid of race with udev, let's use TST_RETRY_FN* macro to loop
access() function for more times.

---Errors---
ioctl_loop01.c:59: PASS: /sys/block/loop0/loop/partscan = 1
ioctl_loop01.c:60: PASS: /sys/block/loop0/loop/autoclear = 0
ioctl_loop01.c:71: FAIL: access /dev/loop0p1 fails
ioctl_loop01.c:77: FAIL: access /sys/block/loop0/loop0p1 fails

ioctl09.c:41: PASS: access /sys/block/loop0/loop0p1 succeeds
ioctl09.c:52: FAIL: access /dev/loop0p1 fails

Fixes: #718
Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Cc: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/syscalls/ioctl/ioctl09.c      | 7 +++++--
 testcases/kernel/syscalls/ioctl/ioctl_loop01.c | 4 ++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl09.c b/testcases/kernel/syscalls/ioctl/ioctl09.c
index 151618df4..9728ecb9c 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl09.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl09.c
@@ -15,6 +15,9 @@
 #include "lapi/loop.h"
 #include "tst_test.h"
 
+#define RETVAL_CHECK(x) \
+       ({ value ? TST_RETVAL_EQ0(x) : TST_RETVAL_NOTNULL(x); })
+
 static char dev_path[1024];
 static int dev_num, attach_flag, dev_fd;
 static char loop_partpath[1026], sys_loop_partpath[1026];
@@ -36,7 +39,7 @@ static void check_partition(int part_num, bool value)
 		dev_num, dev_num, part_num);
 	sprintf(loop_partpath, "%sp%d", dev_path, part_num);
 
-	ret = access(sys_loop_partpath, F_OK);
+	ret = TST_RETRY_FN_EXP_BACKOFF(access(sys_loop_partpath, F_OK), RETVAL_CHECK, 30);
 	if (ret == 0)
 		tst_res(value ? TPASS : TFAIL, "access %s succeeds",
 			sys_loop_partpath);
@@ -44,7 +47,7 @@ static void check_partition(int part_num, bool value)
 		tst_res(value ? TFAIL : TPASS, "access %s fails",
 			sys_loop_partpath);
 
-	ret = access(loop_partpath, F_OK);
+	ret = TST_RETRY_FN_EXP_BACKOFF(access(loop_partpath, F_OK), RETVAL_CHECK, 30);
 	if (ret == 0)
 		tst_res(value ? TPASS : TFAIL, "access %s succeeds",
 			loop_partpath);
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop01.c b/testcases/kernel/syscalls/ioctl/ioctl_loop01.c
index 845a1399b..cf71184b4 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_loop01.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop01.c
@@ -64,13 +64,13 @@ static void check_loop_value(int set_flag, int get_flag, int autoclear_field)
 		return;
 	}
 
-	ret = access(loop_partpath, F_OK);
+	ret = TST_RETRY_FN_EXP_BACKOFF(access(loop_partpath, F_OK), TST_RETVAL_EQ0, 30);
 	if (ret == 0)
 		tst_res(TPASS, "access %s succeeds", loop_partpath);
 	else
 		tst_res(TFAIL, "access %s fails", loop_partpath);
 
-	ret = access(sys_loop_partpath, F_OK);
+	ret = TST_RETRY_FN_EXP_BACKOFF(access(sys_loop_partpath, F_OK), TST_RETVAL_EQ0, 30);
 	if (ret == 0)
 		tst_res(TPASS, "access %s succeeds", sys_loop_partpath);
 	else
-- 
2.21.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
