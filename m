Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F32AA2D2871
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Dec 2020 11:08:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3BC663C4B87
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Dec 2020 11:08:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 8E97B3C2350
 for <ltp@lists.linux.it>; Tue,  8 Dec 2020 11:07:56 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 82DF21000A5A
 for <ltp@lists.linux.it>; Tue,  8 Dec 2020 11:07:54 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,402,1599494400"; d="scan'208";a="102176855"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 08 Dec 2020 18:07:53 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 35F074CE5CF8
 for <ltp@lists.linux.it>; Tue,  8 Dec 2020 18:07:48 +0800 (CST)
Received: from RHEL74GA.g08.fujitsu.local (10.167.220.75) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Dec 2020 18:07:47 +0800
From: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 8 Dec 2020 05:07:45 -0500
Message-ID: <1607422067-15500-1-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.75]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 35F074CE5CF8.A912E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhufy.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] syscalls/ipc: shmctl04: Test SHM_STAT_ANY with
 nobody user
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

Use the nobody user to test the SHM_STAT_ANY is not checked for read access.

Signed-off-by: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/ipc/shmctl/shmctl04.c | 26 +++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
index bf3c854..9ba40f9 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
@@ -19,6 +19,7 @@
 
 #define _GNU_SOURCE
 #include <stdio.h>
+#include <pwd.h>
 #include "tst_test.h"
 #include "tst_safe_sysv_ipc.h"
 #include "libnewipc.h"
@@ -27,6 +28,16 @@
 #define SHM_SIZE 2048
 
 static int shm_id = -1;
+static struct passwd *ltpuser;
+static uid_t nobody_uid, root_uid;
+
+static struct tcases {
+	uid_t *uid;
+	char *desc;
+} tests[] = {
+	{&nobody_uid, "with nobody user"},
+	{&root_uid, "with root user"}
+};
 
 static void parse_proc_sysvipc(struct shm_info *info)
 {
@@ -96,12 +107,17 @@ static void parse_proc_sysvipc(struct shm_info *info)
 	fclose(f);
 }
 
-static void verify_shminfo(void)
+static void verify_shminfo(unsigned int n)
 {
+	struct tcases *tc = &tests[n];
 	struct shm_info info;
 	struct shmid_ds ds;
 	int i, shmid, cnt = 0;
 
+	tst_res(TINFO, "Test SHM_STAT_ANY %s", tc->desc);
+
+	SAFE_SETEUID(*tc->uid);
+
 	TEST(shmctl(0, SHM_INFO, (struct shmid_ds *)&info));
 
 	if (TST_RET == -1) {
@@ -136,6 +152,10 @@ static void verify_shminfo(void)
 
 static void setup(void)
 {
+	ltpuser = SAFE_GETPWNAM("nobody");
+	nobody_uid = ltpuser->pw_uid;
+	root_uid = 0;
+
 	shm_id = SAFE_SHMGET(IPC_PRIVATE, SHM_SIZE, IPC_CREAT | SHM_RW);
 }
 
@@ -148,5 +168,7 @@ static void cleanup(void)
 static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
-	.test_all = verify_shminfo,
+	.test = verify_shminfo,
+	.tcnt = ARRAY_SIZE(tests),
+	.needs_root = 1,
 };
-- 
1.8.3.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
