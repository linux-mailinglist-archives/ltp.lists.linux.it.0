Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 737DC18690A
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Mar 2020 11:29:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 928B33C56BA
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Mar 2020 11:29:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 8136F3C568A
 for <ltp@lists.linux.it>; Mon, 16 Mar 2020 11:29:35 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 67E6F200DC8
 for <ltp@lists.linux.it>; Mon, 16 Mar 2020 11:29:33 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,559,1574092800"; d="scan'208";a="86405133"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 16 Mar 2020 18:29:25 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id C4CD1406AB15
 for <ltp@lists.linux.it>; Mon, 16 Mar 2020 18:19:20 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 16 Mar 2020 18:29:23 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 16 Mar 2020 18:29:25 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 16 Mar 2020 18:29:16 +0800
Message-ID: <1584354556-6439-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: C4CD1406AB15.AC81E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] openposix/functional/timers: Add missing Makefile
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

Currently, open_posix_testsuite/scripts/generate-makefiles.sh and local-test
think every c file is a test case, only directory with c file will generate
Makefile. It doesn't work well in situation with middle layer not having c file
like openposix/functional/thread. So add missing Makefile for this case and also
add LDLIBS for linking with -lrt.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/open_posix_testsuite/functional/Makefile     |  2 +-
 .../open_posix_testsuite/functional/timers/Makefile    | 10 ++++++++++
 .../functional/timers/timers/LDLIBS                    |  1 +
 3 files changed, 12 insertions(+), 1 deletion(-)
 create mode 100644 testcases/open_posix_testsuite/functional/timers/Makefile
 create mode 100644 testcases/open_posix_testsuite/functional/timers/timers/LDLIBS

diff --git a/testcases/open_posix_testsuite/functional/Makefile b/testcases/open_posix_testsuite/functional/Makefile
index b647f0796..3b22c89af 100644
--- a/testcases/open_posix_testsuite/functional/Makefile
+++ b/testcases/open_posix_testsuite/functional/Makefile
@@ -10,4 +10,4 @@ all clean install test:
 	done
 
 distclean-makefiles:
-	@find */ -name 'Makefile*' | grep -v threads/Makefile | xargs rm -f
+	@find */ -name 'Makefile*' | grep -v threads/Makefile | grep -v timers/Makefile | xargs rm -f
diff --git a/testcases/open_posix_testsuite/functional/timers/Makefile b/testcases/open_posix_testsuite/functional/timers/Makefile
new file mode 100644
index 000000000..6cf8b0642
--- /dev/null
+++ b/testcases/open_posix_testsuite/functional/timers/Makefile
@@ -0,0 +1,10 @@
+#
+# Read COPYING for licensing details.
+#
+# Ngie Cooper, June 2010
+#
+
+all clean install test:
+	@for dir in `ls -d */Makefile 2>/dev/null | sed -e 's,/Makefile$$,,g'`; do \
+		$(MAKE) -C $$dir $@;						   \
+	done
diff --git a/testcases/open_posix_testsuite/functional/timers/timers/LDLIBS b/testcases/open_posix_testsuite/functional/timers/timers/LDLIBS
new file mode 100644
index 000000000..4c7e2d8de
--- /dev/null
+++ b/testcases/open_posix_testsuite/functional/timers/timers/LDLIBS
@@ -0,0 +1 @@
+-lrt
-- 
2.18.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
