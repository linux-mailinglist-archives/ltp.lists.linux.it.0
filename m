Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B423620CD24
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 10:06:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4BDC43C2AE3
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 10:06:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id BCD813C2239
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 10:06:18 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 630CC140077A
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 10:06:15 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,294,1589212800"; d="scan'208";a="95474326"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 29 Jun 2020 16:06:13 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 7088E4CE49DC
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 15:55:45 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 29 Jun 2020 16:06:16 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 29 Jun 2020 16:06:08 +0800
Message-ID: <1593417968-3275-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 7088E4CE49DC.AE6B0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] lib/tst_cgroup.c: Fix general protection fault
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

When I test ksm04 on 3.10.0-1136.el7.x86_64, it failed as below:
 ./ksm04
tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
tst_device.c:417: INFO: No device is mounted at /tmp/cgroup_mem
tst_cgroup.c:96: INFO: Cgroup(memory) v1 mount at /tmp/cgroup_mem success
tst_test.c:1292: BROK: Test killed by SIGSEGV

dmesg as below:
[10096.547468] traps: ksm04[25785] general protection ip:410673 sp:7ffc1b1dc870 error:0 in ksm04[400000+22000]

addr2line -e ksm04 -f 410673
tst_cgroup_set_path
/root/ltp/lib/tst_cgroup.c:199

It detects uninitialized mem when using a->next, so it was killed.

Also ksm04_1 and oom5 have the same problem.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 lib/tst_cgroup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
index 341ecf599..ba420d5f8 100644
--- a/lib/tst_cgroup.c
+++ b/lib/tst_cgroup.c
@@ -190,6 +190,7 @@ static void tst_cgroup_set_path(const char *cgroup_dir)
 	tst_cgroup_path = SAFE_MALLOC(sizeof(struct tst_cgroup_path));
 	tst_cgroup_path->mnt_path = SAFE_MALLOC(strlen(cgroup_dir) + 1);
 	tst_cgroup_path->new_path = SAFE_MALLOC(strlen(cgroup_new_dir) + 1);
+	tst_cgroup_path->next = NULL;
 
 	if (!tst_cgroup_paths) {
 		tst_cgroup_paths = tst_cgroup_path;
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
