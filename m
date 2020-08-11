Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 58ECD241C13
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Aug 2020 16:07:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 972DB3C5EF3
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Aug 2020 16:07:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id F119A3C3129
 for <ltp@lists.linux.it>; Tue, 11 Aug 2020 16:07:35 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7AC87140135D
 for <ltp@lists.linux.it>; Tue, 11 Aug 2020 16:07:35 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A35E9AC98;
 Tue, 11 Aug 2020 14:07:55 +0000 (UTC)
Date: Tue, 11 Aug 2020 16:07:53 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Nirav Parmar <niravparmar@zilogic.com>
Message-ID: <20200811140753.GA1292@yuki.lan>
References: <20200620063713.5330-1-niravparmar@zilogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200620063713.5330-1-niravparmar@zilogic.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Add test case for CVE-2018-11508
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
Cc: ltp@lists.linux.it, vijaykumar@zilogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Pushed with some changes, explained below, thanks.


diff --git a/testcases/kernel/syscalls/adjtimex/adjtimex03.c b/testcases/kernel/syscalls/adjtimex/adjtimex03.c
index d6c8d67e5..263391c90 100644
--- a/testcases/kernel/syscalls/adjtimex/adjtimex03.c
+++ b/testcases/kernel/syscalls/adjtimex/adjtimex03.c
@@ -33,13 +33,9 @@
 #include <sys/timex.h>
 #include "tst_test.h"
 
-#define SET_MODE (ADJ_OFFSET | ADJ_FREQUENCY | ADJ_MAXERROR | ADJ_ESTERROR | \
-		ADJ_STATUS | ADJ_TIMECONST | ADJ_TICK)
-
 #define ADJ_ADJTIME 0x8000
 #define LOOPS 10
 
-static struct timex *tim_save;
 static struct timex *buf;
 
 void verify_adjtimex(void)
@@ -54,7 +50,7 @@ void verify_adjtimex(void)
 		if ((TST_RET == -1) && (TST_ERR == EINVAL)) {
 			tst_res(TINFO,
 				"expecting adjtimex() to fail with EINVAL"
-				"with mode 0x%x", ADJ_ADJTIME);
+				" with mode 0x%x", ADJ_ADJTIME);
 		} else {
 			tst_brk(TBROK | TERRNO,
 					"adjtimex(): Unexpeceted error,"
@@ -75,38 +71,15 @@ void verify_adjtimex(void)
 		tst_res(TPASS, "Data leak not observed");
 }
 
-static void setup(void)
-{
-	tim_save->modes = 0;
-	/* Save current parameters */
-	if ((adjtimex(tim_save)) == -1) {
-		tst_brk(TBROK | TERRNO,
-				"adjtimex(): failed to save current params");
-	}
-}
-
-static void cleanup(void)
-{
-	tim_save->modes = SET_MODE;
-
-	/* Restore saved parameters */
-	if ((adjtimex(tim_save)) == -1)
-		tst_res(TWARN, "Failed to restore saved parameters");
-}

There is no point in saving and restoring anything if we pass invalid
mode.

 static struct tst_test test = {
-	.setup = setup,
-	.cleanup = cleanup,
-	.min_kver = "4.16.9",

Also we do not restrict regression test to any kernel version, this
would for example restrict the test from running on stable kernel trees
or distribution kernels where the fix should have been backported.

 	.test_all = verify_adjtimex,
 	.bufs = (struct tst_buffers []) {
 		{&buf, .size = sizeof(*buf)},
-		{&tim_save, .size = sizeof(*tim_save)},
 		{},
 	},
 	.tags = (const struct tst_tag[]) {
 		{"CVE", "2018-11508"},
-		{"linux-git", "3a4d44b61625"},
+		{"linux-git", "0a0b98734479"},

We put in the hash that fixed the problem, not the one that introduced
it. We do not track where bugs were introduced in LTP only where they
were fixed.

 		{},
 	}
 };

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
