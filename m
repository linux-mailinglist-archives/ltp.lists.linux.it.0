Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB15278CA7
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 17:28:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0414D3C307A
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 17:28:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 598DC3C078F
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 17:28:28 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 0FA751401464
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 17:28:26 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,302,1596470400"; d="scan'208";a="99620420"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 25 Sep 2020 23:28:22 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 441F848990CB;
 Fri, 25 Sep 2020 23:28:19 +0800 (CST)
Received: from G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 25 Sep 2020 23:28:19 +0800
Received: from Fedora-31.g08.fujitsu.local (10.167.220.31) by
 G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Fri, 25 Sep 2020 23:28:16 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 25 Sep 2020 23:09:49 +0800
Message-ID: <20200925150949.127675-1-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 441F848990CB.A89CD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] pty/pty03.c: Add another linux git tag
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
Cc: rpalethorpe@suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Running pty03 can trigger the following error on the kernel which
applys commit 0ace17d568241 but doesn't apply commit dd42bf1197144:
----------------------------------------------------------
pty03.c:103: TINFO: Creating PTY with HDLC line discipline
pty03.c:91: TFAIL: Failed to set the HDLC line discipline: EEXIST (17)
----------------------------------------------------------

Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 testcases/kernel/pty/pty03.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/testcases/kernel/pty/pty03.c b/testcases/kernel/pty/pty03.c
index e71739a71..71bcb2eb6 100644
--- a/testcases/kernel/pty/pty03.c
+++ b/testcases/kernel/pty/pty03.c
@@ -24,6 +24,9 @@
  *
  * Fixed by commit 0ace17d568241:
  * "can, slip: Protect tty->disc_data in write_wakeup and close with RCU"
+ *
+ * This is also regression test for commit:
+ * dd42bf1197144 ("tty: Prevent ldisc drivers from re-using stale tty fields")
  */
 
 #define _GNU_SOURCE
@@ -151,6 +154,7 @@ static struct tst_test test = {
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "0ace17d568241"},
 		{"CVE", "2020-14416"},
+		{"linux-git", "dd42bf1197144"},
 		{}
 	}
 };
-- 
2.25.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
