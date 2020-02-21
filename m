Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A91F51682F3
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Feb 2020 17:13:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 76F2E3C2678
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Feb 2020 17:13:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id B0E673C1BFC
 for <ltp@lists.linux.it>; Fri, 21 Feb 2020 17:13:06 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 272F21004568
 for <ltp@lists.linux.it>; Fri, 21 Feb 2020 17:13:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582301584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UTxgukX+GAG6X0g8N9OSDwJyVJMF84ieEE0pwzX37PU=;
 b=aUGFpE6zDTa+IE03i3Mvy2LoOlz1cGdPt4y30gKs5oPMSai7KCjYgBsm5ge9Ji6qOStsSR
 LUQoI4gZklyD8njO/wE7IO20YWBgNF365YTIgJPRvLHVyYaaG9eGRVCFMTdFG7sacGsx+m
 lu04xQOuK1DGz+M5zdT7RNafJiaTtVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-j2vzO-JgP8yhAfiMTIIAgg-1; Fri, 21 Feb 2020 11:13:01 -0500
X-MC-Unique: j2vzO-JgP8yhAfiMTIIAgg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 056671937FD3
 for <ltp@lists.linux.it>; Fri, 21 Feb 2020 16:13:01 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.43.17.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E44B5C28E
 for <ltp@lists.linux.it>; Fri, 21 Feb 2020 16:13:00 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Fri, 21 Feb 2020 17:12:54 +0100
Message-Id: <bac938d8a2d57653b9f22e55c6d222a990b6a5cf.1582301521.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] lib: fputs() in print_result() is not signal safe
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

We have tests that use tst_res() from signal handler and current
implementation leads to rare hangs if signal arrives in bad time:
  main
   tst_run_tcases
    fork_testrun
     testrun
      run_tests
       run
        tst_res_ -> TINFO from main process
         tst_vres_
          print_result
           fputs
            __lll_lock_wait_private
            <signal handler called>
             tst_res_ -> TINFO from signal handler
              tst_vres_
               print_result
                fputs
                 __lll_lock_wait_private -> HANGS

One example is timer_settime01, where we have TPASS from main process
and TINFO as response to SIGALRM. SIGALRM happening immediately on older
kernels might be a bug, but that is beside the point of this patch.

Replace fputs() with write() to avoid this hang.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 lib/tst_test.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/lib/tst_test.c b/lib/tst_test.c
index 9a24cffc5011..220d7fdfc548 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -181,7 +181,7 @@ static void print_result(const char *file, const int lineno, int ttype,
 {
 	char buf[1024];
 	char *str = buf;
-	int ret, size = sizeof(buf), ssize, int_errno;
+	int ret, size = sizeof(buf), ssize, int_errno, buflen;
 	const char *str_errno = NULL;
 	const char *res;
 
@@ -255,7 +255,17 @@ static void print_result(const char *file, const int lineno, int ttype,
 
 	snprintf(str, size, "\n");
 
-	fputs(buf, stderr);
+	/* we might be called from signal handler, so use write() */
+	buflen = str - buf + 1;
+	str = buf;
+	while (buflen) {
+		ret = write(STDERR_FILENO, str, buflen);
+		if (ret <= 0)
+			break;
+
+		str += ret;
+		buflen -= ret;
+	}
 }
 
 void tst_vres_(const char *file, const int lineno, int ttype,
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
