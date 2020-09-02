Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DED625A45A
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Sep 2020 06:20:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C725A3C30AA
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Sep 2020 06:20:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id C75C63C2D8F
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 06:20:47 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 220D7100043B
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 06:20:45 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,381,1592841600"; d="scan'208";a="98820730"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 02 Sep 2020 12:20:43 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id A33BC48990C9
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 12:20:42 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 2 Sep 2020 12:20:42 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 2 Sep 2020 12:20:10 +0800
Message-ID: <1599020410-17254-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A33BC48990C9.AC878
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] security/dirtyc0w: Add CVE tag
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

Also use correct fix commit id.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/security/dirtyc0w/dirtyc0w.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/security/dirtyc0w/dirtyc0w.c b/testcases/kernel/security/dirtyc0w/dirtyc0w.c
index 6455f9cc0..7924285a7 100644
--- a/testcases/kernel/security/dirtyc0w/dirtyc0w.c
+++ b/testcases/kernel/security/dirtyc0w/dirtyc0w.c
@@ -4,6 +4,8 @@
  */
 
 /*
+ * CVE-2016-5195
+ *
  * This is a regression test for write race that allows unprivileged programs
  * to change readonly files on the system.
  *
@@ -101,7 +103,8 @@ static struct tst_test test = {
 	.test_all = dirtyc0w_test,
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "4ceb5db9757a"},
-		{"linux-git", "9be0eaffa3ac"},
+		{"linux-git", "19be0eaffa3a"},
+		{"CVE", "2016-5195"},
 		{}
 	}
 };
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
