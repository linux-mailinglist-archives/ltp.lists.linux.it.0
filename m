Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8051D18C7FD
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 08:09:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4783D3C538D
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 08:09:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 9AFE53C5382
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 08:09:05 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id F399C6011EF
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 08:09:03 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.72,283,1580745600"; d="scan'208";a="86657038"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Mar 2020 15:08:55 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id A5E4D49DF126
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 14:58:47 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 20 Mar 2020 15:08:55 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 20 Mar 2020 15:08:53 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 20 Mar 2020 15:08:49 +0800
Message-ID: <1584688129-31873-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: A5E4D49DF126.A0FB4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] clocks/invaliddates.c: Remove outdated clock time
 setting
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

For CLOCK_REALTIME, attempting to set the time to a value less than
the current value of the CLOCK_MONOTONIC will trigger a EINVAL error
since linux 4.3. Remove zero and also increase threshold for delta with
personal experience.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 .../functional/timers/clocks/invaliddates.c                | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/testcases/open_posix_testsuite/functional/timers/clocks/invaliddates.c b/testcases/open_posix_testsuite/functional/timers/clocks/invaliddates.c
index 2ebf7f0b0..face334fd 100644
--- a/testcases/open_posix_testsuite/functional/timers/clocks/invaliddates.c
+++ b/testcases/open_posix_testsuite/functional/timers/clocks/invaliddates.c
@@ -5,7 +5,7 @@
  * of this license, see the COPYING file at the top level of this
  * source tree.
  *
- * Test that the clock time can be set to 0, a large number, Y2K
+ * Test that the clock time can be set to a large number, Y2K
  * critical dates, and times around daylight savings.
  *
  * Test for CLOCK_REALTIME.  (N/A for CLOCK_MONOTONIC as that clock
@@ -16,13 +16,12 @@
 #include <stdint.h>
 #include "posixtest.h"
 
-#define NUMTESTS 6
+#define NUMTESTS 5
 
 #define ACCEPTABLESECDELTA 0
-#define ACCEPTABLENSECDELTA 5000
+#define ACCEPTABLENSECDELTA 5000000
 
 static int testtimes[NUMTESTS][2] = {
-	{0, 0},			// zero
 	{INT32_MAX, 999999999},	// large number
 	{946713600, 999999999},	// Y2K - Jan 1, 2000
 	{951811200, 999999999},	// Y2K - Feb 29, 2000
-- 
2.18.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
