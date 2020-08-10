Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D72F240613
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Aug 2020 14:42:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BC7BF3C3155
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Aug 2020 14:42:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id E572A3C08AB
 for <ltp@lists.linux.it>; Mon, 10 Aug 2020 14:41:59 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 644FA200C03
 for <ltp@lists.linux.it>; Mon, 10 Aug 2020 14:41:59 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D291DAF90;
 Mon, 10 Aug 2020 12:42:18 +0000 (UTC)
Date: Mon, 10 Aug 2020 14:42:16 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Filip Bozuta <Filip.Bozuta@syrmia.com>
Message-ID: <20200810124216.GB11869@yuki.lan>
References: <20200807113950.69052-1-Filip.Bozuta@syrmia.com>
 <20200807113950.69052-2-Filip.Bozuta@syrmia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200807113950.69052-2-Filip.Bozuta@syrmia.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] syscalls/mq_timed{send|receive}: Add test
 cases for bad address
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
Cc: laurent@vivier.eu, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Pushed with a minor change, thanks.

I've moved the tst_get_bad_addr() to the setup since that funciton
allocates memory, which would cause failures with large enough -i test
parameter. The diff is:

diff --git a/testcases/kernel/syscalls/mq_timedreceive/mq_timedreceive01.c b/testcases/kernel/syscalls/mq_timedreceive/mq_timedreceive01.c
index d99538e4b..de0505106 100644
--- a/testcases/kernel/syscalls/mq_timedreceive/mq_timedreceive01.c
+++ b/testcases/kernel/syscalls/mq_timedreceive/mq_timedreceive01.c
@@ -17,6 +17,7 @@ static int fd, fd_root, fd_nonblock, fd_maxint = INT_MAX - 1, fd_invalid = -1;
 #include "mq_timed.h"
 
 static struct tst_ts ts;
+static void *bad_addr;
 
 static struct test_case tcase[] = {
 	{
@@ -139,6 +140,8 @@ static void setup(void)
 	tst_res(TINFO, "Testing variant: %s", tv->desc);
 	ts.type = tv->type;
 
+	bad_addr = tst_get_bad_addr(NULL);
+
 	setup_common();
 }
 
@@ -173,7 +176,7 @@ static void do_test(unsigned int i)
 		len -= 1;
 
 	if (tc->bad_ts_addr)
-		abs_timeout = tst_get_bad_addr(cleanup_common);
+		abs_timeout = bad_addr;
 	else
 		abs_timeout = tst_ts_get(tc->rq);
 
diff --git a/testcases/kernel/syscalls/mq_timedsend/mq_timedsend01.c b/testcases/kernel/syscalls/mq_timedsend/mq_timedsend01.c
index 7e220f297..d72f5d41a 100644
--- a/testcases/kernel/syscalls/mq_timedsend/mq_timedsend01.c
+++ b/testcases/kernel/syscalls/mq_timedsend/mq_timedsend01.c
@@ -17,6 +17,7 @@ static int fd, fd_root, fd_nonblock, fd_maxint = INT_MAX - 1, fd_invalid = -1;
 #include "mq_timed.h"
 
 static struct tst_ts ts;
+static void *bad_addr;
 
 static struct test_case tcase[] = {
 	{
@@ -152,6 +153,8 @@ static void setup(void)
 	tst_res(TINFO, "Testing variant: %s", tv->desc);
 	ts.type = tv->type;
 
+	bad_addr = tst_get_bad_addr(cleanup_common);
+
 	setup_common();
 }
 
@@ -184,12 +187,12 @@ static void do_test(unsigned int i)
 	}
 
 	if (tc->bad_msg_addr)
-		msg_ptr = tst_get_bad_addr(cleanup_common);
+		msg_ptr = bad_addr;
 	else
 		msg_ptr = smsg;
 
 	if (tc->bad_ts_addr)
-		abs_timeout = tst_get_bad_addr(cleanup_common);
+		abs_timeout = bad_addr;
 	else
 		abs_timeout = tst_ts_get(tc->rq);
 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
