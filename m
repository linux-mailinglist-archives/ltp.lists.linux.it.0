Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA3F1897C6
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 10:17:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 559C73C551F
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 10:17:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 1618C3C5510
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 10:17:18 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 985F160025C
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 10:17:15 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,566,1574092800"; d="scan'208";a="86535110"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 18 Mar 2020 17:17:11 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id E650749DF129
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 17:07:01 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 18 Mar 2020 17:17:06 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 18 Mar 2020 17:17:06 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 18 Mar 2020 17:16:48 +0800
Message-ID: <1584523008-27044-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: E650749DF129.AB4F0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] openposix/twoptimers.c: Use other signal instead of
 SIGALRM
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

Currently, run this case failed as below:

Got it!  Child
Alarm clock

Parent process doesn't get SIGALRM siganl by using sigwait. It
seems SIGALRM siganl is handled by system but not user.

From timer_create man-page, it said "
Specifying  sevp as NULL is equivalent to specifying a pointer to
a sigevent structure in which sigev_notify is SIGEV_SIGNAL, sigev_signo
is SIGALRM, and sigev_value.sival_int is the timer ID".

I think this is the reason. So use SIGILL signal to avoid system caught.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 .../functional/timers/timers/twoptimers.c                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/open_posix_testsuite/functional/timers/timers/twoptimers.c b/testcases/open_posix_testsuite/functional/timers/timers/twoptimers.c
index 84bea3f0a..7e1648d5b 100644
--- a/testcases/open_posix_testsuite/functional/timers/timers/twoptimers.c
+++ b/testcases/open_posix_testsuite/functional/timers/timers/twoptimers.c
@@ -92,13 +92,13 @@ int main(int argc, char *argv[])
 			return PTS_UNRESOLVED;
 		}
 
-		if (sigaddset(&set, SIGALRM) == -1) {
+		if (sigaddset(&set, SIGILL) == -1) {
 			perror("sigaddset() failed\n");
 			return PTS_UNRESOLVED;
 		}
 
 		ev.sigev_notify = SIGEV_SIGNAL;
-		ev.sigev_signo = SIGALRM;
+		ev.sigev_signo = SIGILL;
 		if (timer_create(CLOCK_REALTIME, &ev, &tid) != 0) {
 			perror("timer_create() did not return success\n");
 			return PTS_UNRESOLVED;
-- 
2.18.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
