Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 50726192050
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 06:07:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7BB123C4D60
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 06:07:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 6D2FD3C29B2
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 06:07:16 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 653B3200E0D
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 06:07:12 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.72,303,1580745600"; d="scan'208";a="87224783"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 25 Mar 2020 13:07:07 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 7A4F150A9996
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 12:56:51 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 25 Mar 2020 13:07:01 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 25 Mar 2020 13:06:54 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 25 Mar 2020 13:07:00 +0800
Message-ID: <1585112820-30322-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <5E71F152.5010909@cn.fujitsu.com>
References: <5E71F152.5010909@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 7A4F150A9996.AA6C1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2] openposix/twoptimers: handle signal correctly
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

Usually, when we want to get a signal to handle, we should install
customized signal handler function by using sigation. The other way
is to block this signal and use sigwait() to get the signal from its
pending list. Use sigprocmask(SIGBLOCK, &set, NULL) to make sure we
can get SIGABRT/SIGALRM signal.

Test this case on 2.6.18-398.el5, it doesn't get any signal.
higer versions than this only get SIGABRT signal.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 .../functional/timers/timers/twoptimers.c     | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/testcases/open_posix_testsuite/functional/timers/timers/twoptimers.c b/testcases/open_posix_testsuite/functional/timers/timers/twoptimers.c
index 84bea3f0a..b2657539c 100644
--- a/testcases/open_posix_testsuite/functional/timers/timers/twoptimers.c
+++ b/testcases/open_posix_testsuite/functional/timers/timers/twoptimers.c
@@ -51,6 +51,10 @@ int main(int argc, char *argv[])
 			return PTS_UNRESOLVED;
 		}
 
+		if (sigprocmask(SIG_BLOCK, &set, NULL) == -1) {
+			perror("sigprocmask() failed\n");
+			return PTS_UNRESOLVED;
+		}
 		ev.sigev_notify = SIGEV_SIGNAL;
 		ev.sigev_signo = SIGABRT;
 		if (timer_create(CLOCK_REALTIME, &ev, &tid) != 0) {
@@ -73,8 +77,10 @@ int main(int argc, char *argv[])
 			perror("sigwait() failed\n");
 			return PTS_UNRESOLVED;
 		}
-		printf("Got it!  Child\n");
-
+		if (sig == SIGABRT)
+			printf("Got it! Child\n");
+		else
+			printf("Got another signal! Child\n");
 		sleep(LONGTIME);
 		return CHILDPASS;
 	} else {
@@ -97,6 +103,11 @@ int main(int argc, char *argv[])
 			return PTS_UNRESOLVED;
 		}
 
+		if (sigprocmask(SIG_BLOCK, &set, NULL) == -1) {
+			perror("sigaprocmask() failed\n");
+			return PTS_UNRESOLVED;
+		}
+
 		ev.sigev_notify = SIGEV_SIGNAL;
 		ev.sigev_signo = SIGALRM;
 		if (timer_create(CLOCK_REALTIME, &ev, &tid) != 0) {
@@ -119,7 +130,10 @@ int main(int argc, char *argv[])
 			perror("sigwait() failed\n");
 			return PTS_UNRESOLVED;
 		}
-		printf("Got it!  Parent\n");
+		if (sig == SIGALRM)
+			printf("Got it! Parent\n");
+		else
+			printf("Got another signal! Parent\n");
 
 		if (wait(&i) == -1) {
 			perror("Error waiting for child to exit\n");
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
