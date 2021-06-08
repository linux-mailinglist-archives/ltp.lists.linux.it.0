Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AD939F131
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jun 2021 10:44:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B5A0D3C4DA4
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jun 2021 10:44:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C05CF3C269A
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 10:44:45 +0200 (CEST)
Received: from unicom145.biz-email.net (unicom145.biz-email.net
 [210.51.26.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A16F414010EB
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 10:44:41 +0200 (CEST)
Received: from ([60.208.111.195])
 by unicom145.biz-email.net ((LNX1044)) with ASMTP (SSL) id CGB00036
 for <ltp@lists.linux.it>; Tue, 08 Jun 2021 16:44:36 +0800
Received: from localhost.localdomain (10.72.58.101) by
 jtjnmail201602.home.langchao.com (10.100.2.2) with Microsoft SMTP Server id
 15.1.2176.14; Tue, 8 Jun 2021 16:44:35 +0800
From: dongshijiang <dongshijiang@inspur.com>
To: <ltp@lists.linux.it>
Date: Tue, 8 Jun 2021 04:44:31 -0400
Message-ID: <20210608084431.62769-1-dongshijiang@inspur.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Originating-IP: [10.72.58.101]
tUid: 20216081644366e286fd898ef8dd746426e44034f624f
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] fix pan/ltp-pan return values
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
Cc: dongshijiang <dongshijiang@inspur.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

When performing an LTP test, if there are only "PASS" and "TCONF" in the test results, but "runltp" displays "INFO: ltp-pan reported all tests PASS", I think it should give something like "INFO: ltp-pan reported some "tests FAIL or TCONF" prompt.

Signed-off-by: dongshijiang <dongshijiang@inspur.com>
---
 pan/ltp-pan.c | 2 +-
 runltp        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/pan/ltp-pan.c b/pan/ltp-pan.c
index 298072fe0..05690f7c9 100644
--- a/pan/ltp-pan.c
+++ b/pan/ltp-pan.c
@@ -770,7 +770,7 @@ check_pids(struct tag_pgrp *running, int *num_active, int keep_active,
 					"child %d exited with status %d\n",
 					cpid, w);
 			--*num_active;
-			if (w != 0 && w != TCONF)
+			if (w != 0)
 				ret++;
 		} else if (WIFSTOPPED(stat_loc)) {	/* should never happen */
 			w = WSTOPSIG(stat_loc);
diff --git a/runltp b/runltp
index 4447da156..539e7800d 100755
--- a/runltp
+++ b/runltp
@@ -811,7 +811,7 @@ EOF
       VALUE=0
       export LTP_EXIT_VALUE=0;
     else
-      echo "INFO: ltp-pan reported some tests FAIL"
+      echo "INFO: ltp-pan reported some tests FAIL or TCONF"
       VALUE=1
       export LTP_EXIT_VALUE=1;
     fi
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
