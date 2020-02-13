Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9349815BCE8
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Feb 2020 11:35:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 354733C2546
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Feb 2020 11:35:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 913E33C1441
 for <ltp@lists.linux.it>; Thu, 13 Feb 2020 11:35:18 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 8985D6021C1
 for <ltp@lists.linux.it>; Thu, 13 Feb 2020 11:35:15 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,436,1574092800"; d="scan'208";a="83250817"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 Feb 2020 18:35:13 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id E639C50A996F;
 Thu, 13 Feb 2020 18:25:38 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 13 Feb 2020 18:35:10 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 13 Feb 2020 18:35:09 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <jstancek@redhat.com>
Date: Thu, 13 Feb 2020 18:35:20 +0800
Message-ID: <1581590121-4626-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: E639C50A996F.AEE90
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] syscalls/kill11,
 abort01: Also raise hard limit when possible
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

Currently, running this two cases will report EINVAL error if I run "ulimit -c
1023" command firstly. From setrlimit(2)manpage, it got EINVAL error because
rlim->rlim_cur was greater than rlim->rlim_max. So raise the limit when possible.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/abort/abort01.c | 9 +++++++++
 testcases/kernel/syscalls/kill/kill11.c   | 8 ++++++++
 2 files changed, 17 insertions(+)

diff --git a/testcases/kernel/syscalls/abort/abort01.c b/testcases/kernel/syscalls/abort/abort01.c
index 386a22f26..6fde3721c 100644
--- a/testcases/kernel/syscalls/abort/abort01.c
+++ b/testcases/kernel/syscalls/abort/abort01.c
@@ -70,6 +70,15 @@ static void setup(void)
 
 	/* make sure we get core dumps */
 	SAFE_GETRLIMIT(RLIMIT_CORE, &rlim);
+
+	if (rlim.rlim_max < MIN_RLIMIT_CORE) {
+		if (geteuid() != 0) {
+			tst_brk(TCONF, "hard limit(%lu)less than MIN_RLIMT_CORE(%i)",
+				rlim.rlim_max, MIN_RLIMIT_CORE);
+		}
+		tst_res(TINFO, "Raising rlim_max to %i", MIN_RLIMIT_CORE);
+		rlim.rlim_max = MIN_RLIMIT_CORE;
+	}
 	if (rlim.rlim_cur < MIN_RLIMIT_CORE) {
 		rlim.rlim_cur = MIN_RLIMIT_CORE;
 		SAFE_SETRLIMIT(RLIMIT_CORE, &rlim);
diff --git a/testcases/kernel/syscalls/kill/kill11.c b/testcases/kernel/syscalls/kill/kill11.c
index 83fba5beb..4025fcc87 100644
--- a/testcases/kernel/syscalls/kill/kill11.c
+++ b/testcases/kernel/syscalls/kill/kill11.c
@@ -201,6 +201,14 @@ void setup(void)
 
 	SAFE_GETRLIMIT(NULL, RLIMIT_CORE, &rlim);
 
+	if (rlim.rlim_max < MIN_RLIMIT_CORE) {
+		if (geteuid() != 0) {
+			tst_brkm(TCONF, NULL, "hard limit(%lu)less than MIN_RLIMT_CORE(%i)",
+				rlim.rlim_max, MIN_RLIMIT_CORE);
+		}
+		tst_resm(TINFO, "Raising rlim_max to %i", MIN_RLIMIT_CORE);
+		rlim.rlim_max = MIN_RLIMIT_CORE;
+	}
 	if (rlim.rlim_cur < MIN_RLIMIT_CORE) {
 		tst_resm(TINFO, "Adjusting RLIMIT_CORE to %i", MIN_RLIMIT_CORE);
 		rlim.rlim_cur = MIN_RLIMIT_CORE;
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
