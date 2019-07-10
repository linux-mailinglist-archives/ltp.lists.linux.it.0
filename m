Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA0B6456C
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 12:53:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7EB6D3C1C7C
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 12:53:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 549033C07AD
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 12:53:27 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 646CF600D01
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 12:53:24 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,474,1557158400"; d="scan'208";a="71103675"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Jul 2019 18:53:21 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 1CF524B41EE5;
 Wed, 10 Jul 2019 18:53:22 +0800 (CST)
Received: from localhost.localdomain (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 10 Jul 2019 18:53:20 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <amir73il@gmail.com>
Date: Wed, 10 Jul 2019 18:53:15 +0800
Message-ID: <1562755997-5626-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <5D25B05A.8000600@cn.fujitsu.com>
References: <5D25B05A.8000600@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: 1CF524B41EE5.AC807
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v4 1/3] lib: alter find_free_loopdev()
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Alter find_free_loopdev() to return the free loopdev minor
(and -1 for no free loopdev) and then WE can safely use the
minor number that find_free_loopdev() returned in test cases.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Reviewed-by: Amir Goldstein <amir73il@gmail.com>
---
 doc/test-writing-guidelines.txt |  9 +++++++++
 include/tst_device.h            |  6 ++++++
 lib/tst_device.c                | 12 ++++++------
 3 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index c6d4e001d..887801e68 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -1045,6 +1045,15 @@ IMPORTANT: All testcases should use 'tst_umount()' instead of 'umount(2)' to
 -------------------------------------------------------------------------------
 #include "tst_test.h"
 
+int find_free_loopdev();
+-------------------------------------------------------------------------------
+This function finds a free loopdev for use and returns the free loopdev minor(-1
+for no free loopdev).
+
+[source,c]
+-------------------------------------------------------------------------------
+#include "tst_test.h"
+
 unsigned long tst_dev_bytes_written(const char *dev);
 -------------------------------------------------------------------------------
 
diff --git a/include/tst_device.h b/include/tst_device.h
index 61902b7e0..8953b0828 100644
--- a/include/tst_device.h
+++ b/include/tst_device.h
@@ -44,6 +44,12 @@ int tst_umount(const char *path);
  */
 int tst_clear_device(const char *dev);
 
+/*
+ * Finds a free loop device for use and returns the free loopdev minor(-1 for no
+ * free loopdev).
+ */
+int find_free_loopdev(void);
+
 /*
  * Reads test block device stat file and returns the bytes written since the
  * last call of this function.
diff --git a/lib/tst_device.c b/lib/tst_device.c
index 65fcc1337..3b87dd1f1 100644
--- a/lib/tst_device.c
+++ b/lib/tst_device.c
@@ -68,7 +68,7 @@ static int set_dev_path(int dev)
 	return 0;
 }
 
-static int find_free_loopdev(void)
+int find_free_loopdev(void)
 {
 	int ctl_fd, dev_fd, rc, i;
 	struct loop_info loopinfo;
@@ -82,10 +82,10 @@ static int find_free_loopdev(void)
 		if (rc >= 0) {
 			set_dev_path(rc);
 			tst_resm(TINFO, "Found free device '%s'", dev_path);
-			return 0;
+			return rc;
 		}
 		tst_resm(TINFO, "Couldn't find free loop device");
-		return 1;
+		return -1;
 	}
 
 	switch (errno) {
@@ -121,7 +121,7 @@ static int find_free_loopdev(void)
 				continue;
 			tst_resm(TINFO, "Found free device '%s'", dev_path);
 			close(dev_fd);
-			return 0;
+			return i;
 		}
 
 		close(dev_fd);
@@ -129,7 +129,7 @@ static int find_free_loopdev(void)
 
 	tst_resm(TINFO, "No free devices found");
 
-	return 1;
+	return -1;
 }
 
 static int attach_device(const char *dev, const char *file)
@@ -274,7 +274,7 @@ const char *tst_acquire_device__(unsigned int size)
 		return NULL;
 	}
 
-	if (find_free_loopdev())
+	if (find_free_loopdev() == -1)
 		return NULL;
 
 	if (attach_device(dev_path, DEV_FILE))
-- 
2.18.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
