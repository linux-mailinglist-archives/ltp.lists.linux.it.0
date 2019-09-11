Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2C3B021F
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2019 18:52:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F3D1A3C20F1
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2019 18:52:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 2A7B03C20B5
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 18:52:37 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 310351000D06
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 18:52:29 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C6D66AFAE
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 16:52:36 +0000 (UTC)
From: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
To: Petr Vorel <pvorel@suse.cz>,
	ltp@lists.linux.it
Date: Wed, 11 Sep 2019 18:52:24 +0200
Message-Id: <20190911165225.2122-2-cfamullaconrad@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190911165225.2122-1-cfamullaconrad@suse.de>
References: <20190911085536.25546-1-cfamullaconrad@suse.de>
 <20190911165225.2122-1-cfamullaconrad@suse.de>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/3] tst_test.c: Add tst_adjust_timeout()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This function is used to adjust timeout values with environment
variables like LTP_TIMEOUT_MUL.

Signed-off-by: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
---
 include/tst_test.h |  1 +
 lib/tst_test.c     | 32 ++++++++++++++++++++------------
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/include/tst_test.h b/include/tst_test.h
index cdeaf6ad0..908015846 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -261,6 +261,7 @@ const char *tst_strsig(int sig);
 const char *tst_strstatus(int status);
 
 unsigned int tst_timeout_remaining(void);
+unsigned int tst_adjust_timeout(unsigned int timeout);
 void tst_set_timeout(int timeout);
 
 
diff --git a/lib/tst_test.c b/lib/tst_test.c
index d2cf92608..1283dba1a 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -36,6 +36,7 @@ struct tst_test *tst_test;
 static const char *tid;
 static int iterations = 1;
 static float duration = -1;
+static float timeout_mul = -1;
 static pid_t main_pid, lib_pid;
 static int mntpoint_mounted;
 static int ovl_mounted;
@@ -1087,25 +1088,32 @@ unsigned int tst_timeout_remaining(void)
 	return 0;
 }
 
-void tst_set_timeout(int timeout)
+unsigned int tst_adjust_timeout(unsigned int timeout)
 {
-	char *mul = getenv("LTP_TIMEOUT_MUL");
+	char *mul;
+	if (timeout_mul == -1){
+		mul = getenv("LTP_TIMEOUT_MUL");
+		if (mul) {
+			timeout_mul = atof(mul);
+			if (timeout_mul < 1)
+				tst_brk(TBROK,
+					"Invalid timeout multiplier '%s'",
+					mul);
+		} else {
+			timeout_mul = 1;
+		}
+	}
+	return timeout * timeout_mul + 0.5;
+}
 
+void tst_set_timeout(int timeout)
+{
 	if (timeout == -1) {
 		tst_res(TINFO, "Timeout per run is disabled");
 		return;
 	}
 
-	results->timeout = timeout;
-
-	if (mul) {
-		float m = atof(mul);
-
-		if (m < 1)
-			tst_brk(TBROK, "Invalid timeout multiplier '%s'", mul);
-
-		results->timeout = results->timeout * m + 0.5;
-	}
+	results->timeout = tst_adjust_timeout(timeout);
 
 	tst_res(TINFO, "Timeout per run is %uh %02um %02us",
 		results->timeout/3600, (results->timeout%3600)/60,
-- 
2.16.4


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
