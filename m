Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CA913B6417
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Sep 2019 15:09:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 47E353C2101
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Sep 2019 15:09:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 1D2BB3C20B5
 for <ltp@lists.linux.it>; Wed, 18 Sep 2019 15:09:30 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 3B50B14004FE
 for <ltp@lists.linux.it>; Wed, 18 Sep 2019 15:09:27 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,520,1559491200"; d="scan'208";a="75653040"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 18 Sep 2019 21:09:24 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 51A344CDFCE9
 for <ltp@lists.linux.it>; Wed, 18 Sep 2019 21:09:20 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 18 Sep 2019 21:09:20 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 17 Sep 2019 19:39:16 +0800
Message-ID: <1568720356-29641-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 51A344CDFCE9.AFE4A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.9 required=7.0 tests=DATE_IN_PAST_24_48,
 KHOP_HELO_FCRDNS,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] crypto/af_alg05: add comment for a regression
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

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/crypto/af_alg05.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/testcases/kernel/crypto/af_alg05.c b/testcases/kernel/crypto/af_alg05.c
index 419c65eab..964adffcc 100644
--- a/testcases/kernel/crypto/af_alg05.c
+++ b/testcases/kernel/crypto/af_alg05.c
@@ -10,6 +10,12 @@
  * block size, and where the destination buffer starts exactly at a page
  * boundary.  Based on the reproducer from the commit message.  Note that this
  * issue only reproduces on certain architectures, such as arm and arm64.
+ *
+ * On some older kernel without commit 160544075f2 ("crypto: scatterwalk - Hide
+ * PageSlab call to optimise away flush_dcache_page") , it doesn't use
+ * ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE macro. It can crash on all architectures.
+ * Without skcipher walk interface, it is also a regresstion test for commit
+ * 0868def3e410("crypto: blkcipher - fix crash flushing dcache in error path").
  */
 
 #include <errno.h>
-- 
2.18.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
