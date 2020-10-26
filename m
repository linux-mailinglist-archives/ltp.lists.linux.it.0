Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 50237298697
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 06:48:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1D1AA3C25AA
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 06:48:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 1F5983C3133
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 06:48:36 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 73E0F600763
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 06:48:35 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.77,417,1596470400"; d="scan'208";a="100494216"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 26 Oct 2020 13:48:33 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 6FC1C4CE1506
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 13:48:33 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 26 Oct 2020 13:48:34 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 26 Oct 2020 13:48:35 +0800
Message-ID: <1603691317-22811-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1603691317-22811-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1603691317-22811-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6FC1C4CE1506.ABB4B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 3/4] syscalls/sync03: Remove useless judgement
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

The TEST_VOID was defined as below in include/tst_test.h
define TEST_VOID(SCALL) \
        do { \
                errno = 0; \
                SCALL; \
                TST_ERR = errno; \
        } while (0)

It doesn't assign the value fot TST_RET like TEST macro. So
remove the useless judgement and use sync instead because
sync() is always successful.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
1.I plan to remove TEST_VOID macro because only sync cases use it.
Also, I don't see any syscall doesn't have return value and still has
error describe(If having, please let me know).
 testcases/kernel/syscalls/sync/sync03.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/sync/sync03.c b/testcases/kernel/syscalls/sync/sync03.c
index c5c02f877..dc093d863 100644
--- a/testcases/kernel/syscalls/sync/sync03.c
+++ b/testcases/kernel/syscalls/sync/sync03.c
@@ -37,10 +37,7 @@ static void verify_sync(void)
 
 	tst_fill_fd(fd, 0, TST_MB, FILE_SIZE_MB);
 
-	TEST_VOID(sync());
-
-	if (TST_RET)
-		tst_brk(TFAIL | TTERRNO, "sync() failed");
+	sync();
 
 	written = tst_dev_bytes_written(tst_device->dev);
 
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
