Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CECE802B
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Oct 2019 07:18:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8CF953C233A
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Oct 2019 07:18:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id DBB793C1CE5
 for <ltp@lists.linux.it>; Tue, 29 Oct 2019 07:17:55 +0100 (CET)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8B8601000B58
 for <ltp@lists.linux.it>; Tue, 29 Oct 2019 07:17:54 +0100 (CET)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 216A620B55D7FB676F24
 for <ltp@lists.linux.it>; Tue, 29 Oct 2019 14:17:49 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Tue, 29 Oct 2019 14:17:43 +0800
From: Ma Feng <mafeng.ma@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 29 Oct 2019 14:19:08 +0800
Message-ID: <1572329948-97062-1-git-send-email-mafeng.ma@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] testcases/kernel/fs/ftest:Fix some comment errors
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

I found some comment errors may cause misunderstandings
when I simply read ftest's descriptions

Signed-off-by: Ma Feng <mafeng.ma@huawei.com>
---
 testcases/kernel/fs/ftest/ftest06.c | 2 +-
 testcases/kernel/fs/ftest/ftest07.c | 2 +-
 testcases/kernel/fs/ftest/ftest08.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/fs/ftest/ftest06.c b/testcases/kernel/fs/ftest/ftest06.c
index b434067..c3aebe5 100644
--- a/testcases/kernel/fs/ftest/ftest06.c
+++ b/testcases/kernel/fs/ftest/ftest06.c
@@ -25,7 +25,7 @@
  * 	this is the same as ftest2, except that it uses lseek64
  *
  * CALLS
- *	open, close,  read, write, llseek,
+ *	open, close,  read, write, lseek64,
  *	unlink, chdir
  *
  *
diff --git a/testcases/kernel/fs/ftest/ftest07.c b/testcases/kernel/fs/ftest/ftest07.c
index e5998b5..3b5b2a4 100644
--- a/testcases/kernel/fs/ftest/ftest07.c
+++ b/testcases/kernel/fs/ftest/ftest07.c
@@ -23,7 +23,7 @@
  *	ftest07.c -- test file I/O with readv and writev (ported from SPIE,
  *		    section2/filesuite/ftest9.c
  *
- * 	this is the same as ftest4, except that it uses lseek64
+ * 	this is the same as ftest3, except that it uses lseek64
  *
  * CALLS
  *	lseek64, readv, writev,
diff --git a/testcases/kernel/fs/ftest/ftest08.c b/testcases/kernel/fs/ftest/ftest08.c
index 5e46248..e7fb56f 100644
--- a/testcases/kernel/fs/ftest/ftest08.c
+++ b/testcases/kernel/fs/ftest/ftest08.c
@@ -23,7 +23,7 @@
  *	ftest08.c -- test single file io (tsfio.c by rbk) (ported from SPIE,
  *		     section2/filesuite/ftest10.c, by Airong Zhang)
  *
- * 	this is the same as ftest5, except that it uses lseek64
+ * 	this is the same as ftest4, except that it uses lseek64
  *
  * CALLS
  *	fsync, sync, lseek64, read, write
-- 
2.6.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
