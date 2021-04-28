Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACA436D3A5
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 10:08:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D12413C6273
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 10:08:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 568FB3C19C3
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 10:08:17 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id D7064100049E
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 10:08:15 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.82,257,1613404800"; d="scan'208";a="107666761"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 28 Apr 2021 16:08:12 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 255594D0B891
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 16:08:09 +0800 (CST)
Received: from localhost.localdomain (10.167.220.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 28 Apr 2021 16:08:08 +0800
From: Jinhui Huang <huangjh.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 28 Apr 2021 16:07:55 +0800
Message-ID: <1619597275-12846-1-git-send-email-huangjh.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 255594D0B891.A80F3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangjh.jy@fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NEUTRAL autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/chown03.c: Remove the redundant pass
 information
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

When executing testcase chown03_16, the system will report pass information
even if 16-bit version of chown() is not supported, for example:
--------------------------------------------------------------------------
tst_test.c:1313: TINFO: Timeout per run is 0h 05m 00s
chown03.c:48: TPASS: chown03_testfile: expected owner set to (uid=99, gid=0)
chown03.c:58: TPASS: chown03_testfile: expected mode permissions 0106770
/root/ltp/testcases/kernel/syscalls/chown/../utils/compat_tst_16.h:153: TCONF: 16-bit version of chown() is not supported on your platform

Summary:
passed   2
failed   0
broken   0
skipped  1
warnings 0
--------------------------------------------------------------------------

The redundant pass information may mislead testers, so we should remove them.

Signed-off-by: Jinhui Huang <huangjh.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/chown/chown03.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/testcases/kernel/syscalls/chown/chown03.c b/testcases/kernel/syscalls/chown/chown03.c
index 8ff2602..ff6e904 100644
--- a/testcases/kernel/syscalls/chown/chown03.c
+++ b/testcases/kernel/syscalls/chown/chown03.c
@@ -43,9 +43,6 @@ static void check_owner(struct stat *s, uid_t exp_uid, gid_t exp_gid)
 		tst_res(TFAIL, "%s: wrong owner set to (uid=%d, gid=%d),"
 			       " expected (uid=%d, gid=%d)",
 			FILENAME, s->st_uid, s->st_gid, exp_uid, exp_gid);
-	else
-		tst_res(TPASS, "%s: expected owner set to (uid=%d, gid=%d)",
-			FILENAME, exp_uid, exp_gid);
 }
 
 static void check_mode(struct stat *s, mode_t exp_mode)
@@ -53,9 +50,6 @@ static void check_mode(struct stat *s, mode_t exp_mode)
 	if (s->st_mode != exp_mode)
 	      tst_res(TFAIL, "%s: wrong mode permissions %#o, expected %#o",
 		      FILENAME, s->st_mode, exp_mode);
-	else
-	      tst_res(TPASS, "%s: expected mode permissions %#o",
-		      FILENAME, s->st_mode);
 }
 
 static void run(void)
-- 
1.8.3.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
